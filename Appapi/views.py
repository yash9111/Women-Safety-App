from rest_framework.response import Response
import random
from django.conf import settings
from rest_framework.decorators import api_view
from .models import user_collection


# Create your views here.
@api_view(['get'])
def home(request):
    return Response("Women are safe")

@api_view(['post'])
def send_otp(request):
    data = request.data

    if data.get('phone_number') is None:
        return Response({'msg':'required number'})

    else:
        user_collection.insert_one(data.get('phone_number'))