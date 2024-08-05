---@param vehicle number Vehicle server entity id
---@param netId number Vehicle net id
function showroomVehicleSpawned(vehicle, netId)
    Entity(vehicle).state.Hotwired = 'Failed' --mk_vehiclekeys disable hotwire
    Entity(vehicle).state.LockpickDisabled = true --mk_vehiclekeys disable lockpicking
    --custom server side code for showroom vehicles

end

---@param vehicle number Vehicle server entity id
---@param netId number Vehicle net id
function testDriveVehicleSpawned(vehicle, netId)
    Entity(vehicle).state.Hotwired = 'Failed' --mk_vehiclekeys disable hotwire
    Entity(vehicle).state.LockpickDisabled = true --mk_vehiclekeys disable lockpicking
    --custom server side code for test drive vehicles

end

---@param playerSource number Player server id
---@param vehicle number Vehicle server entity id
---@param netId number Vehicle net id
function testDriveTimeExpired(playerSource, vehicle, netId)
    if vehicle and DoesEntityExist(vehicle) then --check the vehicle wasn't deleted
        --custom server side code for test drive expired.

    end
end

---@param location string Location label where vehicle was purchased
---@param buyerSource number Vehicle buyer server id
---@param buyerIdentifier string Vehicle buyer identifier
---@param sellerSource number Vehicle seller server id
---@param sellerIdentifier string Vehicle seller identifier
---@param modelName string Vehicle spawn code
---@param price number Total vehicle price including any fees
---@param financed boolean If vehicle was financed or not
---@param plate string Vehicle plate
---@param netId number Vehicle net id
function vehiclePurchased(location, buyerSource, buyerIdentifier, sellerSource, sellerIdentifier, modelName, price, financed, plate, netId)
    --custom server side code for after a vehicle purchase

end

---@param vehicle number Vehicle server entity id
---@param netId number Vehicle net id
function rentalVehicleSpawned(vehicle, netId)
    --custom server side code for job rented vehicles

end

---@param vehicle number Vehicle server entity id
---@param netId number Vehicle net id
function restockVehicleSpawned(vehicle, netId)
    Entity(vehicle).state.Hotwired = 'Failed' --mk_vehiclekeys disable hotwire
    Entity(vehicle).state.LockpickDisabled = true --mk_vehiclekeys disable lockpicking
    --custom server side code for restock spawned vehicles

end

---@param playerSource number Player server id
---@param playerIdentifier string Player identifier
---@param locationName string Location label where vehicle was delivered
---@param amountPaid number Amount paid to the player
---@param vehicleModel string Vehicle spawn code
function restockJobCompleted(playerSource, playerIdentifier, locationName, amountPaid, vehicleModel)
    --custom server side code for when a player finished a restock job

end