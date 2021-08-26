#include "Application.h"
#include <iostream>

#include "Events/Event.h"
#include "Events/ApplicationEvent.h"
#include "Log.h"

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
