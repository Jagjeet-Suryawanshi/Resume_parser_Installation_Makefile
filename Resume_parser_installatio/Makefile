.PHONY: Install_system_requirements install_python install_java Install venv clean

VENV = Myenv
PYTHON = $(VENV)/Scripts/python

Install_system_requirements:install_python install_java venv install_dependencies install_nltk_data install_stanza

install_nltk_data:
	@install_nltk_data.bat

install_stanza:
	@install_stanza.bat
# Create virtual enviornment and then install dependencies
install_dependencies:
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt

# Create a virtual environment
venv:
	python -m venv $(VENV)

install_java:
	@install_java.bat

install_python:
	@install_python.bat

clean:
	@echo "Virtual Enviornment removed"
	rmdir /s /q $(VENV)



