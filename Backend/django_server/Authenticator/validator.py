from UserData.models import User

def validate(entered_mob,entered_pass):
    objects=User.objects.all()
    for object in objects:
        if object.mobile == entered_mob:
            print("Entered Mobile Number : ",entered_mob)
        else:
            print("No record found")
