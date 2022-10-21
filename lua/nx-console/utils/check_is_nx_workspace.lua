local Path = require("plenary.path")
local workspace_dependencies =
  require("nx-console.libs.shared.npm.workspace_dependencies")

local function check_is_nx_workspace(workspace_path)
  local is_nx_workspace = Path:new(workspace_path, "nx.json"):exists()

  if not is_nx_workspace then
    local lerna_path =
      workspace_dependencies.workspace_dependency_path(workspace_path, "lerna")
    if not lerna_path then
      return false
    end
  end
  return is_nx_workspace
end

return check_is_nx_workspace
