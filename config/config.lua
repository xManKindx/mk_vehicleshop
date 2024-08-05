Config = {
    FinancePaymentTimer = 24, --hours spent in server before finance payment is due
    FinancePaymentPercent = 20, --20% of finance total due at each payment time
    FinanceUpdateInterval = 30, --Update payment timers every 30 minutes
    NotifyUponFinanceDue = true, --Notify player when a payment is due (Notify will show upon login and when payment timer expires)
    MaxVehicleFinanceAmount = 2, --Number of vehicles a player can have on finance at a time

    WarpPlayerIntoVehicle = true, --Warp player on vehicle purchase and test drive start

    CurrencyIcon = 'dollar-sign', --'euro-sign' (Icon on text box fields for money input)

    TextUI = { --ox_lib
        ReturnTestDriveVehicle = true, --display text ui when in the area of a vehicle shop and in driver seat of your test drive vehicle
        Position = 'left-center', --left-center / right-center / top-center
        Icon = {
            Icon = 'fa-sharp fa-solid fa-car-side', --FONT AWESOME ICON
            Color = 'white', --ICON COLOR
        },
        Style = { --REACT.CSS PROPERTIES STYLING
            borderRadius = 0,
            backgroundColor = '#1A626B', --BACKGROUND
            color = 'white' --TEXT COLOR
        }
    },

    PlateTheme = {
        --MAKE YOUR OWN CUSTOM THEME FOR PLATES TO MATCH YOUR SERVER PLATES
        --PARAMS YOU CAN USE {number} = random number 0-9 {letter} = random letter a-z {space} = a space
        --YOU CAN ALSO DEFINE A STRING: EXAMPLE: 
            --'ESX',
            --'{space}',
            --'{number}',
            --'{number}',
            --'{letter}',
            --'{letter}'
                --This would produce a plate like 'ESX 09AZ'
        --8 CHARACTERS IS THE MAX FOR A PLATE. DO NOT ADD ANYTHING BESIDES NUMBERS/LETTERS/SPACE OR YOU WILL BREAK YOUR DATABASE
        '{number}',
        '{letter}',
        '{letter}',
        '{number}',
        '{number}',
        '{number}',
        '{letter}',
        '{letter}'
    },

    UseVehicleImages = true, --show vehicle image in categories menu

    ---@param vehicleModel number Vehicle model number
    ---@param vehicleName string Vehicle spawn code
    ---@return string # Vehicle image link
    GetVehicleImageLink = function(vehicleModel, vehicleName)
        vehicleName = vehicleName:lower()

        if LoadResourceFile('mk_utils', 'vehicleimages/'..vehicleName..'.png') then --image file exists
            return 'nui://mk_utils/vehicleimages/'..vehicleName..'.png'
        else
            local imageLink = 'https://raw.githubusercontent.com/xManKindx/vehicleimages/main/png/'..vehicleName..'.png'
            local linkPromise = promise.new()

            PerformHttpRequest(imageLink, function(status, response)
                if status == 200 then --image link was valid
                    linkPromise:resolve(imageLink)
                else
                    if LoadResourceFile('mk_utils', 'vehicleimages/placeholder.png') then --use placeholder image from mk_utils
                        linkPromise:resolve('nui://mk_utils/vehicleimages/placeholder.png')
                    else --use placeholder image from github
                        linkPromise:resolve('https://raw.githubusercontent.com/xManKindx/vehicleimages/main/png/placeholder.png')
                    end
                end
            end, 'GET')

            return Citizen.Await(linkPromise)
        end
    end
}