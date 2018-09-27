dev mode
========

pip install requirements.txt
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver

Got to http://127.0.0.1:8000


Functional tests
----------------

Note: You need to install browser and operating system specific browser drivers.
    See: https://seleniumhq.github.io/selenium/docs/api/py/index.html#drivers

pip install requirements_test.txt
robot -v BROWSER:Chrome test.robot



pseudo-prod mode
================

1) Create my_service.env file containing:

POSTGRES_PASSWORD=mypassword  
POSTGRES_USER=mydatabaseuser
POSTGRES_DB=mydatabase
SECRET_KEY=mysecretkey


2) Build and launch containers

docker-compose up


3) Migrate database and create superuser

docker-compose exec web python manage.py collectstatic
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser

Got to http://127.0.0.1


Functional Tests 
================

docker-compose -f docker-compose.test.yml -p test build
docker-compose -f docker-compose.test.yml -p test up -d


