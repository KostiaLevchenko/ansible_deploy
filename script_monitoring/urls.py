from django.conf.urls import url
from . import views


urlpatterns = [
    url(r'^run/ansible$', views.run_ansible_script, name='run_ansible_script'),
    url(r'^status/ansible$', views.run_ansible_script, name='run_ansible_status'),
]