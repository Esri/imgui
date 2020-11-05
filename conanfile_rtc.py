from conans import ConanFile


class ImguiConan(ConanFile):
    name = "imgui"
    version = "1.69"
    url = "https://github.com/ocornut/imgui/tree/v1.69"
    license = "https://github.com/ocornut/imgui/blob/v1.69/LICENSE.txt"
    description = "Dear ImGui: Bloat-free Graphical User interface for C++ with minimal dependencies."

    # RTC specific triple
    settings = "platform_architecture_target"

    def package(self):
        base = self.source_folder + "/"
        relative = "3rdparty/imgui/"

        # headers
        self.copy("*.h*", src=base, dst=relative)

        # libraries
        output = "output/" + str(self.settings.platform_architecture_target) + "/staticlib"
        self.copy("*" + self.name + "*", src=base + "../../" + output, dst=output)
