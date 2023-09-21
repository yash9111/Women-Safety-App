from django.db import models
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager
from django.contrib.auth.models import PermissionsMixin


# Create your models here.

class MyUser(BaseUserManager):

    def create_user(self,phone_number,password):
        if phone_number is None:
            "phone number is required"
        else:
            user = self.model( phone_number=phone_number)
            user.save(using=self._db)

    def create_superuser(self,phone_number,password):
      
        user = self.create_user(
            phone_number,password)
        user.save(using = self._db)
   



class User(AbstractBaseUser):

    phone_number = models.CharField( max_length = 12 , unique =  True)
    password = models.CharField(max_length=12)

    USERNAME_FIELD = 'phone_number'
    REUIRED_FIELD = ['password']

    def __str__(self):
        return self.phone_number

    objects = MyUser()
