return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function()
		local function diff_source()
  		  if vim.fn.exists('*sy#repo#get_stats') == 1 then
    		    local stats = vim.fn['sy#repo#get_stats']()
    		    return {
      		added = stats[1],
      		modified = stats[2],
      		removed = stats[3],
    		    }
  		  end
		end

		require('lualine').setup {
  		  options = {
    		    icons_enabled = true,
    		    theme = 'auto',
    		    component_separators = { left = ' ', right = ' '},
    		    section_separators = { left = ' ', right = ' '},
    		    disabled_filetypes = {
      		statusline = {},
      		winbar = {},
    		    },
    		    ignore_focus = {},
    		    always_divide_middle = true,
    		    globalstatus = false,
    		    refresh = {
      		statusline = 1000,
      		tabline = 1000,
      		winbar = 1000,
    		    }
  		  },
  		  sections = {
    		    lualine_a = {'mode'},
    		    lualine_b = { {'diff', source = diff_source}, },
    		    lualine_c = {
    			{
    				'filename',
    				file_status = true,
    				path = 1,
    			}
    		    },
    		    lualine_x = {'encoding', 'fileformat', 'filetype'},
    		    lualine_y = {'progress'},
    		    lualine_z = {'selectioncount', 'location'}
  		  },
  		  inactive_sections = {
    		    lualine_a = {},
    		    lualine_b = {},
    		    lualine_c = {'filename'},
    		    lualine_x = {'location'},
    		    lualine_y = {},
    		    lualine_z = {}
  		  },
  		  tabline = {},
  		  winbar = {},
  		  inactive_winbar = {},
  		  extensions = {}
		}

	end


}




