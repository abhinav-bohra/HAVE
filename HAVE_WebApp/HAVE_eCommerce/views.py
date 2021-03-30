from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from .models import *
import random,datetime
from datetime import datetime, timedelta
from .forms import ProfileForm, UserCreateForm, SearchForm
from HAVE_eCommerce.udef_functions import *

def signin(request):
	if request.user.is_authenticated:
		return redirect('home')
	else:
		if request.method == 'POST':
			username = request.POST.get('username')
			password = request.POST.get('password')
			print(username,password)
			user = authenticate(request, username=username, password=password)

			if user is not None:
				login(request, user)
				return redirect('home')
			else:
			    messages.warning(request, 'Username or Password Incorrect')                
			
		context = {}
		return render(request, 'HAVE_eCommerce/signin.html', context)

def signup(request):
    if request.method == 'POST':
        user_form    = UserCreateForm(request.POST)        
        profile_form = ProfileForm(request.POST)

        if user_form.is_valid():
            new_user     =user_form.save()
            firstName    =request.POST.get('firstName')
            lastName     =request.POST.get('lastName')
            addressLine1 =request.POST.get('addressLine1')
            addressLine2 =request.POST.get('addressLine2')
            city         =request.POST.get('city')
            state        =request.POST.get('state')
            country      =request.POST.get('country')
            pincode      =request.POST.get('pincode')
            phone1       =request.POST.get('phone1')
            phone2       =request.POST.get('phone2')
            email        =request.POST.get('email') 
            
            new_customer = Customer(user = new_user, firstName = firstName, lastName = lastName, addressLine1 = addressLine1,
            addressLine2 = addressLine2, city = city, state = state, country = country, pincode = pincode, phone1 = phone1,
            phone2 = phone2, email = email )

            new_customer.save()
            new_wallet = Wallet(balance=random.randint(250,15000), user=new_user)
            new_wallet.save()
            return redirect('signin')

        else:
            messages.error(request, "Error")
    else:
        user_form    = UserCreateForm()
        profile_form = ProfileForm()

    return render(request, 'HAVE_eCommerce/signup.html', {'user_form': user_form,'profile_form': profile_form})

def signout(request):
    logout(request)
    return render(request, 'HAVE_eCommerce/signout.html')

@login_required
def search(request,searchKey):
    #searchKey    = request.POST.get('searchKey')
    queryset = MetaKeyword.objects.all()    
    queryset = queryset.filter(metaKeyword__icontains=searchKey)
    
    if len(queryset)!=0:
        return render(request, 'HAVE_eCommerce/search_prod.html',{'queryset':queryset})
    else:
        return redirect('home')
    
    return render(request, 'HAVE_eCommerce/search_prod.html',{'queryset':queryset})

@login_required
def home(request):
    fashion = Product.objects.filter(category='Fashion')
    electronics = Product.objects.filter(category='Electronics')
    grocery = Product.objects.filter(category='Grocery')
    home_essentials = Product.objects.filter(category='Home Essentials')
    teams = Team.objects.filter()
    return render(request,'HAVE_eCommerce/home.html',{'fashion':fashion,'electronics':electronics,'grocery':grocery,'home_essentials':home_essentials,'teams':teams})

@login_required
def individual_purchase(request,productID):
    product = Product.objects.filter(productID=productID)
    teamID = 0
    return render(request,'HAVE_eCommerce/individual_purchase.html',{'product':product,'teamID':teamID})

@login_required
def team_purchase(request,productID):
    product = Product.objects.filter(productID=productID)
    teams = Team.objects.filter(productID=productID)
    return render(request,'HAVE_eCommerce/team_purchase.html',{'product':product,'teams':teams})

@login_required
def orders(request):
    current_user = request.user
    orders = Order.objects.select_related('productID','teamID').filter(user=current_user).order_by('-dateCreated')
    return render(request,'HAVE_eCommerce/orders.html',{'orders':orders})

@login_required
def checkout(request,productID,teamID,flag): 
    current_user = request.user 
    product = Product.objects.filter(productID=productID)    
    customer = Customer.objects.filter(user=current_user)
    wallet = Wallet.objects.filter(user=current_user)
    savings = product[0].individual_price - product[0].bulk_price
    nextTeamId = Team.objects.filter()
    if(flag):
        teamID = int(nextTeamId.order_by('-teamID')[0].teamID) + 1

    #On click payment button
    if request.method == 'POST':
        firstName = request.POST.get('firstName')
        lastName  = request.POST.get('lastName')
        Address   = request.POST.get('Address')

        balance = wallet[0].balance
        if(teamID):
            price = product[0].bulk_price
        else:
            price = product[0].individual_price

        if(checkBalance(balance, price)==True and product[0].stock !=0):
            #Create new Transaction
            new_transaction = Transaction(walletID = wallet.first(), total_amount = price)
            new_transaction.save()

            #Update Wallet
            update_wallet = Wallet.objects.get(pk=wallet.first().walletID)
            update_wallet.balance = balance - price
            update_wallet.save()
            
            #Create/Update Team
            if(teamID==0):
                teamid=None
                team = None
                ordertype = "INDIVIDUAL"
                stat = "DELIVERY IN PROGRESS"
            else:
                teamid=teamID
                ordertype = "TEAM"
                if(flag==0): #Team exists & increase its size
                    team = Team.objects.get(pk=teamid)
                    team.team_size = team.team_size + 1
                    team.save()
                else:
                    team = Team(teamID = teamid, productID=  product.first(), team_size=1)
                    team.save()

                #Update Team Status (for Order)
                if (team.team_size == product.first().req_team_size):
                    stat = "DELIVERY IN PROGRESS"
                    update_order = Order.objects.get(teamID=team)
                    update_order.status=stat
                    update_order.save()
                else:
                    stat = "TEAM IN PROGRESS"
           
            #Create New Order
            new_order = Order(productID = product.first(), transactionID = new_transaction, user=current_user,
                              teamID = team, cost=price, status = stat, orderType = ordertype)
            new_order.save()


            
            #Update Product Stock
            update_product = Product.objects.get(pk=product.first().productID)
            update_product.stock = update_product.stock - 1
            update_product.save()

            #Create new Delivery_Detail Row
            new_delivery = Delivery_Details(driverID = None, transactionID = new_transaction, 
            address= Address, date_of_departure= datetime.now(), date_of_arrival = datetime.now()+ timedelta(days=5), delivery_status="NULL" )
            new_delivery.save()
            return render(request,'HAVE_eCommerce/checkout-complete.html',{'order':new_order})

        else:
            messages.warning(request, 'Not Enough Balance to proceed')

    return render(request,'HAVE_eCommerce/checkout.html',{'product':product, 'customer': customer,'wallet':wallet, 'teamID':teamID,'savings':savings})

@login_required
def teams(request):
    current_user = request.user
    orders = Order.objects.select_related('productID','teamID').filter(user=current_user).exclude(teamID_id__isnull=True)
    items, item_ids = [], []
    
    for item in orders:
        if item.teamID not in item_ids:
            items.append(item)
            item_ids.append(item.teamID)

    return render(request,'HAVE_eCommerce/teams.html',{'orders':items})

@login_required
def account(request):
    current_user=request.user  
    customer = Customer.objects.filter(user=current_user).first()
    
    if request.method == 'POST':
        firstName    =request.POST.get('firstName')
        lastName     =request.POST.get('lastName')
        addressLine1 =request.POST.get('addressLine1')
        addressLine2 =request.POST.get('addressLine2')
        city         =request.POST.get('city')
        state        =request.POST.get('state')
        country      =request.POST.get('country')
        pincode      =request.POST.get('pincode')
        phone1       =request.POST.get('phone1')
        phone2       =request.POST.get('phone2')
        email        =request.POST.get('email') 
        
        Customer.objects.filter(user=current_user).update(user = current_user, firstName = firstName, lastName = lastName, addressLine1 = addressLine1,
        addressLine2 = addressLine2, city = city, state = state, country = country, pincode = pincode, phone1 = phone1,
        phone2 = phone2, email = email )

    return render(request,'HAVE_eCommerce/account.html',{'customer':customer})

def handler404(request,execption):
    return render(request,'404.html')

@login_required
def delete(request):
    object = User.objects.get(pk=request.user.id)
    object.delete()
    return render(request, 'HAVE_eCommerce/signout.html')

@login_required
def shop(request):
    context = {'products': Product.objects.all()}
    return render(request, 'HAVE_eCommerce/shop.html', context)

@login_required
def wallet(request):
    current_user=request.user
    wallet = Wallet.objects.filter(user=current_user)
    return render(request, 'HAVE_eCommerce/wallet.html', {'wallet':wallet})
    