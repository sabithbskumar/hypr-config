hl.layer_rule({
  name = "blur-ags",
  match = { namespace = "gtk4-layer-shell" },
  blur = true,
  ignore_alpha = 0.3,
  blur_popups = true,
})
