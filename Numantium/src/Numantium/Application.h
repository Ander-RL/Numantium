#pragma once

#include "Core.h"
#include "Numantium/Events/Event.h"
#include "Numantium/Window.h"

namespace Numantium {

	class NUMANTIUM_API Application // In order to use it in another project -> __declspec(dllexport)
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};
	// To be defined in the client
	Application* CreateApplication();
}

