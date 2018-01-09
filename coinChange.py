coins = [1,3,7]
target_value = 7

def getNumCoins(coinValueArray, targetValue):

    bestNumCoins = [0] * (targetValue+1) # 0 to target value,

    # Every single combination of coins to make current target value
    for currentValue in range(1, len(bestNumCoins)): # don't use .. here
        bestNumCoins[currentValue] = 99999 # Should be infinity but this will be sufficient for quick and dirty
        for coinValueIndex in range(len(coinValueArray)):
            if currentValue >= coinValueArray[coinValueIndex]:
                if bestNumCoins[currentValue-coinValueArray[coinValueIndex]]+1 < bestNumCoins[currentValue]:
                    bestNumCoins[currentValue] = bestNumCoins[currentValue-coinValueArray[coinValueIndex]]+1

    return bestNumCoins


output = getNumCoins(coins, target_value)
print('coins: {0}'.format(coins))
print('target_value: {0}'.format(target_value))

for i in range(0, len(output)):
    print('make : {0} takes {1} coins'.format(i, output[i]))

