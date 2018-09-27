sleep 5
cd /usr/src/app
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(is_superuser=True).first() or User.objects.create_superuser('admin', '', 'admin')"

uwsgi --chdir /usr/src/app --uid uwsgi --http 0.0.0.0:8080 --wsgi my_service.wsgi:application

