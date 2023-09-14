download:
	git config --global user.email "anielvillegas@gmail.com"
	git config --global user.name "aniel"
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
