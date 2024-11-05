return {
  "pluffie/neoproj",
  cmd = { "ProjectOpen", "ProjectNew" },
  config = function()
	require "neoproj".setup {
	  project_path = "~/.config/nvim/projects",
  	}
  end
}
