require("hs.ipc")

local windowLayouts = {
    work = {
        { app = "Google Chrome", screen = 1, unit = { x = 0.00, y = 0.00, w = 0.5, h = 1.00 } },
        { app = "cmux", screen = 1, unit = { x = 0.5, y = 0.00, w = 0.5, h = 1.00 } },
    },
    focus = {
        { app = "cmux", screen = 1, unit = { x = 0.00, y = 0.00, w = 0.5, h = 1.00 } },
        { app = "Google Chrome", screen = 1, unit = { x = 0.5, y = 0.00, w = 0.5, h = 1.00 } },
    },
}

local function shellQuote(value)
    return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

local function userCacheDir()
    local home = os.getenv("HOME")
    if home and home ~= "" then
        return home .. "/Library/Caches/Hammerspoon/window-layout"
    end

    local tmpdir = os.getenv("TMPDIR")
    if tmpdir and tmpdir ~= "" then
        return tmpdir .. "/hammerspoon-window-layout"
    end

    return nil
end

local reportDir = userCacheDir()
if reportDir then
    os.execute("/bin/mkdir -p " .. shellQuote(reportDir))
end

local layoutReportPath = reportDir and (reportDir .. "/window-layout-last.txt") or nil
local initReportPath = reportDir and (reportDir .. "/init-last-loaded.txt") or nil
local activeTimers = {}

local function notifyLayout(message)
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = message,
    }):send()
end

local function writeLayoutReport(name, status, details)
    if not layoutReportPath then
        return
    end

    local file = io.open(layoutReportPath, "w")
    if not file then
        return
    end

    file:write("layout=", name, "\n")
    file:write("status=", status, "\n")
    file:write("timestamp=", os.date("!%Y-%m-%dT%H:%M:%SZ"), "\n")

    for _, line in ipairs(details) do
        file:write(line, "\n")
    end

    file:close()
end

local function availableLayoutNames()
    local names = {}

    for name, _ in pairs(windowLayouts) do
        table.insert(names, name)
    end

    table.sort(names)

    return names
end

local function writeInitReport()
    if not initReportPath then
        return
    end

    local file = io.open(initReportPath, "w")
    if not file then
        return
    end

    file:write("status=loaded\n")
    file:write("timestamp=", os.date("!%Y-%m-%dT%H:%M:%SZ"), "\n")
    file:write("layouts=", table.concat(availableLayoutNames(), ","), "\n")
    file:close()
end

local function retainTimer(timer)
    table.insert(activeTimers, timer)
    return timer
end

local function releaseTimer(timer)
    for index, activeTimer in ipairs(activeTimers) do
        if activeTimer == timer then
            table.remove(activeTimers, index)
            return
        end
    end
end

local function screenForTarget(target)
    if target == nil then
        return hs.screen.mainScreen()
    end

    if type(target) == "number" then
        local screens = hs.screen.allScreens()
        return screens[target] or hs.screen.mainScreen()
    end

    return hs.screen.find(target) or hs.screen.mainScreen()
end

local function firstUsableWindow(app)
    if not app then
        return nil
    end

    local mainWindow = app:mainWindow()
    if mainWindow then
        return mainWindow
    end

    for _, window in ipairs(app:allWindows()) do
        if not window:isMinimized() then
            return window
        end
    end

    return nil
end

local function moveWindow(item)
    local app = hs.appfinder.appFromName(item.app)
    local window = firstUsableWindow(app)

    if not window then
        return false, nil
    end

    if app then
        app:unhide()
    end

    if window:isMinimized() then
        window:unminimize()
    end

    if window:isFullScreen() then
        window:setFullScreen(false)
    end

    local targetScreen = screenForTarget(item.screen)
    if targetScreen then
        window:moveToScreen(targetScreen)
    end

    window:moveToUnit(item.unit)
    window:raise()

    return true, window:frame()
end

local function applyWindowLayout(name)
    writeLayoutReport(name, "started", {})

    local layout = windowLayouts[name]
    if not layout then
        local availableLayouts = table.concat(availableLayoutNames(), ", ")
        writeLayoutReport(name, "unknown-layout", { "available=" .. availableLayouts })
        notifyLayout("Unknown layout: " .. name .. " (" .. availableLayouts .. ")")
        return
    end

    for _, item in ipairs(layout) do
        hs.application.launchOrFocus(item.app)
    end

    local startupTimer
    startupTimer = retainTimer(hs.timer.doAfter(1.0, function()
        releaseTimer(startupTimer)

        local pending = {}
        local details = {}

        for _, item in ipairs(layout) do
            local moved, frame = moveWindow(item)
            if not moved then
                table.insert(pending, item)
            elseif frame then
                table.insert(details, string.format(
                    "app=%s frame=%d,%d,%d,%d",
                    item.app,
                    frame.x,
                    frame.y,
                    frame.w,
                    frame.h
                ))
            end
        end

        if #pending == 0 then
            writeLayoutReport(name, "applied", details)
            notifyLayout("Applied layout: " .. name)
            return
        end

        local attempts = 0
        local retryTimer
        retryTimer = retainTimer(hs.timer.doEvery(0.5, function()
            attempts = attempts + 1

            local remaining = {}
            for _, item in ipairs(pending) do
                local moved, frame = moveWindow(item)
                if not moved then
                    table.insert(remaining, item)
                elseif frame then
                    table.insert(details, string.format(
                        "app=%s frame=%d,%d,%d,%d",
                        item.app,
                        frame.x,
                        frame.y,
                        frame.w,
                        frame.h
                    ))
                end
            end

            pending = remaining

            if #pending == 0 then
                retryTimer:stop()
                releaseTimer(retryTimer)
                writeLayoutReport(name, "applied", details)
                notifyLayout("Applied layout: " .. name)
                return
            end

            if attempts >= 20 then
                retryTimer:stop()
                releaseTimer(retryTimer)

                local missingApps = {}
                for _, item in ipairs(pending) do
                    table.insert(missingApps, item.app)
                end

                table.insert(details, "missing=" .. table.concat(missingApps, ","))
                writeLayoutReport(name, "partial", details)
                notifyLayout("Layout applied with missing windows: " .. table.concat(missingApps, ", "))
            end
        end))
    end))
end

_G.applyWindowLayout = applyWindowLayout
_G.queueWindowLayout = function(name)
    local queueTimer
    queueTimer = retainTimer(hs.timer.doAfter(0, function()
        releaseTimer(queueTimer)
        applyWindowLayout(name or "work")
    end))

    return true
end

hs.urlevent.bind("window-layout", function(_, params)
    applyWindowLayout((params and params.name) or "work")
end)

writeInitReport()

-- HANDLE SCROLLING

local deferred = false

overrideRightMouseDown = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDown }, function(e)
    --print("down"))
    deferred = true
    return true
end)

overrideRightMouseUp = hs.eventtap.new({ hs.eventtap.event.types.rightMouseUp }, function(e)
    -- print("up"))
    if (deferred) then
        overrideRightMouseDown:stop()
        overrideRightMouseUp:stop()
        hs.eventtap.rightClick(e:location())
        overrideRightMouseDown:start()
        overrideRightMouseUp:start()
        return true
    end

    return false
end)


local oldmousepos = {}
local scrollmult = -4	-- negative multiplier makes mouse work like traditional scrollwheel
dragRightToScroll = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDragged }, function(e)
    -- print("scroll");

    deferred = false

    oldmousepos = hs.mouse.getAbsolutePosition()    

    local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
    local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
    local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult},{},'pixel')
    
    -- put the mouse back
    hs.mouse.setAbsolutePosition(oldmousepos)

    return true, {scroll}
end)

overrideRightMouseDown:start()
overrideRightMouseUp:start()
dragRightToScroll:start()
