from pymongo.mongo_client import MongoClient
import certifi
from django.conf import settings


uri = settings.URI
client = MongoClient(uri )

db = client['safetyapp']
  


