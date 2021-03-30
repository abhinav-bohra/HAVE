from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
    
def home(request):
    return render(request,'HAVE_Admin_Panel/home.html')
    