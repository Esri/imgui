-- core functionality
dofile("imgui_core.lua")

-- desktop platform integration
if (_PLATFORM_LINUX or _PLATFORM_MACOS or _PLATFORM_WINDOWS) then
  dofile("imgui_ex.lua")
end
