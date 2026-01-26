-- Remove Latin diacritics in a buffer range, visual selection or word under cursor.
local M = {}

local diacs =
	"àáâãäåāăąçćčďđèéêëēėęěìíîïīįłñńňòóôõöøōŏœŕřśşšșťțùúûüūůűųýÿžźż"
local repls = "aaaaaaaaacccddeeeeeeeiiiiiiilnnnoooooooorrssssttuuuuuuuuuyyzzz"
local DIACS = diacs .. string.upper(diacs)
local REPLS = repls .. string.upper(repls)

function M.remove_range(line1, line2)
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, line1 - 1, line2, false)
	if #lines == 0 then
		return
	end
	local text = table.concat(lines, "\n")
	local out = vim.fn.tr(text, DIACS, REPLS)
	local new_lines = vim.split(out, "\n", { plain = true })
	vim.api.nvim_buf_set_lines(bufnr, line1 - 1, line2, false, new_lines)
end

return M
