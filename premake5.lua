workspace "Numantium"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }
--              debug            windows        x64
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories realtive to root foler (solution directory)
-- List of directories (struct/table)
IncludeDir = {}
IncludeDir["GLFW"] = "Numantium/vendor/GLFW/include"

-- Includes premake5.lua (GLFW project) file that is present in that folder (similar to #include)
include "Numantium/vendor/GLFW" 

project "Numantium"
    location "Numantium"
    kind "SharedLib" -- Dinamic librarys DLL
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "nmpch.h"
    -- for visual studio, because it needs to create a pch file 
    -- this info is inserted in the projects properties
    pchsource "Numantium/src/nmpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}" -- = Numantium/vendor/GLFW/include
    }

    links
    {
        "GLFW", --links the GLFW project and dependencies to Numantium. Now Numantium depends on GLFW.
        "opengl32.lib" -- static library?
    }

    -- Anything below this filter applys only to windows (until it reaches another filter)
    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On" -- linking the runtime libraries statically
        systemversion "latest"

        defines
        {
            "NM_PLATFORM_WINDOWS",
            "NM_BUILD_DLL"
        }

        -- To copy Numantium.dll to the Sandbox folder
        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "NM_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "NM_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "NM_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Numantium/vendor/spdlog/include",
        "Numantium/src"
    }

    -- It has to link with the engine
    links
    {
        "Numantium" -- Project name?
    }

    -- Anything below this filter applys only to windows (until it reaches another filter)
    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On" -- linking the runtime libraries statically
        systemversion "latest"

        defines
        {
            "NM_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "NM_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "NM_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "NM_DIST"
        optimize "On"
