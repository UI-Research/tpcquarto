-- slides.lua
-- Pandoc/Quarto Lua filter for TPC RevealJS slides

function Div(el)
  -- Two-column grid layout
  if el.classes:includes("two-col") then
    if FORMAT:match("revealjs") or FORMAT:match("html") then
      el.attributes["style"] = "display:grid;grid-template-columns:1fr 1fr;gap:1.5rem;align-items:start;"
      return el
    end
  end

  -- Section divider slide (full-slide dark background)
  if el.classes:includes("section-slide") then
    if FORMAT:match("revealjs") then
      el.attributes["data-background-color"] = "#174a7c"
      return el
    end
  end

  -- Colored boxes — pass through as-is in HTML/RevealJS (handled via CSS)
  for _, box in ipairs({"box-teal", "box-deepblue", "box-light", "note-box"}) do
    if el.classes:includes(box) then
      return el
    end
  end

  return el
end
