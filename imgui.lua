project "imgui"

  local prj = project()
  local prjDir = prj.basedir

  -- -------------------------------------------------------------
  -- project
  -- -------------------------------------------------------------

  -- common project settings

  dofile (_BUILD_DIR .. "/3rdparty_static_project.lua")

  -- project specific settings

  uuid "00273C6F-C6D6-456A-9DFC-B65011816616"

  files {
    "*.cpp",
  }

  includedirs {
    prjDir,
    _3RDPARTY_DIR,
  }

  -- -------------------------------------------------------------
  -- configurations
  -- -------------------------------------------------------------

  if (_PLATFORM_WINDOWS) then
    -- -------------------------------------------------------------
    -- configuration { "windows" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/3rdparty_static_win.lua")

    -- project specific configuration settings

    configuration { "windows" }

      files {
        "examples/imgui_impl_dx11.cpp",
        "examples/imgui_impl_win32.cpp",
        "examples/imgui_impl_glfw.cpp",
        "examples/imgui_impl_opengl3.cpp",
        "examples/imgui_impl_opengl2.cpp",
      }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Debug", "x32" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_win_x86_debug.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Debug", "x32" }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Debug", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_win_x64_debug.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Debug", "x64" }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Release", "x32" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_win_x86_release.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Release", "x32" }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Release", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_win_x64_release.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Release", "x64" }

    -- -------------------------------------------------------------
  end

  if (_PLATFORM_LINUX) then
    -- -------------------------------------------------------------
    -- configuration { "linux" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_linux.lua")

    -- project specific configuration settings

    configuration { "linux" }

      files {
        "examples/imgui_impl_glfw.cpp",
        "examples/imgui_impl_opengl3.cpp",
        "examples/imgui_impl_opengl2.cpp",
      }

    -- -------------------------------------------------------------
    -- configuration { "linux", "Debug", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_linux_x64_debug.lua")

    -- project specific configuration settings

    -- configuration { "linux", "Debug", "x64" }

    -- -------------------------------------------------------------
    -- configuration { "linux", "Release", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_linux_x64_release.lua")

    -- project specific configuration settings

    -- configuration { "linux", "Release", "x64" }

    -- -------------------------------------------------------------
  end

if (_PLATFORM_COCOA) then
    -- -------------------------------------------------------------
    -- -------------------------------------------------------------
    -- configuration { "ios" } == _OS_IS_IOS
    -- configuration { "cocoa*" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa.lua")

    -- project specific configuration settings

    configuration { "cocoa*" }

      buildoptions {
        "-fobjc-arc",
        "-fobjc-arc-exceptions",
      }

      files {
        "examples/imgui_impl_metal.mm",
      }

    -- -------------------------------------------------------------
    -- configuration { "cocoa_arm64_debug" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa_arm64_debug.lua")

    -- project specific configuration settings

    -- configuration { "cocoa_arm64_debug" }

    -- -------------------------------------------------------------
    -- configuration { "cocoa_arm64_release" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa_arm64_release.lua")

    -- project specific configuration settings

    -- configuration { "cocoa_arm64_release" }

    -- -------------------------------------------------------------
    -- configuration { "cocoa_sim64_debug" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa_sim64_debug.lua")

    -- project specific configuration settings

    -- configuration { "cocoa_sim64_debug" }

    -- -------------------------------------------------------------
    -- configuration { "cocoa_sim64_release" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa_sim64_release.lua")

    -- project specific configuration settings

    -- configuration { "cocoa_sim64_release" }

    -- -------------------------------------------------------------
    -- configuration { "cocoa_x64_debug" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa_x64_debug.lua")

    -- project specific configuration settings

    -- configuration { "cocoa_x64_debug" }

    -- -------------------------------------------------------------
    -- configuration { "cocoa_x64_release" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_cocoa_x64_release.lua")

    -- project specific configuration settings

    -- configuration { "cocoa_x64_release" }

    -- -------------------------------------------------------------
  end

  if (_PLATFORM_MACOS) then
    -- -------------------------------------------------------------
    -- configuration { "macosx" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_mac.lua")

    -- project specific configuration settings

    configuration { "macosx" }

      buildoptions {
        "-fobjc-arc",
        "-fobjc-arc-exceptions",
      }

      files {
        "examples/imgui_impl_glfw.cpp",
        "examples/imgui_impl_opengl3.cpp",
        "examples/imgui_impl_opengl2.cpp",
        "examples/imgui_impl_metal.mm",
        "examples/imgui_impl_osx.mm",
      }


    -- -------------------------------------------------------------
    -- configuration { "macosx", "Debug", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_mac_x64_debug.lua")

    -- project specific configuration settings

    -- configuration { "macosx", "Debug", "x64" }

    -- -------------------------------------------------------------
    -- configuration { "macosx", "Release", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/static_mac_x64_release.lua")

    -- project specific configuration settings

    -- configuration { "macosx", "Release", "x64" }

    -- -------------------------------------------------------------
  end

  if (_IS_QT) then
    -- -------------------------------------------------------------
    -- configuration { "qt" }
    -- -------------------------------------------------------------

    local qt_include_dirs = PROJECT_INCLUDE_DIRS

    -- Add additional QT include dirs
    -- table.insert(qt_include_dirs, <INCLUDE_PATH>)

    createqtfiles(project(), qt_include_dirs)

    -- -------------------------------------------------------------
  end
