Config.Logs = {
    WebHook = '', --Discord webhook

    ---@param location string Location label where vehicle was purchased
    ---@param buyerSource number Vehicle buyer server id
    ---@param buyerIdentifier string Vehicle buyer identifier
    ---@param sellerSource number Vehicle seller server id
    ---@param sellerIdentifier string Vehicle seller identifier
    ---@param sellerCommission number|false Amount paid to seller as commission
    ---@param societyDeposit number|false Amount paid to location society for sale
    ---@param modelName string Vehicle spawn code
    ---@param price number Total vehicle price including any fees
    ---@param financed boolean If vehicle was financed or not
    ---@param downPayment number|false Amount paid at purchase time if vehicle was financed
    ---@param plate string Vehicle plate
    VehiclePurchased = function(location, buyerSource, buyerIdentifier, sellerSource, sellerIdentifier, sellerCommission, societyDeposit, modelName, price, financed, downPayment, plate)
        local logString

        if not sellerCommission then sellerCommission = 0 end
        if not societyDeposit then societyDeposit = 0 end
        if not downPayment then downPayment = 0 end

        if financed then
            if sellerIdentifier then --sold by a player under finance
                logString = '**(Player: '..sellerIdentifier..' | ID: '..sellerSource..')** Has sold vehicle **(Model: '..modelName..' | Plate: '..plate..')** to **(Player: '..buyerIdentifier..' | ID: '..buyerSource..')** At **'..location..'** For a total finance price of **($'..utils:formatThousand(price)..')** With a downpayment of **($'..utils:formatThousand(downPayment)..') (Seller Commission: $'..utils:formatThousand(sellerCommission)..' | Society Deposit: $'..utils:formatThousand(societyDeposit)..')**'
            else --bought by a player under finance
                logString = '**(Player: '..buyerIdentifier..' | ID: '..buyerSource..')** Has purchased vehicle **(Model: '..modelName..' | Plate: '..plate..')** At **'..location..'** For a total finance price of **($'..utils:formatThousand(price)..')** With a downpayment of **($'..utils:formatThousand(downPayment)..') (Society Deposit: $'..utils:formatThousand(societyDeposit)..')**'
            end
        else
            if sellerIdentifier then --sold by a player without finance
                logString = '**(Player: '..sellerIdentifier..' | ID: '..sellerSource..')** Has sold vehicle **(Model: '..modelName..' | Plate: '..plate..')** to **(Player: '..buyerIdentifier..' | ID: '..buyerSource..')** At **'..location..'** For a total price of **($'..utils:formatThousand(price)..') (Seller Commission: $'..utils:formatThousand(sellerCommission)..' | Society Deposit: $'..utils:formatThousand(societyDeposit)..')**'
            else --bought by a player without finance
                logString = '**(Player: '..buyerIdentifier..' | ID: '..buyerSource..')** Has purchased vehicle **(Model: '..modelName..' | Plate: '..plate..')** At **'..location..'** For a total price of **($'..utils:formatThousand(price)..') (Society Deposit: $'..utils:formatThousand(societyDeposit)..')**'
            end
        end

        utils:discordLog(Config.Logs.WebHook, 'Vehicle Purchased', 5763719, logString)
    end,

    ---@param playerSource number Player server id
    ---@param playerIdentifier string Player identifier
    ---@param locationName string Location label where vehicle was delivered
    ---@param amountPaid number Amount paid from society account for vehicles
    ---@param vehicleModel string Vehicle spawn code
    RestockJobCompleted = function(playerSource, playerIdentifier, locationName, amountPaid, vehicleModel)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Received **$'..utils:formatThousand(amountPaid)..'** for restocking [**1**] [**'..vehicleModel..'**] at [**'..locationName..'**]'

        utils:discordLog(Config.Logs.WebHook, 'Restock Job Completed', 2123412, logString)
    end,

    ---@param playerSource number Player server id
    ---@param playerIdentifier string Player identifier
    ---@param locationName string Location label where vehicles were restocked
    ---@param vehicleModel string Vehicle spawn code
    ---@param amount number Number of vehicles added to stock
    ManualStockAdded = function(playerSource, playerIdentifier, locationName, vehicleModel, amount)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Restocked [**'..amount..'**] [**'..vehicleModel..'**] at [**'..locationName..'**]'

        utils:discordLog(Config.Logs.WebHook, 'Restock Purchase', 11027200, logString)
    end
}