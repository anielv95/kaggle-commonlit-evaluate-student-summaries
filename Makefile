#export KAGGLE_USERNAME=
# export KAGGLE_KEY=
#printenv
#langchain-package

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
	make zip 
	pip install packages/*.whl

k-dataset:
	# make a python file that changes the json file
	kaggle datasets init -p packages-zip
	python uploading_dataset.py "langchain-package"
	kaggle datasets create -p packages-zip -r zip

k-update-dataset:
	kaggle datasets version  -p packages-zip -m "Updated data"
