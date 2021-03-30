from django import forms
from .models import Product, Customer, User
from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm

class UserCreateForm(UserCreationForm):
    class Meta:
        model = User
        fields = ("username", "password1", "password2")

    def save(self, commit=True):
        user = super(UserCreateForm, self).save(commit=False)
        if commit:
            user.save()
        return user
        
class ProfileForm(forms.ModelForm):    
    firstName    = forms.CharField(max_length=20,label="First Name")
    lastName     = forms.CharField(max_length=20)
    addressLine1 = forms.CharField(max_length=50)
    addressLine2 = forms.CharField(max_length=50)
    city         = forms.CharField(max_length=20)
    state        = forms.CharField(max_length=20)
    country      = forms.CharField(max_length=20)
    pincode      = forms.CharField(max_length=8)
    phone1       = forms.CharField(max_length=12)
    phone2       = forms.CharField(max_length=12)
    email        = forms.EmailField(max_length=20)

    class Meta:
        model  = Customer
        fields =["firstName", "lastName", "email",  "phone1", "phone2", 
                  "addressLine1", "addressLine2", "city", "state", "country", "pincode" ]

    def save(self, commit=True):
        customer = super(ProfileForm, self).save(commit=False)
        if commit:
            customer.save()
        return customer

class CheckoutForm(forms.ModelForm):    
    firstName    = forms.CharField(max_length=20)
    lastName     = forms.CharField(max_length=20)
    address      = forms.CharField(max_length=500)

class SearchForm(forms.ModelForm):    
    searchKey    = forms.CharField(max_length=50)