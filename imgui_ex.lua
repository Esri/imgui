project "imgui_ex"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "0F8CF1E7-A52A-4612-AEEB-97AF1F32356E"

includedirs {
  ".",
  _3RDPARTY_DIR,
  _3RDPARTY_DIR .. "/glfw/include",
}

files {
  "imgui_demo.cpp",
  "backends/imgui_impl_glfw.cpp",
  "backends/imgui_impl_opengl3.cpp",
  "backends/imgui_impl_opengl2.cpp",
}

if (_PLATFORM_ANDROID) then
end

if (_PLATFORM_COCOA) then
end

if (_PLATFORM_IOS) then
end

if (_PLATFORM_LINUX) then
  includedirs {
	_3RDPARTY_DIR .. "/Vulkan-Headers/include",
	_3RDPARTY_DIR .. "/volk",
  }

  files {
    "backends/imgui_impl_vulkan.cpp",
  }
end

if (_PLATFORM_MACOS) then
  buildoptions {
    "-fobjc-arc",
    "-fobjc-arc-exceptions",
  }

  files {
    "backends/imgui_impl_metal.mm",
    "backends/imgui_impl_osx.mm",
  }
end

if (_PLATFORM_WINDOWS) then
  includedirs {
	_3RDPARTY_DIR .. "/Vulkan-Headers/include",
	_3RDPARTY_DIR .. "/volk",
  }

  files {
    "backends/imgui_impl_dx11.cpp",
    "backends/imgui_impl_win32.cpp",
    "backends/imgui_impl_vulkan.cpp",
  }
end

if (_PLATFORM_WINUWP) then
end
