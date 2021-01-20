# pull official base image
FROM python:3.6-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev
RUN apk add zlib-dev jpeg-dev
RUN apk add graphviz pkgconfig graphviz-dev

RUN pip install --upgrade pip

# copy reuquirements.txt
COPY ./requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy files
COPY . .

#expose port 8000
EXPOSE 8000

#execute backend
CMD python3 manage.py runserver 0.0.0.0:8000
