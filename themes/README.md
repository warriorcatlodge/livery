# Themes

Jeff's visual identity: three themes, each with a dark and a light shade,
each derived from real material and carrying one signature element that
marks the work as his. This directory is the single source for every surface,
from an HTML artifact to a terminal to a wallpaper. The `artifact-themes`
skill in `warriorcatlodge/skills` reads this file and drives everything below
from it; nothing about the themes lives there.

## Registry

| Theme | Shades | Usual | Use for |
|---|---|---|---|
| **Toolpath** | Shop Floor (dark) · Vellum (light) | Shop Floor | Personal projects: woodworking, 3D printing, home automation, classical guitar, technical study |
| **Benchmark** | Section (light) · Till (dark) | Section | Land, property and construction: the Granville estate, renovation scopes, budgets, site and systems work, anything about a place rather than a workpiece |
| **Conductor** | Moffat (dark) · Stainless (light) | Moffat | The `conductor` Mac Mini and everything it runs: orchestration, builds, CI, runners, dashboards and status pages for the machine, its terminal |

"Usual" is the shade meant when Jeff says "usual" or names only the theme:
Toolpath is looked at for long stretches, property work is read on paper, the
machine is watched at night.

## Protocol: ask before building

Before building any artifact with a visual surface (HTML pages, dashboards,
slides, docs), ask which theme and shade. Use the host's multiple-choice
question tool if it has one (tappable options on claude.ai, AskUserQuestion in
Claude Code), otherwise a short plain question, phrased as theme + shade pairs.
Skip the question when he names the theme, says "usual" (Toolpath · Shop
Floor), when the artifact has no visual surface, or when iterating on an
already-themed artifact.

## Applying a theme

Each theme is a directory here. Read its reference before building and ship
its stylesheet with the artifact (publish it beside the page, or inline it)
rather than retyping tokens.

| Theme | Reference | Artifact assets |
|---|---|---|
| Toolpath | `toolpath/toolpath.md` | `toolpath/toolpath.css` |
| Benchmark | `benchmark/benchmark.md` | `benchmark/benchmark.css` |
| Conductor | `conductor/conductor.md` | `conductor/conductor.css` + `conductor/conductor-dust.js` |

Set `data-theme="<theme>" data-shade="<shade>"` on the root element. Each
reference holds the tokens, type, conventions and the signature element, and
lists the platform ports (terminal, editor, shaders, wallpapers, macOS,
Windows, Omarchy) that sit beside it in the same directory.

## Extending

`process.md` is the method: how a theme is derived, canonicalized and adapted
to a new surface, and the checklists for a new surface or a new theme. A new
theme adds a row to the registry above and a `<theme>/` directory with
`<theme>.md` and `<theme>.css`; a new surface adds files beside them and a
section to the reference.
