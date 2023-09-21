#export KAGGLE_USERNAME=
# export KAGGLE_KEY=
#export GITEMAIL=
#export GITNAME=
#printenv
#langchain-package

settings:
	git config --global user.email ${GITEMAIL}
	git config --global user.name ${GITNAME}
	pip install --upgrade pip
	pip install -r requirements-dev.txt

download:
	mkdir -p packages
	pip download -r requirements.txt -d packages

zip:
	rm -rf packages &&\
	rm -rf packages-zip
	make download
	mkdir -p packages-zip 
	python getting_packages.py

install:
	pip install packages/*.whl

k-dataset:
	make zip &&\
	make install &&\
	kaggle datasets init -p packages-zip &&\
	python uploading_dataset.py "langchain" &&\
	kaggle datasets create -p packages-zip -u -r zip 

k-update-dataset:
	kaggle datasets version  -p packages-zip -u -m "Updated data"
