FROM python:3.10.12
WORKDIR /gh
COPY ./.. .
CMD ["python"]