#include "Application.h"
#include <iostream>

#include "Numantium/Events/Event.h"
#include "Numantium/Events/ApplicationEvent.h"
#include "Numantium/Log.h"

namespace Numantium {

	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		NM_TRACE(e);

		while (true) 
		{
		}
	}
}
