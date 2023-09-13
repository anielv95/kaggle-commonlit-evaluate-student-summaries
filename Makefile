download:
	pip install --upgrade pip &&\
		pip download -r requirements.txt -d packages

install:
	# python getting_packages.py
	pip install packages/*.whl
