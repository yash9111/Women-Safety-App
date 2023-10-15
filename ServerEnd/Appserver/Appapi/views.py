from rest_framework.response import Response
import random
from django.conf import settings
from rest_framework.decorators import api_view


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
        try:
            phone_number = data.get('phone_number')
            otp = random.randint(1000,9999)
            url = f'https://2factor.in/API/V1/{settings.API_KEY}/SMS/{phone_number}/12345/{otp}'
            print('message')
            return Response({'msg':'sms send'})
        except Exception as e:
            print(e)
