def getPurchaseType(url):
    if "individual_purchase" in url:
        return 0
    elif "team_purchase" in url:
        return 1
    else:
        return -1

def checkBalance(balance, price):
    if(balance>=price):
        return True
    return False
