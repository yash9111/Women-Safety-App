from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from UserData.serializers import User_Serializers
from UserData.models import User
from django.http import JsonResponse


class UserView(APIView):
    def get(self,request,*args,**kwargs):
        return Response({
            'name':"Yash",
            'mobile':938323932,
            'password':'dsfhadosfh'
        })
    
    def post(self,request,*agrs,**kwargs):
        serializer=User_Serializers(data=request.data)
        if not serializer.is_valid():
            return JsonResponse(serializer.errors, status=400)
        else:
            user = serializer.save()
        return Response({'status':200})