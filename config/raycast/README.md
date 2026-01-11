# Raycast 設定

このディレクトリにはRaycastの設定ファイルが含まれています。

## 設定ファイル

- `settings.rayconfig`: Raycastの設定エクスポートファイル
  - Snippets（テキスト展開）
  - Quicklinks（URLショートカット）
  - Hotkeys（キーボードショートカット）
  - Extensions設定

## セットアップ方法

1. Raycastを起動
2. `Settings...` を開く（`⌘,`）
3. `Advanced` タブを選択
4. `Import Configuration` をクリック
5. `config/raycast/settings.rayconfig` を選択
6. インポートを確認

## 設定の更新

設定を変更した後、新しいエクスポートファイルで上書き：

1. Raycast Settings → Advanced → Export Configuration
2. エクスポートしたファイルを `config/raycast/settings.rayconfig` に上書き
3. Gitでコミット

## 注意事項

- `.rayconfig`ファイルは暗号化された形式です
- 直接編集はできません
- 設定の変更はRaycast UIを通じて行い、再エクスポートしてください
- 個人情報（APIキーなど）が含まれる場合は`.gitignore`への追加を検討してください
