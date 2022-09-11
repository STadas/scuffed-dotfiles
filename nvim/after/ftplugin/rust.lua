vim.b.ale_completion_autoimport = 0

function Xd()
    local path = vim.api.nvim_exec("echo expand('%:p')", true)
    vim.api.nvim_exec("split term://bash", _)
    vim.api.nvim_chan_send(vim.b.terminal_job_id, string.format("cargo run\n", path))
end
vim.api.nvim_buf_create_user_command(0, "XD", Xd, {})
