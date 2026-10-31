# Solera — Rev B

Derived from the classical guitar on the bench and the score on the stand.
Toolpath is the shop; Solera is the instrument that comes out of it and the
music played on it. Every token traces to a tonewood, an inlay, or a mark on
a staff. Extend from the same source.

First surface: the Obsidian theme for the Solera vault (`obsidian/`).
No artifact stylesheet yet; `solera.css` follows once the palette settles.

## Shades

**Soundboard** (light) is a cedar top under French polish: warm parchment,
never white, never yellow. **Fretboard** (dark) is ebony: near-black with a
brown cast, never blue-black.

## Tokens

| Role | Soundboard (light) | Fretboard (dark) |
|---|---|---|
| ground | `#F3EEE4` | `#16120F` |
| panel | `#EAE3D6` | `#1D1814` |
| inset | `#E1D8C8` | `#251F1A` |
| line | `#D3C8B6` | `#342C25` |
| line strong | `#B2A48F` | `#4C4137` |
| ink | `#211A15` | `#EDE5D8` |
| ink label | `#5C5047` | `#B2A594` |
| ink annotation | `#83776B` | `#887C6E` |
| Rosewood | `#7E2F26` | `#D27C6C` |
| Cedar | `#975226` | `#D99A62` |
| Pearl | `#2F6B70` | `#9CCFCB` |
| Spruce | `#7A5C15` | `#D6B65E` |

Ink on ground is 14.9:1 in both shades. Every accent clears 4.5:1 on ground
and panel except ink annotation, which is annotation only.

## Accent roles

- **Rosewood** (back and sides): links and action. The color you click.
- **Cedar** (the top): structure. H3, tags, hover wash.
- **Pearl** (mother-of-pearl inlay): rare. Fret-marker dots, the active-file
  dot, checked boxes, selection. If it shows up everywhere it stops being inlay.
- **Spruce** (the other top): highlight only.

Supporting woods fill Obsidian's eight named colors for callouts, graph
groups and canvas: olive (green), abalone (blue), purpleheart (purple),
padauk (pink). They are not for general use.

Three-tier ink rule as in the other themes: the faintest tier never labels anything.

## Type

All faces ship with macOS, so the theme needs no font install. Rev A used
Didot and Iowan Old Style; Jeff found them too traditional, so the period
feel comes from the woods and the notation marks, not the type.

- **Avenir Next** (500/600) — headings. Geometric, clean. H4–H6 and table
  headers as tracked caps, like tempo and expression marks.
- **System UI** (SF Pro) — body and interface chrome.
- **SF Mono** — code.

Never IBM Plex (day job), Inter, or Space Grotesk.

## Conventions

- **Staff under every H1**: five hairlines, 4px apart, in line strong.
- **Fret for `---`**: a 2px wire with the 12th-fret double pearl dot.
- **Final barline on blockquotes**: thin + thick bar.
- **Callouts**: square, 3px barline on the left, faint wash. No rounded cards.
- **Tables**: tracked-caps header over a 2px rule, no vertical lines.
- **Active tab**: a 2px rosewood binding strip on top.

## Obsidian

`obsidian/theme.css` + `manifest.json`. Copy both into
`<vault>/.obsidian/themes/Solera/`, then Settings → Appearance → Themes →
Solera. Base color scheme picks the shade (Light = Soundboard, Dark =
Fretboard).
