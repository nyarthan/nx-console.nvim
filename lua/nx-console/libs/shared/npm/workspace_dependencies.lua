local Path = require("plenary.path")
local pnp_dependencies = require("nx-console.libs.shared.npm.pnp_dependencies")

local M = {}

M.workspace_dependency_path =
  function(workspace_path, workspace_dependency_name)
    local start = "."
    if string.sub(workspace_dependency_name, 1, #start) == start then
      return Path:new(workspace_path, workspace_dependency_name)
    end

    if pnp_dependencies.is_workspace_in_pnp(workspace_path) then
      return pnp_dependencies.pnp_dependency_path(
        workspace_path,
        workspace_dependency_name
      )
    end

    local path =
      Path:new(workspace_path, "node_modules", workspace_dependency_name)

    if path.exists() then
      return path
    end
  end

return M
