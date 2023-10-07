
from . import views
from django.urls import path,include

from .views import send_otp 

urlpatterns = [
    path("",views.home),
    path('postotp/', views.send_otp),
    path('register/',views.register_user)

]