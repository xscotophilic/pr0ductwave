# Define Python executable and virtual environment settings
PYTHON = python3
VENV_DIR = venv

OS := $(shell uname -s)
ifeq ($(OS), Windows_NT)
	ACTIVATE = $(VENV_DIR)\Scripts\activate
	SHELL = powershell
else
	ACTIVATE = source $(VENV_DIR)/bin/activate
	SHELL = /bin/bash
endif

.PHONY: venv
venv:
	$(PYTHON) -m venv $(VENV_DIR)

.PHONY: install
install: venv
	$(ACTIVATE) && pip install --upgrade pip && pip install -r requirements.txt

.PHONY: freeze
freeze:
	$(ACTIVATE) && pip freeze > requirements.txt

.PHONY: migrate
migrate:
	$(ACTIVATE) && python manage.py makemigrations && python manage.py migrate

.PHONY: createsuperuser
createsuperuser:
	$(ACTIVATE) && python manage.py createsuperuser

.PHONY: run
run:
	$(ACTIVATE) && python manage.py runserver

.PHONY: clean
clean:
	rm -rf $(VENV_DIR)
	rm -f db.sqlite3
	find . -name "__pycache__" -type d -exec rm -rf {} +
