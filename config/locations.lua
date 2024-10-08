Config.Locations = {
    {
        name = 'pdm', --used in db, also used to get category vehicles
        label = 'PDM', --displayed in vehicle menu
        plateListing = 'FOR SALE', --plate shown on vehicles in the shop
        blip = {
            coords = vec3(-44.29, -1098.8, 26.42),
            name = 'PDM',
            sprite = 810,
            color = 3,
            shortRange = true,
            scale = 0.6
        },
        categories = {
            'compacts',
            'coupes',
            'cycles',
            'motorcycles',
            'muscle',
            'offroad',
            'sedans',
            'sports',
            'sportsclassics',
            'super',
            'suvs',
            'vans',
        },
        zone = {
            coords = { --ox_lib zone around the vehicle shop
                vec3(-70.0, -1118.0, 26.0),
                vec3(-69.0, -1111.0, 26.0),
                vec3(-54.0, -1069.0, 26.0),
                vec3(-22.0, -1081.0, 26.0),
                vec3(-20.0, -1075.0, 26.0),
                vec3(-2.0, -1082.0, 26.0),
                vec3(-15.0, -1121.0, 26.0),
                vec3(-65.0, -1123.0, 26.0),
            },
            thickness = 4.0,
            debug = false
        },
        showroomSpots = { --showroom vehicles where players open vehicle menu
            { coords = vec4(-39.4, -1099.97, 26.1, 189.85) },
            { coords = vec4(-45.12, -1097.81, 26.1, 13.51) },
            { coords = vec4(-51.29, -1095.28, 26.1, 203.62) },
        },
        spawnPoints = { --spawn points that purchased and test drive vehicles can spawn in
            vec4(-10.78, -1095.5, 26.69, 69.81),
            vec4(-11.93, -1098.49, 26.69, 69.55),
            vec4(-12.98, -1101.29, 26.69, 69.71),
            vec4(-14.06, -1104.41, 26.69, 69.99),
            vec4(-15.12, -1107.37, 26.69, 69.91),
            vec4(-17.22, -1110.07, 26.68, 68.03),
            vec4(-18.34, -1112.95, 26.69, 69.18)
        },
        testDrive = {
            enable = true,
            time = 10, --minutes (set to 0 or false to not use a time limit)
            disableVehicle = true, --disable vehicle from being driven if not returned before timer expires
            deleteVehicle = true, --delete vehicle if not returned before timer expires (wont delete until all players have left the vehicle)
        },
        finance = {
            enable = true,
            fee = 0.10, --fee added to vehicle sale price (0.10 = 10%) (set to false or 0 to disable)
            downpayment = true, --payment due upon purchase 
            downpaymentMinimum = 0.20, --minimum money player has to pay to finance the vehicle (set to false or 0 to disable)
        },
        playerOwned = {
            enable = true,
            job = 'cardealer',
            salesCommission = 0.10, --percentage of vehicle price to goto player who sells a vehicle (the rest goes into society account)
            sellGrades = {1, 2, 3, 4}, --job grades that can sell vehicles to other players
            nonWorkerPurchasing = {
                enable = false, --let players purchase vehicles themselves (not from a sales person)
                noWorkers = false, --only allow players to purchase their own vehicles if no workers are clocked in
                fee = 0.10 --fee to add ontop of vehicle price if purchasing themselves instead of through a worker (set to false or 0 to disable)
            },
            vehicleStock = {
                enable = true, --false vehicles always available / true vehicles must be restocked before players can purchase
                defaultStock = 2, --how many available to start for each vehicle (stock generated automatically for newly added vehicles)
                restockCostPercentage = 0.70, --percentage of vehicle selling price used for purchasing a vehicle for restock (0.70 = 70%)
                restockJob = {
                    enable = true, --false restock by buying through the vehicle menu / true restock by players physically picking up vehicles and bringing to the shop
                    vehicle = {
                        required = true, --true to spawn a rented vehicle to complete the delivery / false no vehicle is spawned for completing the job
                        rentalFee = 500,
                        model = 'flatbed',
                        spawnPoints = {
                            vec4(-48.43, -1074.47, 26.97, 70.61),
                            vec4(-50.16, -1079.31, 26.93, 69.9)
                        }
                    },
                    jobs = { --list of jobs that can complete deliveries for this vehicle shop
                        cardealer = {0, 1, 2, 3, 4}, --job grades allowed to request work
                        --otherjob = {grades},
                    },
                    pickupLocations = { --locations where vehicles can spawn for delivery job pickup
                        vec4(153.03, 6415.59, 31.5, 72.76), --paleto
                        vec4(-420.5, -2271.75, 7.88, 268.5), --docks
                        vec4(135.45, -3333.69, 6.29, 273.75), --docks
                        vec4(521.29, -2934.13, 6.32, 270.34), --docks
                        vec4(1032.71, -2915.21, 6.17, 89.86), --docks
                    },
                    deliveryLocation = { --location vehicle is delivered to
                        coords = vec3(-47.87, -1078.64, 28.26),
                        radius = 20, --radius from delivery location where vehicle can be delivered
                    },
                    paymentPerMile = { --payment for vehicle delivery based on miles between shop and vehicle pickup location (round trip) (minimum distance is 2 mile round trip for payment calculation)
                        min = 150,
                        max = 200
                    }
                }
            },
        },
        interactionPed = { --NPC used to open finance menu, restock job and toggle duty for player owned locations (will not spawn if finance and player owned options are disabled for this location)
            coords = vec4(-55.59, -1098.03, 26.42, 352.16),
            model = 'u_f_m_debbie_01',
            idleAnimation = { --animation ped plays while not being interacted with
                enable = true,
                dict = 'anim@miss@low@fin@vagos@',
                name = 'idle_ped06'
            },
            toggleDutyAnimation = {
                enable = true,
                dict = 'anim@scripted@player@mission@tunf_bunk_ig3_nas_upload@',
                name = 'normal_typing',
                duration = 5000,
                flags = 1
            },
            speech = {
                onDuty = {
                    enable = true,
                    speechName = 'GENERIC_HOWS_IT_GOING',
                    voiceName = 'a_f_y_business_02_white_full_01',
                    speechParam = 'SPEECH_PARAMS_FORCE_SHOUTED',
                },
                offDuty = {
                    enable = true,
                    speechName = 'GENERIC_BYE',
                    voiceName = 'a_f_y_business_02_white_full_01',
                    speechParam = 'SPEECH_PARAMS_FORCE_SHOUTED',
                }
            }
        },
    },
    {
        name = 'boats', --used in db, also used to get category vehicles
        label = 'Boat Shop', --displayed in vehicle menu
        plateListing = 'FOR SALE', --plate shown on vehicles in the shop
        blip = {
            coords = vector3(-730.76, -1310.42, 5.0),
            name = 'Boat Shop',
            sprite = 371,
            color = 3,
            shortRange = true,
            scale = 0.6
        },
        categories = {
            'boats',
        },
        zone = {
            coords = { --ox_lib zone around the vehicle shop
                vec3(-728.0, -1311.0, 0.0),
                vec3(-707.0, -1330.0, 0.0),
                vec3(-733.0, -1355.0, 0.0),
                vec3(-752.0, -1341.0, 0.0),
            },
            thickness = 6.0,
            debug = false
        },
        showroomSpots = { --showroom vehicles where players open vehicle menu
            { coords = vec4(-725.17, -1328.53, 0.12, 228.23) },
            { coords = vec4(-731.67, -1334.29, 0.12, 229.92) },
            { coords = vec4(-737.62, -1341.02, 0.12, 229.77) },
        },
        spawnPoints = { --spawn points that purchased and test drive vehicles can spawn in
            vec4(-719.13, -1345.05, 0.18, 141.36),
            vec4(-723.37, -1350.3, 0.12, 136.75)
        },
        testDrive = {
            enable = true,
            time = 10, --minutes (set to 0 or false to not use a time limit)
            disableVehicle = true, --disable vehicle from being driven if not returned before timer expires
            deleteVehicle = true, --delete vehicle if not returned before timer expires (wont delete until all players have left the vehicle)
        },
        finance = {
            enable = true,
            fee = 0.10, --fee added to vehicle sale price (0.10 = 10%) (set to false or 0 to disable)
            downpayment = true, --payment due upon purchase 
            downpaymentMinimum = 0.20, --minimum money player has to pay to finance the vehicle (set to false or 0 to disable)
        },
        playerOwned = {
            enable = false,
            job = 'cardealer',
            salesCommission = 0.10, --percentage of vehicle price to goto player who sells a vehicle (the rest goes into society account)
            sellGrades = {1, 2, 3, 4}, --job grades that can sell vehicles to other players
            nonWorkerPurchasing = {
                enable = false, --let players purchase vehicles themselves (not from a sales person)
                noWorkers = false, --only allow players to purchase their own vehicles if no workers are clocked in
                fee = 0.10 --fee to add ontop of vehicle price if purchasing themselves instead of through a worker (set to false or 0 to disable)
            },
            vehicleStock = {
                enable = true, --false vehicles always available / true vehicles must be restocked before players can purchase
                defaultStock = 2, --how many available to start for each vehicle (stock generated automatically for newly added vehicles)
                restockCostPercentage = 0.70, --percentage of vehicle selling price used for purchasing a vehicle for restock (0.70 = 70%)
                restockJob = {
                    enable = true, --false restock by buying through the vehicle menu / true restock by players physically picking up vehicles and bringing to the shop
                    vehicle = {
                        required = true, --true to spawn a rented vehicle to complete the delivery / false no vehicle is spawned for completing the job
                        rentalFee = 500,
                        model = 'flatbed',
                        spawnPoints = {
                            vec(-743.28, -1307.07, 5.09, 49.75)
                        }
                    },
                    jobs = { --list of jobs that can complete deliveries for this vehicle shop
                        cardealer = {0, 1, 2, 3, 4}, --job grades allowed to request work
                        --otherjob = {grades},
                    },
                    pickupLocations = { --locations where vehicles can spawn for delivery job pickup
                        vec4(153.03, 6415.59, 31.5, 72.76), --paleto
                        vec4(-420.5, -2271.75, 7.88, 268.5), --docks
                        vec4(135.45, -3333.69, 6.29, 273.75), --docks
                        vec4(521.29, -2934.13, 6.32, 270.34), --docks
                        vec4(1032.71, -2915.21, 6.17, 89.86), --docks
                    },
                    deliveryLocation = { --location vehicle is delivered to
                        coords = vec3(-788.63, -1500.7, -0.47),
                        radius = 20, --radius from delivery location where vehicle can be delivered
                    },
                    paymentPerMile = { --payment for vehicle delivery based on miles between shop and vehicle pickup location (round trip) (minimum distance is 2 mile round trip for payment calculation)
                        min = 150,
                        max = 200
                    }
                }
            },
        },
        interactionPed = { --NPC used to open finance menu, restock job and toggle duty for player owned locations (will not spawn if finance and player owned options are disabled for this location)
            coords = vector4(-730.76, -1310.42, 5.0, 50.73),
            model = 'u_f_m_debbie_01',
            idleAnimation = { --animation ped plays while not being interacted with
                enable = true,
                dict = 'anim@miss@low@fin@vagos@',
                name = 'idle_ped06'
            },
            toggleDutyAnimation = {
                enable = false,
                dict = 'anim@scripted@player@mission@tunf_bunk_ig3_nas_upload@',
                name = 'normal_typing',
                duration = 5000,
                flags = 1
            },
            speech = {
                onDuty = {
                    enable = true,
                    speechName = 'GENERIC_HOWS_IT_GOING',
                    voiceName = 'a_f_y_business_02_white_full_01',
                    speechParam = 'SPEECH_PARAMS_FORCE_SHOUTED',
                },
                offDuty = {
                    enable = true,
                    speechName = 'GENERIC_BYE',
                    voiceName = 'a_f_y_business_02_white_full_01',
                    speechParam = 'SPEECH_PARAMS_FORCE_SHOUTED',
                }
            }
        },
    },
    --[[{
        name = 'luxury', --used in db, also used to get category vehicles
        label = 'PDM - Luxury', --displayed in vehicle menu
        plateListing = 'FOR SALE', --plate shown on vehicles in the shop
        blip = {
            coords = vector3(-1255.44, -357.23, 36.91),
            name = 'PDM - Luxury',
            sprite = 810,
            color = 3,
            shortRange = true,
            scale = 0.6
        },
        categories = {
            'luxury',
        },
        zone = {
            coords = { --ox_lib zone around the vehicle shop
                vec3(-1237.0, -329.0, 37.0),
                vec3(-1223.0, -356.0, 37.0),
                vec3(-1270.0, -380.0, 37.0),
                vec3(-1280.0, -357.0, 37.0),
                vec3(-1277.0, -351.0, 37.0),
            },
            thickness = 4.0,
            debug = false
        },
        showroomSpots = { --showroom vehicles where players open vehicle menu
            { coords = vec4(-1265.17, -355.17, 36.23, 205.55) },
            { coords = vec4(-1269.48, -358.75, 36.23, 246.72) },
            { coords = vec4(-1268.7, -364.7, 36.23, 296.61) },
        },
        spawnPoints = { --spawn points that purchased and test drive vehicles can spawn in
            vec4(-1232.44, -349.33, 36.66, 26.49),
            vec4(-1236.58, -351.56, 36.66, 28.36),
        },
        testDrive = {
            enable = true,
            time = 10, --minutes (set to 0 or false to not use a time limit)
            disableVehicle = true, --disable vehicle from being driven if not returned before timer expires
            deleteVehicle = true, --delete vehicle if not returned before timer expires (wont delete until all players have left the vehicle)
        },
        finance = {
            enable = true,
            fee = 0.10, --fee added to vehicle sale price (0.10 = 10%) (set to false or 0 to disable)
            downpayment = true, --payment due upon purchase 
            downpaymentMinimum = 0.20, --minimum money player has to pay to finance the vehicle (set to false or 0 to disable)
        },
        playerOwned = {
            enable = true,
            job = 'cardealer',
            salesCommission = 0.10, --percentage of vehicle price to goto player who sells a vehicle (the rest goes into society account)
            sellGrades = {1, 2, 3, 4}, --job grades that can sell vehicles to other players
            nonWorkerPurchasing = {
                enable = false, --let players purchase vehicles themselves (not from a sales person)
                noWorkers = false, --only allow players to purchase their own vehicles if no workers are clocked in
                fee = 0.10 --fee to add ontop of vehicle price if purchasing themselves instead of through a worker (set to false or 0 to disable)
            },
            vehicleStock = {
                enable = true, --false vehicles always available / true vehicles must be restocked before players can purchase
                defaultStock = 2, --how many available to start for each vehicle (stock generated automatically for newly added vehicles)
                restockCostPercentage = 0.70, --percentage of vehicle selling price used for purchasing a vehicle for restock (0.70 = 70%)
                restockJob = {
                    enable = true, --false restock by buying through the vehicle menu / true restock by players physically picking up vehicles and bringing to the shop
                    vehicle = {
                        required = true, --true to spawn a rented vehicle to complete the delivery / false no vehicle is spawned for completing the job
                        rentalFee = 500,
                        model = 'flatbed',
                        spawnPoints = {
                            vec4(-1278.38, -373.17, 36.62, 30.48),
                            vec4(-1267.95, -342.76, 36.77, 298.73),
                            vec4(-1254.14, -335.44, 37.0, 297.8),
                            vec4(-1241.54, -328.78, 37.25, 297.4)
                        }
                    },
                    jobs = { --list of jobs that can complete deliveries for this vehicle shop
                        cardealer = {0, 1, 2, 3, 4}, --job grades allowed to request work
                        --otherjob = {grades},
                    },
                    pickupLocations = { --locations where vehicles can spawn for delivery job pickup
                        vec4(153.03, 6415.59, 31.5, 72.76), --paleto
                        vec4(-420.5, -2271.75, 7.88, 268.5), --docks
                        vec4(135.45, -3333.69, 6.29, 273.75), --docks
                        vec4(521.29, -2934.13, 6.32, 270.34), --docks
                        vec4(1032.71, -2915.21, 6.17, 89.86), --docks
                    },
                    deliveryLocation = { --location vehicle is delivered to
                        coords = vec3(-1239.59, -333.93, 37.24),
                        radius = 20, --radius from delivery location where vehicle can be delivered
                    },
                    paymentPerMile = { --payment for vehicle delivery based on miles between shop and vehicle pickup location (round trip) (minimum distance is 2 mile round trip for payment calculation)
                        min = 150,
                        max = 200
                    }
                }
            },
        },
        interactionPed = { --NPC used to open finance menu, restock job and toggle duty for player owned locations (will not spawn if finance and player owned options are disabled for this location)
            coords = vector4(-1253.05, -348.05, 36.91, 110.18),
            model = 'u_f_m_debbie_01',
            idleAnimation = { --animation ped plays while not being interacted with
                enable = true,
                dict = 'anim@miss@low@fin@vagos@',
                name = 'idle_ped06'
            },
            toggleDutyAnimation = {
                enable = true,
                dict = 'anim@scripted@player@mission@tunf_bunk_ig3_nas_upload@',
                name = 'normal_typing',
                duration = 5000,
                flags = 1
            },
            speech = {
                onDuty = {
                    enable = true,
                    speechName = 'GENERIC_HOWS_IT_GOING',
                    voiceName = 'a_f_y_business_02_white_full_01',
                    speechParam = 'SPEECH_PARAMS_FORCE_SHOUTED',
                },
                offDuty = {
                    enable = true,
                    speechName = 'GENERIC_BYE',
                    voiceName = 'a_f_y_business_02_white_full_01',
                    speechParam = 'SPEECH_PARAMS_FORCE_SHOUTED',
                }
            }
        },
    },]]--
}