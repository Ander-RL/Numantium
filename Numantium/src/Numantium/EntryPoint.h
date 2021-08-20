#pragma once

#ifdef NM_PLATFORM_WINDOWS

// Function that will be defined somewhere else which will return Numantium::Application* for us
extern Numantium::Application* Numantium::CreateApplication(); // Implemented in the client

int main(int argc, char** argv)
{
	auto app = Numantium::CreateApplication();
	app->Run();
	delete app;

	return 0;
}

#endif