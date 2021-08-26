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

project "Numantium"
    location "Numantium"
    kind "SharedLib" -- Dinamic librarys DLL
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
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include"
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
