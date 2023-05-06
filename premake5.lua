--Spdlog external
project "Spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	architecture "x86_64"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/intermediate/" .. outputdir .. "/%{prj.name}")

	defines {
		"SPDLOG_COMPILED_LIB",
		"SPDLOG_USE_STD_FORMAT"
	}

	includedirs {
		"include"
	}

	--Add files to the predefined filter.
	files {
		("**.h"),
		("**.inl"),
		("**.cpp"),
		("**.c")
	}
	removefiles {
		"example/**",
		"bench/**",
		"tests/**"
	}

	filter "Debug"
		defines { "DEBUG" }
		symbols "on"
		optimize "off"
	filter{}

	filter "Release"
		defines { "NDEBUG" }
		symbols "off"
		optimize "Full" 
	filter{}