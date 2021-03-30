from django.db import models
from phone_field import PhoneField
from django.dispatch import receiver
from django.contrib.auth.models import User
from django.utils.translation import gettext_lazy as _
from django.db.models.signals import post_save, pre_save

'''
class User():
    user     -> primarykey
    password
    username
'''

class Customer(models.Model):
    user         = models.ForeignKey(User, related_name='customer', on_delete=models.CASCADE,primary_key=True)
    firstName    = models.CharField(max_length=20)
    lastName     = models.CharField(max_length=20)
    addressLine1 = models.CharField(max_length=50)
    addressLine2 = models.CharField(max_length=50,null=True)
    city         = models.CharField(max_length=20)
    state        = models.CharField(max_length=20)
    country      = models.CharField(max_length=20)
    pincode      = models.CharField(max_length=8,null=True)
    phone1       = PhoneField(blank=True, help_text='Contact phone number')
    phone2       = PhoneField(blank=True, help_text='Contact phone number')
    email        = models.CharField(max_length=50)
    dateCreated  = models.DateTimeField(auto_now_add=True,null=True)

class Supplier(models.Model):
    supplierID   = models.CharField(max_length=20,primary_key=True)
    username     = models.CharField(max_length=20, null=False)
    firstName    = models.CharField(max_length=20)
    lastName     = models.CharField(max_length=20)
    GSTINNum     = models.CharField(max_length=20)
    companyname  = models.CharField(max_length=20)    
    addressLine1 = models.CharField(max_length=50)
    addressLine2 = models.CharField(max_length=50,null=True)
    city         = models.CharField(max_length=20)
    state        = models.CharField(max_length=20)
    country      = models.CharField(max_length=20)
    pincode      = models.CharField(max_length=8,null=True)
    phone1       = PhoneField(blank=True, help_text='Contact phone number')
    phone2       = PhoneField(blank=True, help_text='Contact phone number')
    email        = models.CharField(max_length=50)
    password     = models.CharField(max_length=20)
    profileImg   = models.FileField(null=True,upload_to='supplier/')
    dateCreated  = models.DateTimeField(auto_now_add=True,null=True)

class Product(models.Model):
    productID           = models.CharField(max_length=20,primary_key=True)
    name                = models.CharField(max_length=32)
    category            = models.CharField(max_length=32)
    subcategory         = models.CharField(max_length=32, default="None")
    description         = models.CharField(max_length=200)
    stock               = models.IntegerField(null=False)
    individual_price    = models.FloatField(null=False)
    bulk_price          = models.FloatField()
    req_team_size       = models.IntegerField()
    dateCreated         = models.DateTimeField(auto_now_add=True,null=True)
    datePublised        = models.DateTimeField(null=True)
    webStatus           = models.BooleanField(default=False)
    image               = models.FileField(null=True,upload_to='products/')
    paymentMode         = models.CharField(max_length=32)

class Sells(models.Model):
    supplierID = models.ForeignKey(Supplier, on_delete=models.CASCADE)
    productID  = models.ForeignKey(Product, on_delete=models.CASCADE)

class MetaKeyword(models.Model):
    productID   = models.ForeignKey(Product, on_delete=models.CASCADE)
    metaKeyword = models.CharField(max_length=20)

class Wallet(models.Model):
    walletID   = models.AutoField(primary_key=True)
    user       = models.ForeignKey(User, on_delete=models.CASCADE)
    balance    = models.FloatField(default=0.0)  

class Transaction(models.Model):
    transactionID   = models.AutoField(primary_key=True)
    walletID        = models.ForeignKey(Wallet, on_delete=models.PROTECT)
    total_amount    = models.FloatField(null=False)  
    dateCreated     = models.DateTimeField(auto_now_add=True,null=True)

class Team(models.Model):
    teamID    = models.CharField(max_length=20,primary_key=True)
    productID = models.ForeignKey(Product, on_delete=models.CASCADE)
    team_size = models.IntegerField(default=1)

class Order(models.Model):
    orderID       = models.AutoField(primary_key=True)
    productID     = models.ForeignKey(Product, on_delete=models.PROTECT)
    transactionID = models.ForeignKey(Transaction, on_delete=models.PROTECT)
    user          = models.ForeignKey(User, on_delete=models.PROTECT)
    teamID        = models.ForeignKey(Team, on_delete=models.PROTECT,null=True)
    cost          = models.FloatField(null=False)  
    dateCreated   = models.DateTimeField(auto_now_add=True,null=True)
    status        = models.CharField(max_length=20)
    orderType     = models.CharField(max_length=20)    

class BelongsTo(models.Model):
    teamID     = models.ForeignKey(Team, on_delete=models.CASCADE)
    user       = models.ForeignKey(User, on_delete=models.CASCADE)

class Driver(models.Model):
    driverID    = models.CharField(max_length=20,primary_key=True)
    firstName   = models.CharField(max_length=20)
    lastName    = models.CharField(max_length=20)
    phone1      = models.IntegerField()
    hiringDate  = models.DateTimeField(auto_now_add=True,null=True)
    vehicle_no  = models.CharField(max_length=10)

class Delivery_Details(models.Model):
    driverID          = models.ForeignKey(Driver, on_delete=models.PROTECT, null=True)
    transactionID     = models.ForeignKey(Transaction, on_delete=models.PROTECT, null=False)
    address           = models.CharField(max_length=500)
    date_of_departure = models.DateTimeField(null=False)
    date_of_arrival   = models.DateTimeField(null=False)
    delivery_status   = models.CharField(max_length=10)