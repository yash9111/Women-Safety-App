from rest_framework import serializers
from .models import User

class User_Serializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields=('name','mobile','password')
        