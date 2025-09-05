## Codex 連携ガイド

### 目的
Codex から **Claude Code** が呼び出された際に、
Claude Code は Codex との対話コンテキストを保ちながら、複数ターンに渡り協働する。

---

### Codex の使い方
- ターミナルで以下を実行すると Codex と対話できる。
```bash
codex <<EOF
<質問・依頼内容>
EOF
