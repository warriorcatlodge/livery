# AGENTS.md

## themes/ is read by a skill

`warriorcatlodge/skills` ships `artifact-themes`
(`local/content-management/artifact-themes/`), which locates this repo through
its `livery.toml` and then follows `themes/README.md` at `main`: the registry
table, the ask-first protocol, and each `themes/<theme>/<theme>.md` reference
and `<theme>.css`. There is no pin, so a merge here is live for the next
artifact. Keep `themes/README.md` accurate when adding a theme, shade or
surface; the skill itself needs no change unless this repo moves or the entry
file is renamed.
