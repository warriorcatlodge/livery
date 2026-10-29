# Building a Personal Identity Across Platforms

Theme-agnostic. This is the *method* behind any theme in the registry — how one
was built, and the road for building the next. Toolpath is the worked example;
nothing here depends on it.

## Phase 1 — Derive, don't decorate

- Source the identity from the owner's actual life: trades, tools, materials,
  places. Every color, name, and motif should have **provenance** — a real thing
  it traces to. Derived identities extend coherently; decorated ones drift.
- When a surface needs something the palette lacks, derive it from the same
  source material rather than borrowing a generic hue. (Pattern: a missing
  green becomes "what the existing metal corrodes to.")
- Elicit taste before designing: a couple of tappable questions (vibe,
  light/dark), then show something real to react to. Iterate in lettered
  revisions (Rev A, B, C…) with each change traceable to a critique.

## Phase 2 — Canonicalize

- **Named tokens with roles**, not just hexes: each accent gets a name from the
  source material and a job ("structure/measure", "emphasis/action", "rare").
  The vocabulary is half the value — the owner can say the name and mean it.
- **Dual shades** of every token (dark + light) in one spec. This later pays
  for itself (see the ANSI mapping pattern below).
- **Ink tier rule**: three text tiers; the faintest never labels anything.
- **One signature element** that marks work as the owner's (an authorship
  stamp — title block, colophon, monogram). Every artifact carries it.
- Capture *rationale* alongside values in the reference doc. Future builders
  reproduce the point, not just the hexes.

## Phase 3 — Adapt per surface

Carry tokens literally wherever the surface allows; translate the signature
into whatever the surface supports; derive only what's missing.

- **Terminal palettes**: ANSI wants each color as a normal/bright pair — map
  normal = light-shade token, bright = dark-shade token of the *same* token.
  This yields mostly literal spec hexes and makes bright/normal meaningful.
  Check the normal slots against the terminal ground first: if the
  light-shade tokens fall near 3:1 (Conductor's measured 2.4–3.1), invert
  it — normal = the dark-shade token, bright = that token lightened — and
  say so in the theme file. Normal slots carry diffs and test output.
- **Constrained formats** (docx/pptx, OS accent pickers): carry what the format
  supports — palette, type pairing, uppercase letter-spaced labels, the
  signature block rendered as a table or footer. Nearest-preset is acceptable
  when custom values aren't (note which preset and why).
- **Mobile/OS**: wallpaper is usually the highest-leverage surface; system
  tinting (eyedropper off the wallpaper) beats per-icon customization, which
  often costs functionality (badges). Offer tiers by effort.

## Techniques that transfer

- **Print as a first-class surface** (learned on Bricky): set sizes in pt and
  mm, not px, so screen and paper measure alike; make the on-screen page the
  same box as the printed one; force the light shade under `@media print`;
  keep the document complete in black and white and add colour on top, with a
  distinct shape per colour role so a mono copy or a colour-blind reader loses
  nothing. Check with a real PDF render, not the screen.

- **Sentinel-color keying** (shaders/overlays): render an element in a color
  the palette never uses; post-process replaces it. Key on channel
  RELATIONSHIPS, never exact hexes — colorspace conversion (sRGB vs P3)
  shifts sampled values substantially. Prefer **dominance** tests (this
  channel leads the others by N) over absolute thresholds (these channels
  are below N): sRGB #00FF00 samples in P3 with red near 0.46, so "red is
  low" fails while "green leads red" holds. Distinct sentinels per effect,
  and pick sentinels the palette can never approach so the dominance
  margin stays wide. A sentinel showing through raw is a useful signal —
  it means the post-process did not load.
- **Self-normalize against the content, not constants**: measure the shape's
  own bounding box (probe for edges, bridge interior gaps, agree across a
  neighborhood) instead of hardcoding cell/row sizes. Constants tuned to one
  font size or DPI silently break at another.
- **Physical vs logical pixels**: GPU/shader units are physical device pixels —
  half apparent size on 2x displays. Express regions as fractions of
  resolution, not absolute px.
- **Smooth growth**: to thicken a shape, average coverage over a disc
  (golden-angle spiral) and smoothstep-threshold it. `max()` over discrete
  directions produces faceted, pixelated edges. Grow anisotropically
  (separate x/y) when weight is wanted without width.
- **Build debug modes into assets** (banded overlays, key-visualization
  toggles) so field diagnosis is a one-line flip, not a rebuild.

## Debugging discipline

- **Verify, don't infer.** Use the platform's introspection (`+show-config`,
  effective-settings dumps) before concluding how paths or keys resolve.
  Behavioral evidence from one change can be confounded by another (a stale
  file, a cached copy). One wrong inference here cost a full revert cycle.
- Silent failure is the norm: bad paths, uncompilable shaders, and rejected
  keys typically produce *nothing*, not errors. Make the asset's absence
  visible (sentinel colors double as load indicators).
- macOS: downloaded assets carry `com.apple.quarantine`; clear with `xattr`.
  The `@` in `ls -l` is the tell.
- Shell integration can override cursor/prompt settings at runtime; the config
  isn't the whole story.
- Under a dotfile manager (chezmoi etc.): edit the SOURCE, apply, verify the
  target. Killing a stale `edit --wait` session before it clobbers newer edits
  is a real failure mode — check for orphaned editor processes.

## Onboarding checklists

**New surface for an existing theme**
1. What does the surface allow? (custom hex / presets only / images / code)
2. Map literal tokens first; derive gaps from source material; document both.
3. Translate the signature element into the surface's vocabulary.
4. Ship install steps with the *verification command* and known gotchas.
5. Record new gotchas in the theme reference; commit the files beside it under `<theme>/`.

**Second theme**
1. Phase 1 elicitation — new source material, its own names and provenance.
2. Same structure as the first theme's reference (tokens, roles, ink rule,
   signature, conventions) so builders navigate by shape.
3. Registry row in `README.md` + `<theme>/<theme>.md` + `<theme>/<theme>.css`; same
   `[data-theme][data-shade]` selector pattern.
4. Reuse this process doc; extend it when the new theme teaches something.
