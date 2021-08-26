#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace Numantium {

	class NUMANTIUM_API Application // In order to use it in another project -> __declspec(dllexport)
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	// To be defined in the client
	Application* CreateApplication();
}

