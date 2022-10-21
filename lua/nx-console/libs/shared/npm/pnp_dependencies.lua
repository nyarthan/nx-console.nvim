local Path = require("plenary.path")

local M = {}

M.get_pnp_file = function(workspace_path)
  local EXTENSIONS = { ".cjs", ".js" }
  for _, extension in ipairs(EXTENSIONS) do
    local filename = ".pnp" .. extension
    local pnp_file = Path:new(workspace_path, filename)
    if pnp_file.exists() then
      return pnp_file
    end
  end
end

M.is_workspace_in_pnp = function(workspace_path)
  if M.get_pnp_file(workspace_path) then
    return true
  end
  return false
end

M.pnp_dependency_path = function(workspace_path, dependency_name)
  -- TOOD
  return nil
end

return M
