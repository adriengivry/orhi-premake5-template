workspace "my-solution"
	configurations { "Debug", "Release" }
	platforms { "x64" }
	startproject "my-project"

	newoption {
		trigger = "gfxapi",
		value = "API",
		description = "Define the graphics API to use (e.g., OpenGL, Mock)",
		allowed = {
			{ "opengl", "Use OpenGL as the graphics API" },
			{ "mock", "Use Mock as the graphics API" }
		},
		default = "opengl"
	}

	filter { "options:gfxapi=opengl" }
		defines { "ORHI_SELECT_OPENGL" }

	filter { "options:gfxapi=mock" }
		defines { "ORHI_SELECT_MOCK" }

outputdir = "%{wks.location}/bin/"
objoutdir = "%{wks.location}/obj/"
depsdir = "%{wks.location}/deps/"

group "deps"
    include "deps/_glm"
    include "deps/_glfw"
    include "deps/orhi"
group ""

project "my-project"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    targetdir (outputdir .. "%{cfg.buildcfg}/%{prj.name}")
	objdir (objoutdir .. "%{cfg.buildcfg}/%{prj.name}")
	debugdir (outputdir .. "%{cfg.buildcfg}/%{prj.name}")

    files { "include/**.h", "src/**.cpp" }

    includedirs {
        "deps/_glfw/glfw/include",
        "deps/_glm/glm",
        "deps/orhi/include",
    }

    links {
        "orhi",
        "glfw",
        "glm"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"