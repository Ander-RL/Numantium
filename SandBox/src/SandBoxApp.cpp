#include <Numantium.h>

class Sandbox : public Numantium::Application
{
public:
	Sandbox()
	{
	}

	~Sandbox()
	{
	}
};

Numantium::Application* Numantium::CreateApplication()
{
	return new Sandbox();
}