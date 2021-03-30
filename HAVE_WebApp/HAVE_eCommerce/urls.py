from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path
from HAVE_eCommerce import views
from django.views.static import serve


urlpatterns = [
    path('', views.signin, name='signin'),
    path('signup/', views.signup, name='signup'),
    path('signout/', views.signout, name='signout'),
    path('home/', views.home, name='home'),
    path('orders/', views.orders, name='orders'),
    path('teams/', views.teams, name='teams'),
    path('account/', views.account, name='account'),
    path('delete/', views.delete, name='delete'),
    path('search/<searchKey>', views.search, name='search'),
    path('wallet', views.wallet, name='wallet'),
    path('shop/',views.shop, name='shop'),
    path('product/individual_purchase/<int:productID>/', views.individual_purchase, name='individual_purchase'),
    path('product/team_purchase/<int:productID>/', views.team_purchase, name='team_purchase'),
    path('product/checkout/<int:productID>/<int:teamID>/<int:flag>', views.checkout, name='checkout')    
]

handler404 = 'HAVE_eCommerce.views.handler404'