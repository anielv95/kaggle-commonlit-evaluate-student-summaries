settings:
	git config --global user.email ${GITEMAIL}
	git config --global user.name ${GITNAME}
	pip install --upgrade pip
	pip install -r requirements-dev.txt

download:
	mkdir -p packages
	pip install --upgrade pip
	pip download -r requirements.txt -d packages

zip:
	make download
	mkdir -p packages-zip 
	python getting_packages.py

install:
	make download 
	pip install packages/*.whl
