-- Bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")

if vim.g.neovide then
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 8.0
  vim.g.neovide_floating_blur_amount_y = 8.0
  vim.g.neovide_opacity = 0.5
  vim.g.neovide_normal_opacity = 0.5
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_floating_corner_radius = 0.0
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  vim.g.neovide_title_text_color = "#98971a"
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_background_color = "#98971a"
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_opacity = math.min(1.0, vim.g.neovide_opacity)
  end)
  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_opacity = math.max(0.4, vim.g.neovide_opacity)
  end)
end
