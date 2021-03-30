from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path
from HAVE_Admin_Panel import views

urlpatterns = [
    path('', views.home, name='home'),
]
