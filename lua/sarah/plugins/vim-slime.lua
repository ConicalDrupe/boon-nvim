return {
  'jpalardy/vim-slime',
  init = function()
    vim.b['quarto_is_python_chunk'] = false
    Quarto_is_in_python_chunk = function()
        require('otter.tools.functions').is_otter_language_context 'python'
      end
    -- vim.g.slime_dispatch_ipython_pause = 100
    -- vim.g.slime_cell_delimiter = '#\\s\\=%%'


    -- for R
    -- vim.g['quarto_is_r_mode'] = nil
    -- vim.g['reticulate_running'] = false

    -- Old Function
    -- vim.cmd [[
    --   function! _EscapeText_quarto(text)
    --     if slime#config#resolve("python_ipython") && len(split(a:text,"\n")) > 1
    --       return [slime#config#resolve("dispatch_ipython_pause"), a:text, "--\n"]
    --       " return ["%cpaste -q\n", slime#config#resolve("dispatch_ipython_pause"), a:text, "--\n"]
    --     else
    --       let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    --       let no_empty_lines = substitute(a:text, empty_lines_pat, "", "g")
    --       let dedent_pat = '\(^\|\n\)\zs'.matchstr(no_empty_lines, '^\s*')
    --       let dedented_lines = substitute(no_empty_lines, dedent_pat, "", "g")
    --       let except_pat = '\(elif\|else\|except\|finally\)\@!'
    --       let add_eol_pat = '\n\s[^\n]\+\n\zs\ze\('.except_pat.'\S\|$\)'
    --       return substitute(dedented_lines, add_eol_pat, "\n", "g")
    --     end
    --   endfunction
    -- ]]
    --
    vim.cmd [[
    let g:slime_dispatch_ipython_pause = 100
    function SlimeOverride_EscapeText_quarto(text)
    call v:lua.Quarto_is_in_python_chunk()
    if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
    else
    if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
    return [a:text, "\n"]
    else
    return [a:text]
    end
    end
    endfunction
    ]]

    vim.g.slime_target = 'neovim'
    vim.g.slime_python_ipython = 1
  end,
  -- config = function()
  --   vim.keymap.set({'n','i'},'<leader><C-p>', function ()
  --     vim.cmd([[ call slime#send_cell() ]])
  --   end, { desc = 'send code cell to terminal' })
  --     end,
}
