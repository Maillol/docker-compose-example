How to launch


1) Create my_service.env file containing:

POSTGRES_PASSWORD=mypassword  
POSTGRES_USER=mydatabaseuser
POSTGRES_DB=mydatabase


2) Build and launch containers

docker-compose up


3) Migrate database and create superuser

docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser

TODO:

Add Nginx container and remove web container exposed port 
