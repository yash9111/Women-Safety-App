
from . import views
from django.urls import path,include

from .views import send_otp 

urlpatterns = [
   
    path('postotp/', views.send_otp),

]