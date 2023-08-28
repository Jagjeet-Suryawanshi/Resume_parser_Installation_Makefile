.PHONY: Install_system_requirements install_python venv install_dependencies clean

VENV = Myenv
PYTHON = $(VENV)/Scripts/python

Install_system_requirements:install_dependencies

# Create virtual enviornment and then install dependencies
install_dependencies:venv
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt

# Create a virtual environment
venv:install_python
	python -m venv $(VENV)

install_python:
	@install_python.bat

clean:
	@echo "Virtual Enviornment removed"
	rmdir /s /q $(VENV)



