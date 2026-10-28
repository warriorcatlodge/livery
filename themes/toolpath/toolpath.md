# Toolpath — Rev H

Personal theme. Machinist / drafting-room identity: a shop floor and the vellum
drawing that came before the cut. Every element traces to something real from
metalworking, woodworking, or engineering drawing — that's why it reads as
authored rather than decorated. When extending it, extend from the same source.

Stylesheet: `toolpath.css` (drop-in, both shades).

## Shades

Set on the root element: `data-theme="toolpath" data-shade="shop-floor|vellum"`.

**Shop Floor** — dark. The default for interactive tools, dashboards, anything
looked at for a long stretch.

**Vellum** — light. Warm stone-tan ground, never white. Aged drafting paper. Use
for documents, reports, and anything intended for print or long reading.

## Tokens

| Role | Shop Floor | Vellum |
|---|---|---|
| ground | `#14161B` | `#E9E6DF` |
| panel face | `#1C1F26` | `#F4F2EC` |
| inset / track | `#22262F` | `#DDD9D0` |
| line | `#2E333D` | `#CBC6BA` |
| line strong | `#3D4450` | `#A9A396` |
| ink | `#E8EAEE` | `#262B33` |
| ink label | `#9AA1AD` | `#555D68` |
| ink annotation | `#7E8694` | `#6F7680` |
| Dykem blue | `#5B8FBF` | `#35617F` |
| Bearing bronze | `#CE7A46` | `#9C5530` |
| Anneal violet | `#B87AAD` | `#7E4A74` |

**Temper gradient** (identical in both shades — it's a physical spectrum, not a
palette choice): `#E9C86A` → `#E0A036` 28% → `#C06A3E` 52% → `#9A5B8F` 74% →
`#4E86B8`. These are the oxide colors steel actually runs through as it heats.

### Accent roles — do not improvise

- **Dykem blue** (layout fluid machinists paint on stock before scribing):
  structure, measurement, secondary actions, "in tolerance" states, eyebrow text.
- **Bearing bronze** (C93200 bushing alloy): emphasis, primary actions, units,
  warnings, the rev letter. This is the action color.
- **Anneal violet**: section indices and genuinely rare accents. Overuse kills it.

### Ink rule

Three tiers, and **the faintest never labels anything.** Values and content at
full ink; every label, key, column header, and section name at the mid tier;
the faintest tier only for annotation attached to a decorative mark. This rule
exists because the first two drafts failed it and the labels disappeared.

## Type

Two faces only. **Never IBM Plex** — that's the day job, and this theme is
deliberately not that.

- **Chakra Petch** (600/700) — display and headings only. Uppercase,
  letter-spacing .02em. Chosen because its letterforms carry 45° chamfers that
  rhyme with the panel edges.
- **JetBrains Mono** (400/500/600) — *everything else*, including body copy at
  14.5px / 1.75, with tabular numerals enabled globally. Mono body is the whole
  point: uniform character width means every line inherits the grid. It's also
  engineered for sustained reading, unlike most monos.

Google Fonts:
`https://fonts.googleapis.com/css2?family=Chakra+Petch:wght@500;600;700&family=JetBrains+Mono:wght@400;500;600&display=swap`

Scale is deliberately generous — don't tighten it. Nothing sits below ~10.5px.

## Conventions

These are what make it recognizable. Colors alone are not the theme.

**Chamfered edges with a real stroke.** Panels and buttons get a 10px chamfer.
Critically, the diagonal cut must carry a 1px stroke — `clip-path` clips the
border away, so use the two-layer `.cham` primitive (stroke layer clipped at
full chamfer, face inset 1px at a tighter chamfer). An unstroked chamfer reads
as unfinished and undercuts the whole premise.

**Mitered corner bracket.** Each panel carries a 16px bracket at top-right: two
3px bars cut at 45° where they meet, so the seam runs outer corner to inner
corner like a framed miter joint. The gradients meet at bearing bronze exactly
on the seam, so the temper run turns the corner as one continuous piece — straw
in, bronze at the bend, peacock blue out.

**Temper is always linear.** Heated stock is straight — the gradient lives in
rules, strips, bars, and mitered corners, never arcs or rings. Fewer, heavier
instances beat many light ones. **Never cap a temper rule with square end
ticks** — the run terminates clean at straw and peacock; no dimension-line
serifs, no caps, no end markers of any kind.

**Signature gradient at multiple scales, one mark per surface.** The temper
spectrum appears as the hero rule, the panel corner bracket, the title block top
edge, and hot chart bars — but never twice on the same surface.

**Dot-leader spec lists.** `Hotend ······ 245 °C` for any key/value content.
The alignment is only honest in monospace, which is the point.

**Blueprint grid** backdrop on heroes (32px, at ~6% accent opacity), with a 45°
**section hatch** in the hero corner only — drafting shorthand for a cut surface.

**Hot bars.** When a bar should read as intensity, put the full temper gradient
on the *track* as a fixed scale and cover the unfilled remainder. Scoping the
gradient to the fill amputates the spectrum and kills the metaphor.

**Status is color plus text**, never color alone. `IN TOL`, `RECUT`, `PENDING`.

## The signature — title block

Every Toolpath artifact ends with a drafting title block: a four-cell monospace
strip with the temper gradient on the **top edge only** (don't use
`border-image`, it restyles all four sides — position a 3px strip).

| TITLE | REV | DATE | DRAWN |
|---|---|---|---|
| artifact name, uppercase | letter, in bronze | ISO `YYYY-MM-DD` | `JDC` |

Bump the rev letter on meaningful revisions within a conversation. This block is
the thing that marks the work as his — never omit it.

## Accessibility notes already handled

Status uses color + label. Focus-visible rings on all interactive elements.
Mode toggles carry `aria-label`. Decorative marks are `aria-hidden`. Outline
type (`-webkit-text-stroke`) always ships with a solid fallback outside
`@supports`. `prefers-reduced-motion` disables transitions.

## Terminal (Ghostty)

`ghostty/toolpath-shop-floor.ghostty` — the Shop Floor shade as a Ghostty theme.
Install to `~/.config/ghostty/themes/toolpath-shop-floor`, then `theme =
toolpath-shop-floor`. Ghostty does not support trailing comments; keep notes on
their own lines.

13 of 16 ANSI slots are literal spec hexes. The mapping exploits the fact that
every accent token has two canonical values — one per shade — and ANSI wants
every color in a normal/bright pair: **normal slots take the Vellum value,
bright slots take the Shop Floor value of the same token.** So red is bearing
bronze at both shades, blue is dykem at both, magenta is anneal violet at both.
Yellow pairs the temper amber and straw stops; cyan is temper peacock; the
grays come from the ink and line tiers. Cursor is bearing bronze.

Only three slots are derived, because Toolpath has no green and no color lighter
than temper peacock: green and bright green are **verdigris** (what bearing
bronze corrodes to — a material derivation, not a borrowed hue), and bright cyan
is peacock lightened. Green is load-bearing in a terminal (diff additions,
success states), so it cannot be dropped or aliased to an existing token without
making git output ambiguous.

Pair with JetBrains Mono to complete the identity.

Derive any future terminal or editor theme the same way: extend from the source
material, never from a generic palette.

### Grid shader

`ghostty/toolpath-grid-glyph.glsl` — carries the hero blueprint backdrop into the
terminal. Ghostty takes Shadertoy-format GLSL with `iChannel0` as the rendered
terminal, so the grid is composited *behind* the text: the shader measures each
pixel's distance from the ground color and suppresses the grid wherever there is
ink, meaning glyphs, cursor and selection are never dimmed.

Draws a 32px minor grid with a heavier line every 5 cells, the 45° section hatch
in the top-right corner, a 2px temper strip on the top edge, and repaints the
cursor with the temper spectrum running diagonally across the block — echoing
the mitered corner bracket. The cursor recolor keys on `iCurrentCursorColor`, so
Ghostty still draws the cursor and its inverted glyph stays readable; blink works
for free. An alternate mode maps the gradient to the cursor's position across the
line, so it heats from straw to peacock as you type.

Keep everything in one shader file: on the OpenGL backend Ghostty renders only
the last `custom-shader` when several are given.

**`custom-shader` is a path relative to the config file, not a name.** Unlike
`theme`, Ghostty does not look in a shaders directory: it expands a relative
path against the directory holding the config file, so with
`~/.config/ghostty/config` write `custom-shader = shaders/toolpath-grid-glyph.glsl`.
A bare filename looks for `~/.config/ghostty/toolpath-grid-glyph.glsl` and, when
that is missing, the shader is silently skipped. Absolute paths and `~/` both
work; under nix, point at the store path. Downloaded `.glsl` files also carry
the macOS quarantine attribute; clear it with `xattr -c`.

Shader lengths are in **physical device pixels**, so on a Retina display every
spacing renders at half its apparent size. Express anything meant to read as a
region (the corner hatch) as a fraction of `iResolution`, not an absolute pixel
count, or it will be invisible on high-density screens.

The `iCurrentCursor` uniform does not populate for bar or underline cursor
styles, only block. A cursor effect that depends on that rect will silently do
nothing; keying on the cursor's color instead is portable.

Ghostty's shell integration forces a bar cursor at every prompt and overrides
both `cursor-style` and `cursor-color`, so those settings appear inert. The
cursor effect therefore requires `shell-integration-features = no-cursor`, which
disables only the cursor behavior and leaves prompt marking and directory
tracking intact. `cursor-invert-fg-bg` also overrides `cursor-color` entirely. Never samples
`iTime`, so it is free to run with `custom-shader-animation = false`. Y-axis
orientation differs between the Metal and OpenGL backends; the `FLIP_Y` define
at the top corrects it if the strip lands on the wrong edge.

## macOS

`macos/toolpath-macos.sh` applies the system pieces: selection/highlight to
Dykem via `AppleHighlightColor` (custom hex works even though the Settings UI
only shows presets), accent to Orange as nearest-preset to bearing bronze
(accent takes presets only — Blue if Dykem should win instead), dark mode, and
wallpaper. 5K desktop wallpapers for both shades come from the generator; the
chamfered folder icon applies per-directory with `fileicon`. Highlight and
accent need a log-out to reach every app.

## Windows

`windows/` — one WinGet Configuration (`configuration.dsc.yaml`)
applies Shop Floor to Windows 11: Windows Terminal, VS Code and JetBrains Mono
Nerd Font from winget; dark mode; bearing bronze as the accent; the Windows
Terminal fragment; the 16:9 wallpaper. Run `winget configure -f
configuration.dsc.yaml` from that directory; `README.md` has verification and
revert. Unlike macOS, Windows takes a custom accent, so bronze goes in exactly —
as an ABGR DWORD, `#CE7A46` → `0xFF467ACE`. `AutoColorization` must be off or
the next wallpaper change overwrites it. Wallpaper is a registry value and only
repaints at the next sign-in.

`toolpath.wt.json` carries both shades. Shop Floor is the Ghostty theme slot for
slot. Vellum cannot use the normal/bright rule: the Shop Floor halves measure
2.6–2.8:1 on stone-tan, so bright repeats normal (as Conductor Stainless does),
and five slots are taken darker at the same hue until they pass 4.5:1 — bronze
(spec measures 4.49), verdigris, amber, bright cyan, annotation. The table is in
the README.

## Omarchy

`omarchy/` — Shop Floor as an Omarchy theme directory,
built against Omarchy 3.8.4's file list. `colors.toml` is the source: Omarchy
3.x renders every themed config it isn't handed from it, so foot, helix,
Obsidian and the keyboard come free. The other files override templates where
one accent isn't enough: Hyprland borders bronze, solid (temper never rings);
btop carries the temper run on temperature, its one appearance; waybar reads as
a DRO, tabular figures in dykem, the active workspace bronze with a bar under
it. `neovim.lua` embeds the scheme as a LazyVim colorscheme function, since
there is no Toolpath plugin to point at.

Install by copy — `omarchy-theme-install` needs a repo whose root *is* the
theme: `cp -r` the directory to `~/.config/omarchy/themes/toolpath`, then
`omarchy-theme-set toolpath`. Omarchy themes are single-shade; Vellum would be a
second directory (`toolpath-vellum`) built from the Windows Vellum slots. Omarchy
4.0 (alpha on master) refuses `.lua`, terminal configs and `vscode.json` from
git-installed themes and moves Hyprland to `hyprland.lua`; `colors.toml` still
carries the palette there.
