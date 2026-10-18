local gap = 10

hl.config({
  general = {
    gaps_in = gap / 2,
    gaps_out = gap,
    border_size = 2,

    col = {
      active_border = {
        colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
        angle = 45,
      },
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = false,

    allow_tearing = false,

    layout = "scrolling",

    snap = {
      enabled = true,
      window_gap = gap,
      monitor_gap = gap,
      respect_gaps = true,
    },
  },

  decoration = {
    rounding = 7,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = { enabled = false },

    blur = {
      enabled = true,
      size = 4,
      passes = 3,
      vibrancy = 1,
      vibrancy_darkness = 0.3,

      noise = 0.06,

      popups = true,
    },
  },

  animations = {
    enabled = true,
  },
})
