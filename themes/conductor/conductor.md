# Conductor — Rev H

The theme of `conductor`, the M6 Mac Mini that runs headless as orchestrator,
build machine and utility box. Derived from two sources that meet in one
picture: the mid-century streamliner (the Burlington Zephyrs that ran out of
Denver Union Station, Budd shotwelded stainless, the Santa Fe warbonnet,
departure boards and conductor's punches) and numbers made of dust on a
flickering board: the sand of time in a station after midnight. The palette
is pulled from the 1930s streamliner posters: Broadway Limited green, the
Super Chief's warbonnet, the 20th Century Limited's Hudson steel, dusk skies
with a sunset on the horizon, an oxblood curtain behind them. Worn and used,
not corporate. Gotham, not Zion; a freight hauler, not a flagship. Every
element traces to a railroad or to the machine's own output. Extend from the
same sources.

Stylesheet: `conductor.css` (drop-in, both shades).
Motion: `conductor-dust.js` (dust board + flap settle).

Set on the root: `data-theme="conductor" data-shade="moffat|stainless"`.

## Shades

**Moffat** (dark, the default): the Moffat Tunnel under the Divide, which
the Zephyr runs through west of Denver. Oxblood soot, near-black with the
red cast of the velvet curtain behind a poster wall, lit by sodium. The
ground is a material: dark station terrazzo (`--terrazzo`), oxblood, grey
marble and brass chips set in soot, at 8% so it is felt, not seen. Use for dashboards, status pages, anything about the
machine.

**Stainless** (light): Budd stainless in daylight. A cool brushed
grey, never white and never cream. The ground is the car side itself
bare: flat steel with only grain and a vignette, no ribs. Use for documents and anything read on
paper.

## Tokens

| Role | Moffat | Stainless |
|---|---|---|
| ground | `#130B0B` | `#DDE0E2` |
| panel | `#1B1212` | `#EAECED` |
| inset | `#241817` | `#CFD3D6` |
| line | `#352423` | `#BCC1C5` |
| line strong | `#4D3532` | `#969CA2` |
| ink | `#DADBDE` | `#16181C` |
| ink label | `#A4A6AB` | `#454B53` |
| ink annotation | `#7E8086` | `#62686F` |
| Sodium | `#F2A33C` | `#8C5306` |
| Warbonnet | `#E2503E` | `#A52F1D` |
| Hudson | `#A9B3C1` | `#3F5468` |
| Brunswick | `#7DB592` | `#2A5E41` |
| Dusk | `#A79AD0` | `#574A86` |

Every accent clears 4.7:1 on its own ground and panel; ink label clears 6.6:1.

**Sunset run** (identical in both shades, like Toolpath's temper: it is a
sky, not a palette choice): `#2B2F3E` → `#5E2F2C` 34% → `#B06A48` 68% →
`#F2A33C`. Dusk navy into the copper of every poster horizon and out at
sodium. Always linear. It appears as the hero's horizon glow, the top
speed whisker on a live surface, and the ticket's top edge, never twice on
one surface.

**Flap leaves are always dark** (`--flap`), in both shades, with ink
`#E4E5E8`. A departure board is a physical object; it does not invert in
daylight.

### Accent roles — do not improvise

- **Sodium** (sodium-vapor platform lamps, and the yellow nose stripe of
  the Super Chief): live figures, the
  running state, primary actions, the cursor, the run number on the ticket.
  The theme's voice. If something is moving, it is sodium.
- **Warbonnet** (Santa Fe red): failure, STOP, late, anything that halts the
  train. Never decoration.
- **Hudson** (the Dreyfuss streamlined Hudson on the 20th Century
  Limited, polished blue-steel): structure, measurement, eyebrows, speed
  whiskers, passed stops, neutral data.
- **Brunswick** (the Pennsylvania's Brunswick green, Broadway Limited):
  the CLEAR aspect. Passed, green builds, healthy.
- **Dusk** (the poster sky after sundown): HELD states and genuinely rare
  accents. Overuse kills it.

Sodium, Brunswick and Warbonnet are the three signal aspects
(APPROACH, CLEAR, STOP) and that is how status reads everywhere.

Same three-tier ink rule as the rest of the registry: **the faintest tier
never labels anything.**

## Type

Three faces, three jobs, plus a stencil cut of the display face.

- **Big Shoulders Display** (700/800) — display and headings, always
  uppercase. Condensed gothic built from city signage; it reads as a
  station name over a concourse door.
- **Big Shoulders Stencil Display** (800) — the page's h1 and every
  stenciled marking. Paint sprayed through a stencil onto a car side.
- **Jost** (400/500/600) — body prose at 16px / 1.65, and every label,
  eyebrow and column header. Jost is a Futura revival, the face of the
  streamliner era's timetables and posters.
- **DM Mono** (400/500) — every figure: times, counts, hashes, durations,
  code. Tabular, slashed zero. Numbers are the subject here, so they get
  their own face.

Never IBM Plex (day job). Never Inter or Space Grotesk. Never JetBrains
Mono in a Conductor page; that one is Toolpath's.

```
https://fonts.googleapis.com/css2?family=Big+Shoulders+Display:wght@700;800&family=Big+Shoulders+Stencil+Display:wght@800&family=Jost:wght@400;500;600&family=DM+Mono:wght@400;500&display=swap
```

## Conventions

These are what make it recognizable. Colors alone are not the theme.

**Streamline nose.** Panels carry one large radius (28px) on the leading
top-left corner and 3px everywhere else: the profile of a streamliner's
nose. Buttons and signal pills round the leading end only. Never round all
four corners; that is a card, not a car body.

**Speed whiskers.** Three horizontal stripes in chrome, 3px, each shorter
than the last, rounded at the leading end and cut square at the trailing
end. The hero rule and section openers. One set per surface. `.hot` puts
the sunset run on the top stripe for a live surface.

**Dust board.** The hero backdrop is a board of square cells on a 12px
pitch, drawn on a canvas by `conductor-dust.js`: a dot-matrix departure
board seen through dust. Each cell flickers between dim ink levels on its own
slow clock, densest through the middle band and thinning to nothing at top
and bottom, with a few bright sodium sparks. Every few seconds a time (always a valid
24-hour `HH:MM`) arrives the way a split-flap schedule board changes: each
character flips through digits in sodium, top half first while the old
bottom half still shows, with a dark hinge across its middle, and the
characters land left to right. The digits each character cycles through
are constrained by position, so every in-between frame is also a valid
time. The board behind the figure quiets to a
third so the flaps read. It holds, then erodes left to right like sand off
a ledge, each cell flaring once as it goes. Behind the
board, the poster sky: a sunset glow on the horizon at bottom right and dusk
at the top. The board is masked to 18% on the left so the headline sits on
it without fighting it; figures form only in the right half and only above
700px wide. Nothing falls in columns: Rev A's falling digits read too close
to the Matrix and were cut. Reduced motion holds one figure still.

**Grit.** The theme is used equipment, not a showroom: a poster printed on
cheap stock and a car that has made the run ten thousand times. Three noise
layers, all inline SVG, none an image file:

- `--noise`, fine film grain, over the whole surface (overlay, 14% Moffat,
  18% Stainless) and the car bodies;
- `--scuff`, horizontal scratches like worn paint on a car side, on panels
  and the ticket (overlay, about 30%), stretched once across each body.

The ground itself is a material, not a texture (see Shades): terrazzo by
night, bare stainless by day. Rev C and E tried an abstract mottle and a
brushed swipe; neither meant anything, and the tiled one read as cheap
wallpaper. Every texture has to be something a station or a car is made of.
And it stays quiet: the materials are felt, not seen. Terrazzo chips sit at
8% alpha. Rev G also laid brass divider strips and fluted ribs; the strips
crossed the section rules into an uneven grid and the ribs read as window
blinds. Rev H removed both.

Ink is cool steel grey, not cream: cream read warm and soft against the
oxblood.

The ground carries a dark vignette (`--vignette`) so the page edges burn
in like an old print. Panels carry a short rivet run at the trailing top
edge. Car and equipment markings are stenciled (`.stencil`, Big Shoulders
Stencil): `CAR 04`, `PROPERTY OF CONDUCTOR`. STOP callouts carry a warbonnet
hazard-stripe rule; `.hazard` and `.hazard.sodium` are short stripe bars for
a section that needs a warning. Keep grit in texture and marking, never in
broken layout or illegible text: it sits under the ink, and the ink tiers
keep their contrast.

**Chrome punches.** Polished streamliner trim, used in small hits, never
as a surface. `--chrome` is a bright sky over a hard dark horizon line, the
way chrome reflects a sky over the ground; `--chrome-h` is the same thing
laid sideways for small round or diamond parts. Both are identical in both
shades, because trim does not change in daylight. It goes on:

- the h1, as chrome lettering like the deco nameplates on the posters
  (`--chrome-text`, which is gunmetal in Stainless so it still reads on a
  light ground; solid ink is the fallback outside `@supports`);
- the speed whiskers;
- the bezel around each split-flap leaf;
- the rim of each signal lamp;
- the rim of the primary button;
- the eyelet of the conductor's punch on the ticket.

Nowhere else. Chrome on a panel, a heading below h1 or body text turns the
page into a hubcap.

**Split-flap figures.** The number the dust was gathering into. Key figures
(a build time, a queue depth) sit in `.flap` leaves: one dark leaf per
character with a seam across the middle. `Conductor.settle(el)` flips each
leaf through random digits and lands them left to right. Use on two or
three figures per page, never on running text.

**Timetable leader rows.** `BUILD 4471 ·········· 03:41` for key/value
content, labels in Jost caps, values in DM Mono. Live values take sodium,
late ones warbonnet.

**Route strip for sequences.** A pipeline or deploy reads as a line of stops:
passed stops filled hudson, the current stop lit sodium, a failed stop
warbonnet, times underneath in mono. Only where the order is real.

**Status is a signal aspect.** A lamp dot plus a word: `CLEAR`, `APPROACH`,
`STOP`, `HELD`. Never color alone.

**Callouts carry a 4px left rule** with a rounded nose at the top: warbonnet
for STOP, clear for a recommendation, sodium for something live.

## The signature — punched ticket

Every Conductor artifact ends with a ticket: an inset panel with the nose
radius, four fields, and a perforated stub (a dashed line with half-round
notches top and bottom) holding the conductor's punch. Railroad conductors
each carried a punch with a die shape unique to them; Jeff's is a diamond,
cut clean through to the ground. The
ticket's top edge carries the sunset run.

| TRAIN | RUN | DATE | CONDUCTOR |
|---|---|---|---|
| artifact name, Big Shoulders caps | `A`, `B`… in sodium | ISO `YYYY-MM-DD` | `JDC` |

Bump the run letter on meaningful revisions within a conversation. The
ticket is the thing that marks the work as his; never omit it.

## Accessibility

Status uses a lamp plus a word. Focus-visible rings in sodium on all
interactive elements. The shade toggle carries `aria-label`. The dust
canvas is `aria-hidden` and the grain overlays are pseudo-elements with
`pointer-events: none`; flap figures carry their value in `aria-label`
and hide the leaves. `prefers-reduced-motion` holds the dust on one figure,
sets flaps at once, and disables transitions. Three-state theming on
`data-shade`: `[data-theme="conductor"]` defines Moffat,
`@media (prefers-color-scheme: light)` guarded as `:not([data-shade="moffat"])`
defines Stainless, and `[data-shade="stainless"]` defines it again so the
toggle wins both directions. Conductor is dark-first, the mirror of
Benchmark.

## Terminal (Ghostty)

`ghostty/conductor-moffat.ghostty` — the Moffat shade. Install to
`~/.config/ghostty/themes/conductor-moffat`, then `theme = conductor-moffat`.
On the `conductor` host it is installed by home-manager (see Ports).

The mapping inverts Toolpath's on purpose: **normal slots are the literal
Moffat token, bright slots are the same token lit** (the signal lamp
switched on). Under Toolpath's rule the normal slots measured 2.4 to 3.1:1 on
this ground, and git diffs, test output and logs on a build machine use the
normal slots all day. Red, green and yellow are the three signal aspects.
Cyan is derived: **lunar**, the bluish-white lamp in railroad signalling,
because Conductor has no cyan token.

Pair with DM Mono, or keep a Nerd Font when prompt glyphs are needed.

`conductor-stainless.ghostty` beside it is the light shade. Its normal slots
are the literal Stainless tokens (all clear 4.7:1 on `#DDE0E2`); its bright
slots go deeper, not paler, because a lit lamp in daylight reads darker.
Slots 0 and 7 swap roles from Moffat so black and white output still read.

### Dust shader

`ghostty/conductor-dust.glsl` carries the dust board behind the terminal, very
quietly: square cells at roughly the web board's 12px pitch (sized as a
fraction of window height, because shader pixels are device pixels), mostly
empty, a few lit at 12% or less in line strong and Hudson, and a rare Sodium
spark that swells and fades over several seconds. The dust gathers toward the
bottom-right and thins to nothing at the top-left, so prompts and output sit on
bare ground. It draws only where a pixel is bare `#130B0B`, so ink, cursor and
selection are never touched. A 2px sunset strip runs along the top edge.
`#define STILL 1` with `custom-shader-animation = false` freezes it; `FLIP_Y`
fixes the backend's Y orientation as in Toolpath. The Toolpath shader notes
(`custom-shader` is relative to the config file, `xattr -c`) apply.

## Ports

Every port maps the accent roles the same way: Sodium is live and primary,
Warbonnet is failure only, Brunswick is success, Hudson is structure, Dusk is
rare, and the annotation tier never labels anything. Strings take the derived
lunar (`#7FC4CC` Moffat, `#1F5F66` Stainless).

Paths are relative to this directory.

| Target | File | Shades |
|---|---|---|
| Ghostty | `ghostty/conductor-{moffat,stainless}.ghostty`, `ghostty/conductor-dust.glsl` | both |
| starship | `terminal/conductor-starship.toml` | Moffat, Stainless palette commented |
| tmux | `terminal/conductor-tmux.conf` (styles snippet) | Moffat |
| fzf | `terminal/conductor-fzf.sh` | Moffat, Stainless commented |
| eza | `terminal/conductor-eza.yml` | Moffat |
| lazygit | `terminal/conductor-lazygit.yml` | Moffat |
| btop | `terminal/conductor-btop.theme` (the CPU graph carries the sunset run) | Moffat |
| k9s | `terminal/conductor-k9s.yaml` | Moffat |
| bat / delta | `editors/conductor-{moffat,stainless}.tmTheme`, `editors/conductor-delta.gitconfig` | both |
| Neovim | `editors/nvim/colors/conductor.lua` (follows `background`) | both |
| VS Code | `editors/vscode/` extension, two themes | both |
| macOS | `macos/conductor-macos.sh`, `wallpapers/` (PNG and Dynamic Desktop HEIC), login, folder icons, `live/board.html` for Plash | both |

Diff tints are the accent blended over the ground (Moffat, 14% / 24%) or the
panel (Stainless). Stainless emphasis and selection backgrounds land near
4:1 for syntax text; they only sit under changed words, so that was accepted.

livery's `homeManagerModules.conductor` and `darwinModules.conductor` install
them; the `conductor` host turns both on from the hosts repo. Change a port in
livery and the next deploy picks it up.
