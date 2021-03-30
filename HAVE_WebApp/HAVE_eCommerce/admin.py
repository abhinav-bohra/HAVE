from django.contrib import admin

# Register your models here.
from .models import Customer, Supplier, Product, Sells, MetaKeyword, Wallet, Transaction, Order, Team, BelongsTo, Driver, Delivery_Details

admin.site.register(Customer)
admin.site.register(Supplier)
admin.site.register(Product)
admin.site.register(Sells)
admin.site.register(MetaKeyword)
admin.site.register(Wallet)
admin.site.register(Transaction)
admin.site.register(Order)
admin.site.register(Team)
admin.site.register(BelongsTo)
admin.site.register(Driver)
admin.site.register(Delivery_Details)