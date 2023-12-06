project "imgui_core"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "569CEC4E-AC8F-40EA-9C5B-8FB37264A767"

defines {
  "IMGUI_DISABLE_WIN32_DEFAULT_CLIPBOARD_FUNCTIONS",
  "IMGUI_DISABLE_WIN32_DEFAULT_IME_FUNCTIONS",
  "IMGUI_DISABLE_WIN32_FUNCTIONS",
}

includedirs {
  ".",
  _3RDPARTY_DIR,
}

files {
  "*.cpp",
  "misc/cpp/imgui_stdlib.cpp",
}

excludes {
  "imgui_demo.cpp",
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

end

if (_PLATFORM_WINDOWS) then
end

if (_PLATFORM_WINUWP) then
end
