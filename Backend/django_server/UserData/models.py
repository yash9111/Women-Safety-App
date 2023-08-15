from django.db import models

# Create your models here.

class User(models.Model):
    name=models.CharField('name',max_length=100)
    mobile=models.BigIntegerField()
    password=models.CharField('password',max_length=100)

    def __str__(self):
        return self.name
