# Benchmark — Rev A

Derived from the county plat book, the deed record, and the glacial till under Licking County. Where Toolpath is a shop and a workpiece, Benchmark is a parcel and what's under it. Every element traces to land surveying, county records, or soil — extend from the same source.

Stylesheet: `benchmark.css` (drop-in, both shades).

Set on the root: `data-theme="benchmark" data-shade="section|till"`.

## Tokens

| Role | Section (light) | Till (dark) |
|---|---|---|
| ground | `#E7E8E0` | `#161815` |
| panel | `#F2F2EC` | `#1E211C` |
| inset | `#DBDCD2` | `#262A23` |
| line | `#C6C8BB` | `#333830` |
| line strong | `#A3A697` | `#474D42` |
| ink | `#1E2321` | `#E6E8E0` |
| ink label | `#525A54` | `#A0A79B` |
| ink annotation | `#7A8179` | `#7E857A` |
| Bluestone | `#33505E` | `#6E93A4` |
| Oxide | `#A9472A` | `#D2704C` |
| Verdigris | `#3F7259` | `#6BA98A` |
| Brass | `#8A6E32` | `#C4A24F` |

**Section** is pale linen plat paper — a sage-grey off-white, never cream and never white. **Till** is glacial subsoil: near-black with a green-brown cast.

## Accent roles — do not improvise

- **Bluestone** (the flagstone quarried across the region): structure, measurement, dimensions, eyebrows, neutral data, section rules.
- **Oxide** (iron-oxide barn paint): the emphasis color. Risk, cost, the numbers that decide something, the weather-critical bar.
- **Verdigris** (a copper cupola gone green): resolved, confirmed, savings, recommended states.
- **Brass** (a survey monument disk): the signature disk and the rev mark only. Nowhere else.

Same three-tier ink rule as Toolpath: **the faintest tier never labels anything.**

## Type

Three faces, three jobs — a record book has all three.

- **Bitter** (600/700) — display and headings. A slab serif with the weight of a printed county record.
- **Barlow Semi Condensed** (400/500/600) — all labels, tables, data, eyebrows, tabular figures. Condensed because plat lettering is condensed to fit inside a parcel.
- **Source Serif 4** (400/600) — running body prose, at ~16.5px / 1.68. Deed and brief text is set in a serif; this is a document meant to be read.

Never IBM Plex (day job). Never Inter or Space Grotesk.

```
https://fonts.googleapis.com/css2?family=Bitter:wght@600;700&family=Barlow+Semi+Condensed:wght@400;500;600&family=Source+Serif+4:opsz,wght@8..60,400;8..60,600&display=swap
```

## Conventions

These are what make it recognizable. Colors alone are not the theme.

**Corner monument.** Every panel carries an L-tick at **top-left** — two 2px bars, 20px long, in bluestone, sitting on the border — with a 5px filled oxide square inset at 5px. A surveyed corner: the tick is the line, the square is the iron pin. (Toolpath's bracket is top-right and mitered; Benchmark's is top-left and square. Don't mix them.)

**Contour hero.** The hero backdrop is topographic contour lines, drawn generatively on a canvas via marching squares over a sine-sum height field — never hand-authored SVG paths. Eight levels, alternating 0.46 / 0.24 alpha in bluestone, 50% canvas opacity. Redraw on resize and on shade change, reading the stroke color from the computed custom property so it follows the shade.

**Dot-leader spec rows.** `PRIMARY BEDROOM ········ 290` for any key/value or area content, set in Barlow Semi Condensed with tabular figures and a dotted leader in line-strong. Core and structural rows take bluestone; totals take oxide.

**Stationing for sequences.** Where content is genuinely a line with distance along it — a construction schedule, a phased plan — number the rows as survey stations: `STA 0+00`, `STA 11+00`. Only use this where order and interval carry real information. Never as decoration.

**Earth hatch for what's below grade or at risk.** A 45° repeating hatch at ~16% bluestone, applied to callouts about foundations, septic, buried utilities, or unresolved risk. Architectural section shorthand for earth. Sparingly — two or three per document.

**Callouts carry a 3px left rule**, oxide for risk and verdigris for a recommendation. Never centered, never a rounded card.

**Status is color plus text.** `SPEND FIRST`, `SKIP`, `GATE 3 FIRST` — bordered pills in Barlow, never color alone.

## The signature — benchmark disk

Every Benchmark artifact ends with a survey monument: a 104px circle in brass, 2px border with a second inset ring at 7px and 50% opacity, on the inset ground. Three stamped lines centered — an uppercase label, the project name in Bitter 700, and the location. Beside it, a four-cell metadata strip:

| PROJECT | REV | DATE | DRAWN |
|---|---|---|---|
| project name | letter, in brass | ISO `YYYY-MM-DD` | `JDC` |

Bump the rev letter on meaningful revisions within a conversation. This disk is the thing that marks the work as his — never omit it.

## Accessibility

Status uses color plus label. Focus-visible rings in oxide on all interactive elements. The shade toggle carries `aria-label`. The contour canvas is `aria-hidden`. `prefers-reduced-motion` disables transitions. Three-state theming on `data-shade` (`data-theme` names the theme): `[data-theme="benchmark"]` defines Section, `@media (prefers-color-scheme:dark)` guarded as `:not([data-shade="section"])` defines Till, and `[data-shade="till"]` defines it again so the toggle wins both directions. With no `data-shade`, the OS preference decides.
