from pymongo.mongo_client import MongoClient
import certifi



uri = "mongodb+srv://women:women@cluster0.fuz1qu9.mongodb.net/?retryWrites=true&w=majority"  

ca = certifi.where()
client = MongoClient(uri )

db = client['logincollection']
print("connection done ")

