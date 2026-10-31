# Bricky — Rev B

Taken from what makes toy-brick sets easy to read: a few primary colours, flat
fills, and nothing on the page that doesn't explain something. The source is that
simplicity and clarity, not the bricks themselves, so there are no studs, brick
outlines or toy references anywhere. Extend it the same way: one more element
has to earn its place by making the page clearer.

First application: music education and theory. Print is a first-class medium,
not an export. Design the paper page first; the screen shows that same page.

Stylesheet: `bricky.css` (drop-in, includes the print rules).

Set on the root: `data-theme="bricky"`.

## One shade: Paper

White page, black ink, four primary colours. There is no dark shade: the page
on screen is the page that prints, lying on a light grey desk. Dark mode would
give a different document from the paper one, and the paper one is the point.

## Tokens

| Role | Value |
|---|---|
| page | `#FFFFFF` |
| desk (behind the page on screen) | `#E4E4DF` |
| panel | `#F6F6F3` |
| inset | `#ECECE7` |
| line | `#D6D6D0` |
| line strong | `#9C9C94` |
| ink | `#111111` (`#000000` in print) |
| ink label | `#4A4F57` |
| ink annotation | `#6D737C` |
| Red | `#C42B25` |
| Yellow | `#F5C400` |
| Blue | `#0057A8` |
| Green | `#007A3D` |
| on fill | `#FFFFFF` |
| on yellow | `#111111` |

Measured contrast: white on Red 5.65:1, Blue on white 7.2:1, Green on white
5.45:1, black on Yellow 11.5:1. Yellow is never text on white: it fails, so it
is always a fill with dark ink on it.

## The four colour roles — do not improvise

Each primary colour has one job and one shape. Red and green are both bare
text; what they say tells them apart (a Roman numeral against a letter and
octave). Set Roman numerals in Atkinson Hyperlegible, whose serifed I can't be
mistaken for a barline or a 1. Shape carries the meaning when
colour can't: on a greyscale copy, for a colour-blind reader, on a faded print.

| Colour | Shape | Role | In music |
|---|---|---|---|
| **Red** | Roman numeral, bold, no container | where you are: position, step, the one thing to look at | left-hand position (Roman numeral) |
| **Blue** | ring (outlined circle, number centred in blue), the engraving convention for string numbers | structure: which line, which string, which part | string number |
| **Green** | bold note name, no container | the answer: names, correct, go | note name, at sounding pitch |
| **Yellow** | square (dark letter) | what the hand does; highlight fill | right-hand finger p i m a |

Main notation stays black. Colour is added on top of a complete black-and-white
document. In a score, left-hand finger numbers belong to the main notation and
stay black.

Same three-tier ink rule as the other themes: **the faintest tier never labels
anything.**

## Grid

Metric, so the page and the screen measure the same:

| Token | Size | Use |
|---|---|---|
| `--unit` | 8 mm | margins in pairs, gutters, key spacing |
| `--gap` | 3.2 mm | vertical rhythm: gaps between blocks, panel padding |
| `--gap-3` | 9.6 mm | larger vertical steps |
| `--edge` | 0.6 mm | corner radius, small, never a pill |
| `--rule` | 0.35 mm | every line: survives a laser printer, never a hairline |

The page is US Letter at 0.5 in margins (`@page { size: letter; margin: 12.7mm }`).
On screen a `.sheet` is the paper itself, the same box, so what you see is what
prints. A printed sheet is 234 mm tall, not the full 254 mm, because Safari and
Chrome print their own header and footer inside the margins; layout is fitted to
that print box on every device, never to the screen it happens to be drawn on.
When space runs short, the header compresses (title, meta and key on two lines)
before the score shrinks.

## Type

Two faces. Never IBM Plex (day job).

- **Fredoka** (500/600/700): titles only.
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

**Flat.** No gradients, no shadows, no transparency. Every fill is one solid colour.

**Colour on top of ink.** Build the black-and-white document first and add the
colour roles to it. If removing every colour leaves something unusable, the
colour is doing the ink's job.

**Shape before colour.** A new role needs a shape no other role uses. Four roles
is the palette; a fifth needs a reason.

**Status is shape plus text.** A red numeral says *here*, a green word says *yes*;
never colour alone.

**Colour bar.** The four primaries side by side, once, under the page title.

## The signature: the tag

Every Bricky page ends with a tag: a ruled strip, black edge, five cells.

| colours | TITLE | REV | DATE | BY |
|---|---|---|---|---|
| a red square, yellow square, blue circle, green square | artifact name, title case | letter, in red | ISO `YYYY-MM-DD` | `JDC` |

The four colours are the key in miniature, so the tag also explains the page.
It prints. Bump the rev letter on meaningful revisions.

## Score annotation layout

These rules are for guitar scores (worked example: the one-page score sheets in
the Solera project, Romanza and Celeste y Blanco, drawn with VexFlow). Keep each
mark where a player's eye already is: technique next to the note, names in a band.

**On the staff, in ink**
- Staff, notes, rests, barlines, ties and left-hand finger numbers (1–4, left of
  the notehead) are black. They are the music; nothing coloured replaces them.
- Measure number: a small Arabic numeral (8 units, label ink) at the top-left
  corner of every measure, just above the top line. Pickups and split bars that
  continue a measure carry no number.

**Next to each notehead, left to right after any dot**
- String: a blue ring (outlined circle, number centred in blue), the standard
  engraving mark for a string. Never a filled circle.
- Right hand: a yellow square with p, i, m or a, directly after the ring. A tied
  or slurred note shows `tie` or `sl` in label ink instead of a square.
- The formatter reserves this room (VexFlow `StringNumber` slot on the right),
  so notes space themselves around it instead of colliding. In a chord each
  note gets its own ring and square at its own height.

**Above the measure**
- Position: a bare red Roman numeral (bold body face, no box), left-aligned to the
  measure's first note, on one line across the row. `0` means open position.
- A move to a new position inside the measure gets its own red numeral on the
  same line, over the first note or beat that needs the new position. The
  measure's own numeral shows only where the hand starts.
- Section labels (Fine, Tiempo de Gato, 1., 2. D.C.) sit to the right of the
  measure's position numeral in bold label ink.

**Note-name bands**
- Note names in green at concert octave (open G = G3, low E = E2), with no
  explanation on the page: the octave convention is standard.
- Upper voice: names in a band above the staff. Bass and inner voices: a band
  below. Each name is centred on its notehead; chords stack names, highest
  on top. Bands are aligned across the whole row, so names line up.

**Scale and fit**
- Marks on the staff are small (ring 8.8 units wide, square 8.6) so every note
  is annotated the same way, with no switch to a different layout in dense bars.
- Each measure gets VexFlow's minimum width plus 20% and a margin. Spare room
  in a row is shared per note column, not per measure, so a measure of a few
  long notes doesn't stretch wide next to a busy one. At least four measures per line.
- A sheet always fits one US Letter page: rows are measured after drawing,
  stacked tight, and the whole score scales to the space left.

## Accessibility notes already handled

Every role has a distinct shape. Yellow only behind dark ink. Focus rings in
Blue on interactive elements. Print keeps exact colour.
`prefers-reduced-motion` disables transitions.
