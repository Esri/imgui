project "imgui"

  local prj = project()
  local prjDir = prj.basedir

  -- -------------------------------------------------------------
  -- project
  -- -------------------------------------------------------------

  -- common project settings

  dofile (_BUILD_DIR .. "/3rdparty_shared_project.lua")

  -- project specific settings

  uuid "C914A97A-3068-4B8A-8512-34097411C13C"

  files {
    "*.cpp",
    "examples/imgui_impl_glfw.cpp",
    "examples/imgui_impl_opengl3.cpp",
    "examples/imgui_impl_opengl2.cpp",
  }

  includedirs {
    prjDir,
    _3RDPARTY_DIR,
  }


  -- -------------------------------------------------------------
  -- configurations
  -- -------------------------------------------------------------

  if (os.is("windows") and not _TARGET_IS_WINUWP) then
    -- -------------------------------------------------------------
    -- configuration { "windows" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/3rdparty_shared_win.lua")

    -- project specific configuration settings

    configuration { "windows" }

      defines {
        "IMGUI_API=__declspec(dllexport)",
      }

      files {
        "examples/imgui_impl_dx11.cpp",
        "examples/imgui_impl_win32.cpp",
      }

      links {
        "glad",
        "opengl32",
        "glfw3"
      }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Debug", "x32" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_win_x86_debug.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Debug", "x32" }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Debug", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_win_x64_debug.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Debug", "x64" }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Release", "x32" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_win_x86_release.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Release", "x32" }

    -- -------------------------------------------------------------
    -- configuration { "windows", "Release", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_win_x64_release.lua")

    -- project specific configuration settings

    -- configuration { "windows", "Release", "x64" }

    -- -------------------------------------------------------------
  end

  if (os.is("linux") and not _OS_IS_ANDROID) then
    -- -------------------------------------------------------------
    -- configuration { "linux" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_linux.lua")

    -- project specific configuration settings

    configuration { "linux" }

      links {
        "GL",
        "glfw"
      }

    -- -------------------------------------------------------------
    -- configuration { "linux", "Debug", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_linux_x64_debug.lua")

    -- project specific configuration settings

    configuration { "linux", "Debug", "x64" }

    links {
      "gladd",
    }

    -- -------------------------------------------------------------
    -- configuration { "linux", "Release", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_linux_x64_release.lua")

    -- project specific configuration settings

    configuration { "linux", "Release", "x64" }

    links {
      "glad",
    }

    -- -------------------------------------------------------------
  end

  if (os.is("macosx") and not _OS_IS_IOS and not _OS_IS_ANDROID) then
    -- -------------------------------------------------------------
    -- configuration { "macosx" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_mac.lua")

    -- project specific configuration settings

    configuration { "macosx" }
      
      links {
        "glfw",
      }

      buildoptions {
        "-fobjc-arc",
        "-fobjc-arc-exceptions",
      }

      files {
        "examples/imgui_impl_metal.mm",
        "examples/imgui_impl_osx.mm",
      }

      linkoptions {
        "-framework OpenGL",
        "-framework Metal",
      }

    -- -------------------------------------------------------------
    -- configuration { "macosx", "Debug", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_mac_x64_debug.lua")

    -- project specific configuration settings

    configuration { "macosx", "Debug", "x64" }

      links {
        "gladd",
      }

    -- -------------------------------------------------------------
    -- configuration { "macosx", "Release", "x64" }
    -- -------------------------------------------------------------

    -- common configuration settings

    dofile (_BUILD_DIR .. "/shared_mac_x64_release.lua")

    -- project specific configuration settings

    configuration { "macosx", "Release", "x64" }

      links {
        "glad",
      }

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
