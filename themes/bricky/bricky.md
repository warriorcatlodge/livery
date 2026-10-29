# Bricky — Rev A

Derived from interlocking toy bricks: the plastic kind with studs on top, and the
oversized toddler version with studs twice the size. Not their branding, their
*engineering*. A brick is one flat colour all the way through, it clicks onto a
fixed grid, and a child can sort a pile of them by colour and by shape without
being told how. Bricky takes those three properties and nothing else. Extend it
from the same source: if a new element can't be explained as a piece, a plate,
a stud or the grid, it doesn't belong.

First application: music education and theory. Print is a first-class medium,
not an export. Design the paper page first and let the screen follow.

Stylesheet: `bricky.css` (drop-in, both shades, plus the print rules).

Set on the root: `data-theme="bricky" data-shade="baseplate|tray"`.

## Shades

**Baseplate** is the light shade, the usual one, and the only one that prints:
white ground, black ink, flat colour pieces. `@media print` forces it whatever
the screen shows, because paper is white and toner is black.

**Tray** is dark, for screens only: the grey of a sorting tray, with the pieces
brightened so they still read against it.

## Tokens

| Role | Baseplate | Tray |
|---|---|---|
| ground | `#FFFFFF` | `#1A1C20` |
| panel | `#F6F6F3` | `#22252A` |
| inset | `#ECECE7` | `#2B2F35` |
| line | `#D6D6D0` | `#383C43` |
| line strong | `#9C9C94` | `#555A62` |
| ink | `#111111` | `#E9EAEC` |
| ink label | `#4A4F57` | `#A4A9B1` |
| ink annotation | `#6D737C` | `#868C95` |
| Red | `#C42B25` | `#FF6B5E` |
| Yellow | `#F5C400` | `#F5C400` |
| Blue | `#0057A8` | `#5AA9FF` |
| Green | `#007A3D` | `#3DCB7F` |
| on fill | `#FFFFFF` | `#1A1C20` |
| on yellow | `#111111` | `#1A1C20` |

Measured contrast: white on Red 5.65:1, white on Blue 7.2:1, Green on white
5.45:1, black on Yellow 11.5:1; on Tray every piece colour clears 6:1 against
the ground. Yellow is never text on white: it fails, so it is always a fill
with dark ink on it.

## The four pieces — colour roles, do not improvise

The palette is the four primary brick colours, and each one is also a **shape**.
Shape carries the meaning when colour can't: on a greyscale copy, from a
colour-blind reader, on a faded print.

| Piece | Shape | Role | In music |
|---|---|---|---|
| **Red brick** | rectangle with two studs on top | where you are: position, step, the one thing to look at | left-hand position (Roman numeral) |
| **Blue round** | circle | structure: which line, which string, which part | string number |
| **Green letters** | bold green type, no container | the answer: names, correct, go | note name, at sounding pitch |
| **Yellow tile** | square, dark letter | what the hand does; highlight fill | right-hand finger p i m a |

Main notation stays black. Colour is only ever added *on top of* a complete
black-and-white document, so a mono print loses the colour and keeps the music.
In a score, left-hand finger numbers belong to the main notation and stay black.

Same three-tier ink rule as the other themes: **the faintest tier never labels
anything.**

## The grid

Everything sits on the brick module, in millimetres, so the page and the screen
measure the same:

| Unit | Size | Use |
|---|---|---|
| stud | 8 mm | margins in pairs, gutters, the key's spacing, stud-row pitch |
| plate | 3.2 mm | vertical rhythm: gaps between blocks, panel padding |
| brick | 9.6 mm (3 plates) | larger vertical steps |
| edge | 0.6 mm | corner radius: a moulded edge, never a pill |
| rule | 0.35 mm | every line: survives a laser printer, never a hairline |

The page is US Letter at 0.5 in margins (`@page { size: letter; margin: 12.7mm }`).
On screen a `.sheet` is the paper itself, the same box, so what you see is what
prints.

## Type

Two faces. Never IBM Plex (day job).

- **Fredoka** (500/600/700): titles and the few big numerals, including the
  Roman numerals inside a red brick. Round terminals and chunky weight, the way
  a moulded part has no sharp corners.
- **Atkinson Hyperlegible** (400/700): everything that is read. Drawn by the
  Braille Institute so that 1/l/I, 0/O and similar pairs never get confused,
  which matters more to a learner than to anyone else. Tabular figures on.

```
https://fonts.googleapis.com/css2?family=Fredoka:wght@500;600;700&family=Atkinson+Hyperlegible:wght@400;700&display=swap
```

Sizes are set in points because the page is the primary medium: 26 pt title,
13 pt section, 11 pt body, 8.5 pt bold labels. Nothing printed below 6 pt.

**Capitalization follows Apple's Human Interface Guidelines.** Title case for
titles, headings, labels, buttons, tabs and key entries (articles, short
prepositions and coordinating conjunctions stay lowercase unless first or last);
sentence case for anything written as a sentence. No all-caps labels and no
wide letter-spacing: weight and size carry the hierarchy.

## Conventions

**Flat.** No gradients, no shadows, no transparency in a piece. A brick is one
colour all the way through. (The radial gradient in `.studs` only draws round
dots; it is not shading.)

**One stud row per surface.** A row of studs at 8 mm pitch marks a plate's top
edge: the head of a sheet, nowhere else. A field of studs is wallpaper; one row
is a part.

**Pieces on top of ink.** Build the black-and-white document first and add the
pieces to it. If removing every piece leaves something unusable, the pieces are
doing the ink's job.

**Shape before colour.** Introduce a new role only with a shape no other role
uses. Four roles is the palette; a fifth needs a reason and a new shape.

**Status is shape plus text.** A red brick says *here*, a green word says *yes*;
never colour alone.

## The signature — build tag

Every Bricky artifact ends with a build tag: a ruled strip, black edge, five
cells.

| pieces | TITLE | REV | DATE | BUILT |
|---|---|---|---|---|
| a red square, yellow square, blue circle, green square | artifact name, title case | letter, in red | ISO `YYYY-MM-DD` | `JDC` |

The four pieces are the colour key in miniature, so the tag also explains the
page. It prints. Bump the rev letter on meaningful revisions.

## Music engraving notes

Worked example: the one-page score sheets in the Solera project (Romanza,
Celeste y Blanco), drawn with VexFlow.

- Staff, notes, rests, barlines and LH finger numbers in ink.
- Position brick sits above each bar, left-aligned to its first note; the bar
  number in label ink to its left.
- Each note's annotation chip is `green name · blue round · yellow tile`,
  centred on the string circle. Upper voice above the staff, bass and inner
  voices below, aligned across the row.
- When chips would touch, a single-note chip stands up (name over round over
  tile) instead of shrinking.
- A sheet always fits one page: rows are measured after drawing, stacked tight,
  and the whole score scales to the space left. At least four bars per line.

## Accessibility notes already handled

Every role has a distinct shape. Yellow only behind dark ink. Focus rings in
Blue on interactive elements. Print forces the light shade and exact colour.
`prefers-reduced-motion` disables transitions.
