from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from UserData.serializers import User_Serializers
from rest_framework import status

from UserData.models import User
from django.http import JsonResponse
from .validator import validate


class UserView(APIView):
    # def get(self,request,entered_mob,entered_pass,*args,**kwargs):
    #     objects=User.objects.all()
    #     validate(entered_mob,entered_pass)

    #     serializer=User_Serializers(objects,many=True)
    #     return Response(serializer.data)
    def get(self, request, format=None):
        mobile_number = request.query_params.get('mobile')
        password = request.query_params.get('password')

        if not mobile_number or not password:
            return Response({'message': 'Mobile number and password are required.'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user = User.objects.get(mobile=mobile_number)
            if user.password == password:
                print("Successful")
                # print(Response({'message': 'Login successful'},status=200))
                print(JsonResponse({'message': 'Login successful'}))
                return JsonResponse({'message': 'Login successful'})
            else:
                return Response({'message': 'Invalid password'}, status=status.HTTP_401_UNAUTHORIZED)
        except User.DoesNotExist:
            return Response({'message': 'User not found'}, status=status.HTTP_404_NOT_FOUND)


    def post(self, request, *args, **kwargs):
            serializer = User_Serializers(data=request.data)
            if serializer.is_valid():
                mobile = serializer.validated_data['mobile']

                try:
                    existing_user = User.objects.get(mobile=mobile)
                    return Response({'message': 'User with this mobile number already exists.'}, status=status.HTTP_400_BAD_REQUEST)
                except User.DoesNotExist:
                    user = serializer.save()
                    return Response({'status': 200}, status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # def post(self, request, format=None):
    #     serializer = User_Serializers(data=request.data)
    #     if serializer.is_valid():
    #         mobile_number = serializer.validated_data['mobile']
    #         password = serializer.validated_data['password']

    #         try:
    #             user = User.objects.get(mobile_number=mobile)
    #             if user.password == password:
    #                 return Response({'message': 'Login successful'}, status=status.HTTP_200_OK)
    #             else:
    #                 return Response({'message': 'Invalid password'}, status=status.HTTP_401_UNAUTHORIZED)
    #         except User.DoesNotExist:
    #             return Response({'message': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)