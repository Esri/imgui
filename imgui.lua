project "imgui"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "00273C6F-C6D6-456A-9DFC-B65011816616"

includedirs {
  ".",
  _3RDPARTY_DIR,
}

files {
  "*.cpp",
  "examples/imgui_impl_glfw.cpp",
  "examples/imgui_impl_opengl3.cpp",
  "examples/imgui_impl_opengl2.cpp",
}

if (_PLATFORM_ANDROID) then
end

if (_PLATFORM_COCOA) then
end

if (_PLATFORM_IOS) then
end

if (_PLATFORM_LINUX) then
end

if (_PLATFORM_MACOS) then
  buildoptions {
    "-fobjc-arc",
    "-fobjc-arc-exceptions",
  }

  files {
    "examples/imgui_impl_metal.mm",
    "examples/imgui_impl_osx.mm",
  }
end

if (_PLATFORM_WINDOWS) then
  files {
    "examples/imgui_impl_dx11.cpp",
    "examples/imgui_impl_win32.cpp",
  }
end

if (_PLATFORM_WINUWP) then
end
