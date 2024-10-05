-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/jvgrootveld/telescope-zoxide
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
	"jvgrootveld/telescope-zoxide",
  	config = function()
		require("telescope").load_extension('zoxide')
	end
}
