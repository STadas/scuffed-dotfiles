function GitStatus()
    local added, modified, removed = unpack(vim.fn.GitGutterGetHunkSummary())
    if added + modified + removed == 0 then
        return ""
    else
        return string.format("+%s ~%s -%s",
            added,
            modified,
            removed)
    end
end

function LinterStatus()
    local errors = table.getn(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
    local warnings = table.getn(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))
    local info = table.getn(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }))

    if errors + warnings + info == 0 then
        return "OK"
    else
        return string.format("%sE %sW %sI",
            errors,
            warnings,
            info)
    end
end
