from rest_framework.response import Response
import random
from rest_framework.decorators import api_view
from .models import user_collection
import random
from django.conf import settings
from twilio.rest import Client


# Create your views here.
@api_view(['get'])
def home(request):
    return Response("Women are safe")

@api_view(['post'])
def send_otp(request):
    data = request.data
    phnm = data.get('phone_number')
    request.session['phnm'] = phnm

    otp = random.randint(1000,9999)
    global otpshare
    def otpshare():
       return otp


    if data.get('phone_number') is None:
        return Response({'msg':'required number'})

    else:
      try:
        account_sid = settings.ACCOUNT_SID
        auth_token = settings.AUTH_TOKEN

        print(account_sid)

        client = Client(account_sid , auth_token)

        message = client.messages.create(
           from_ ='+12565489967',
           body = f'your otp is {otp} please do not share this otp to anyone',
           to = data.get('phone_number')
      )
      except Exception as e:
       print(e)


    return Response({
           'msg':"otp sent",
       })

@api_view(['post'])
def register_user(request):
    records = {
       "name":"sudarshan"
    }
    user_collection.insert_one(records)

    return Response({
           'msg':"otp sent",
       })




# @api_view(['post'])
# def call_user(request):
#     pass

# @api_view(['post'])
# def send_sms(request):
#     pass
