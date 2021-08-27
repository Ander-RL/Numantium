#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/fmt/ostr.h"

namespace Numantium {

	class NUMANTIUM_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Macros to facilitate the use of Core Log
// (...) for variable number of arguments (varargs)
#define NM_CORE_TRACE(...) ::Numantium::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define NM_CORE_INFO(...)  ::Numantium::Log::GetCoreLogger()->info(__VA_ARGS__)
#define NM_CORE_WARN(...)  ::Numantium::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define NM_CORE_ERROR(...) ::Numantium::Log::GetCoreLogger()->error(__VA_ARGS__)
#define NM_CORE_FATAL(...) ::Numantium::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Macros to facilitate the use of Client Log
#define NM_TRACE(...)      ::Numantium::Log::GetClientLogger()->trace(__VA_ARGS__)
#define NM_INFO(...)       ::Numantium::Log::GetClientLogger()->info(__VA_ARGS__)
#define NM_WARN(...)       ::Numantium::Log::GetClientLogger()->warn(__VA_ARGS__)
#define NM_ERROR(...)      ::Numantium::Log::GetClientLogger()->error(__VA_ARGS__)
#define NM_FATAL(...)      ::Numantium::Log::GetClientLogger()->fatal(__VA_ARGS__)