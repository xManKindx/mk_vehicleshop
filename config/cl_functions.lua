---@param vehicle number Vehicle entity id
---@param plate string Vehicle plate
function giveKeys(vehicle, plate)
    if GetResourceState('mk_vehiclekeys') == 'started' then
        exports['mk_vehiclekeys']:AddKey(vehicle)
    elseif GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    elseif GetResourceState('Renewed-Vehiclekeys') == 'started' then
        exports['Renewed-Vehiclekeys']:addKey(plate)
    else
        --custom give keys
    end
end

---@param vehicle number Vehicle entity id
---@param plate string Vehicle plate
function removeKeys(vehicle, plate)
    if GetResourceState('mk_vehiclekeys') == 'started' then
        exports['mk_vehiclekeys']:RemoveKey(vehicle)
    elseif GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    elseif GetResourceState('Renewed-Vehiclekeys') == 'started' then
        exports['Renewed-Vehiclekeys']:addKey(plate)
    else
        --custom give keys
    end
end

---@param vehicle number Vehicle entity id
function setFuel(vehicle)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, 100)
    elseif GetResourceState('ox_fuel') == 'started' then
        Entity(vehicle).state:set('fuel', 100, true)
    elseif GetResourceState('cdn-fuel') == 'started' then
        exports['cdn-fuel']:SetFuel(vehicle, 100)
    else
        --custom fuel set
    end
end

---@param vehicle number Vehicle entity id
function showroomVehicleSpawned(vehicle)
    --custom client side code for showroom vehicles

end

---@param vehicle number Vehicle entity id
function testDriveVehicleSpawned(vehicle)
    --custom client side code for showroom vehicles

end

---@param vehicle number Vehicle to attach onto tow truck entity id
---@param towTruck number Tow truck entity id
---@param cb function Callback to script if vehicle was attached or not
function attachVehicleToTowTruck(vehicle, towTruck, cb)
    --client side code to attach vehicle to tow truck

    local min, max = GetModelDimensions(GetEntityModel(vehicle))

    if NetworkGetEntityOwner(vehicle) ~= cache.playerId then NetworkRequestControlOfEntity(vehicle) end
    if NetworkGetEntityOwner(towTruck) ~= cache.playerId then NetworkRequestControlOfEntity(towTruck) end

    AttachEntityToEntity(vehicle, towTruck, GetEntityBoneIndexByName(towTruck, 'bodyshell'), 0.0, -1.5 + -0.85, 0.30 - min.z, 0, 0, 0, false, true, true, false, 0, true)

    cb(true) --vehicle was loaded onto the truck
end

---@param vehicle number Vehicle to detach from tow truck entity id
---@param towTruck number Tow truck entity id
---@param cb function Callback to script if vehicle was detached or not
function detachVehicleFromTowTruck(vehicle, towTruck, cb)
    --client side code to detach vehicle from tow truck
    local truckOffset = GetOffsetFromEntityInWorldCoords(towTruck, 0.0, 0.0, 0.0)
    local truckCoords = GetEntityCoords(towTruck, false)
    local vehicleOffset = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.0, 0.0)
    local truckMin, truckMax = GetModelDimensions(GetEntityModel(towTruck))
    local vehicleMin, vehicleMax = GetModelDimensions(GetEntityModel(vehicle))
    local vehicleLength = math.ceil(vehicleMax.y - vehicleMin.y)
    local truckLength = vehicleLength < 6 and math.ceil((truckMax.y - truckMin.y) * 0.75) or math.ceil((truckMax.y - truckMin.y) * 0.50)
    local totalLength = ((truckLength + vehicleLength) + 0.0)

    if NetworkGetEntityOwner(vehicle) ~= cache.playerId then NetworkRequestControlOfEntity(vehicle) end
    if NetworkGetEntityOwner(towTruck) ~= cache.playerId then NetworkRequestControlOfEntity(towTruck) end

    AttachEntityToEntity(vehicle, towTruck, 20, -0.0, 0.0 - totalLength, ((truckOffset.z - (truckCoords.z - (vehicleOffset.z - truckOffset.z))) * -1) + 0.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)

    Wait(100)

    DetachEntity(vehicle, false, false)

    cb(true) --vehicle was unloaded from the truck
end