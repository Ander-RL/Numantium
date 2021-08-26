#pragma once

#ifdef NM_PLATFORM_WINDOWS
	#ifdef NM_BUILD_DLL
		#define NUMANTIUM_API __declspec(dllexport)
	#else
		#define NUMANTIUM_API __declspec(dllimport)
	#endif
#else
	#error Numantium only supports Windows!
#endif

#define BIT(x) (1 << x)