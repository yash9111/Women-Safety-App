from rest_framework.response import Response
import random
from rest_framework import status
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

    otp = random.randint(100000,999999)

    request.session['otp'] = otp

    if data.get('phone_number') is None:
        return Response({'msg':'required+'},status=status.HTTP_401_UNAUTHORIZED)

    else:
     
      try:
        print(data.get('phone_number'))
        print("done")
        account_sid = settings.ACCOUNT_SID
        auth_token = settings.AUTH_TOKEN

        client = Client(account_sid , auth_token)

        message = client.messages.create(
           from_='+12568184915',
           body = f'your otp is {otp} please do not share this otp to anyone',
           to = data.get('phone_number')
           )
        return Response(status=status.HTTP_200_OK)
        
      except Exception as e:
         print(e)

    return Response({
           'msg':"otp sent",
       })


@api_view(['post'])
def checkotp(request):
   data = request.data
   request.session['otp']=123
   if data.get('otp') is None:
      print()
      return Response(status=status.HTTP_409_CONFLICT)

   if data.get('otp') == 123:
      print(123)
      return Response({'msg':'ok'},status=status.HTTP_200_OK)
   return Response(
      {'msg':'reso'}
   )
      

@api_view(['post'])
def register_user(request):
    data = request.data

    records = {
       "phone_number":data.get['phone_number'],
       "password":data.get['passsword']
    }
    find_user =user_collection.find({"phone_number":data.get["phone_number"]})
    if find_user is None:
       user_collection.insert_one(records)
       return Response(status=status.HTTP_201_CREATED)
    else:
       return Response(status=status.HTTP_208_ALREADY_REPORTED)


@api_view(['post'])
def loginuser(request):
   
   data = request.data
   
   find_user =user_collection.find({"phone_number":data.get["phone_number"]},{"password":data.get["password"]})

   while True:
      
      if find_user is None:
        return Response(status=status.HTTP_404_NOT_FOUND)
      else:
         return Response(status=status.HTTP_302_FOUND)
   


# @api_view(['post'])
# def send_sms(request):
#     pass
