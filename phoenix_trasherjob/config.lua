Config = {}

Config.UseNewESX = true -- New ESX has a new Export. Enable if you need this

Config.UseLegacyFuel = false -- true if you use Legacyfuel

Config.Locale = 'en'

Config.Bail = 2500 -- Amount of Bail a Player has to Pay for the Vehicle. When hes bringing it back, he gets the Money back, if nothing do 0

Config.Webhook = '' --Your Webhook Link

Config.UseMiniGame = false -- Only for Using K5_Skillcheck https://github.com/kac5a/k5_skillcheck

Config.UseAnProgbar = false --Only for Using An_Progbar https://github.com/aymannajim/an_progBar

Config.Moneytype = 'money' -- 'bank', 'black_money'

Config.Reward = 300  -- Reward for each Trashcan.

Config.Bonus = 1000 -- Bonus for each 10th Trashcan

Config.VisibleforOtherPlayer = true -- If the Trashcan is Visible for other Players

Config.MSG = function(msg)
    ESX.ShowNotification(msg) 
    --exports['okokNotify']:Alert("Trasher Job", msg, 3000, 'info') 
    --If you use okokNotify, uncomment this or use your own Notify Script
end

Config.StartMission = {
    {
    startcoords = vector3(499.9894, -651.9183, 24.9093),
    pedname = 's_m_y_airworker',
    pedheading = 270.8186,
    vehiclespawnname = 'trash2',
    vehiclespawncoords = vector3(510.3752, -654.7561, 24.7512),
    vehiclespawnheading = 179.6859,
    }
}

Config.SpawnProps ={
    {x = 475.5041,  y = -670.2628,  z = 26.5331, h = 3.4894},
    {x = 141.3320,  y = -1027.8635, z = 29.3513, h = 163.0735},
    {x = 64.3686,   y = -1000.1199, z = 29.3574, h = 176.7247}, 
    {x = 180.6876,  y =  -1040.9425,z = 29.3079, h = 164.1857},
    {x = 196.4586,  y = -1096.8436, z = 29.2941, h = 85.8390},
    {x = 199.4161,  y = -1186.1459, z = 29.3193, h = 96.4643},
    {x = 207.9233,  y = -1242.9977, z = 29.3187, h = 92.9186},
    {x = 236.1090,  y = -1272.4854, z = 29.2668, h= 264.3872},
    {x = 235.3850,  y = -1203.2180, z = 29.3613, h= 284.3658},
    {x = 225.9029,  y = -1094.8710, z = 29.2959, h= 270.1631},
    {x = 253.7923,  y = -994.4833,  z = 29.2649, h = 251.2704},
    {x = 283.2362,  y = -912.9605,  z = 28.9950, h = 267.8209},
    {x = 259.0956,  y = -834.1644,  z = 29.5405, h = 339.6722},
    {x = 203.8092,  y = -774.9088,  z = 32.2717, h = 251.9818},
    {x = 109.7364,  y = -947.0361,  z = 29.6282, h = 67.6934},
    {x = 74.7820,   y = -972.7283,  z = 29.3577, h = 341.5839},
    {x = 3.2568,    y = -946.8578,  z = 29.3576, h = 342.8749},
    {x = 133.8557,  y = -967.0474,  z = 29.5356, h = 252.1046},
    {x = 138.8061,  y = -1367.0753, z = 29.3026, h = 333.7043},
    {x = 126.8776,  y = -1323.1719, z = 29.2377, h = 212.3943},
    {x = 79.6624,   y = -1200.9001, z = 29.2846, h = 270.7774}, 
    {x = 29.2875,   y = -1301.0388, z = 29.2221, h = 4.6868},
    {x = 79.4077,   y = -1102.6627, z = 29.3065, h = 250.1998},
    {x = 150.9825,  y = -1085.5032, z = 29.1942, h = 183.4256},
    {x = 159.1338,  y = -1008.5742, z = 29.5585, h = 344.6902},
    {x = 224.7981,  y = -856.5838,  z = 30.1266, h = 162.4310},
    {x = 295.1959,  y = -881.0540,  z = 29.2098, h = 252.5723},
    {x = 340.7103,  y = -869.3583,  z = 29.2907, h = 182.3136},
    {x = 388.4954,  y = -869.0103,  z = 29.2917, h = 181.4513},
    {x = 389.3043,  y = -907.8170,  z = 29.4108, h = 176.7281},
    {x = 397.4715,  y = -925.1342,  z = 29.4187, h = 85.3651},
    {x = 411.2105,  y = -906.4905,  z = 29.4187, h = 270.7979},
    {x = 392.9344,  y = -989.8352,  z = 29.4181, h = 86.9190},
    {x = 319.0802,  y = -1034.7701, z = 29.2210, h = 356.8058},
    {x = 274.7674,  y = -1035.0782, z = 29.2081, h = 1.2735},
    {x = 264.4851,  y = -1064.3960, z = 29.4186, h = 181.7215},
    {x = 324.5908,  y = -1064.4202, z = 29.4369, h = 179.4372},
    {x = 391.8871,  y = -1085.3070, z = 29.4216, h = 88.6291},
    {x = 371.5064,  y = -1125.4972, z = 29.4065, h = 1.4280},
    {x = 263.6351,  y = -1120.0977, z = 29.3656, h = 358.7808},
    {x = 228.7551,  y = -1147.4351, z = 29.3036, h = 278.7664},
    {x = 301.4845,  y = -1205.6896, z = 29.3679, h = 265.9781},
    {x = 290.8227,  y = -1251.1184, z = 29.4220, h = 181.1820},
    {x = 133.5831,  y = -1122.7675, z = 29.3061, h = 6.0275},
    {x = 37.3052,   y = -1038.4550, z = 29.4643, h = 338.2645},
    {x = -66.1231,  y = -1081.3080, z = 26.9615, h = 260.9160},
    {x = -8.6212,   y = -1087.7323, z = 26.6955, h = 249.9065}, 
    {x = -45.8060,  y = -1028.3158, z = 28.5534, h = 245.9735},
    {x = -34.4345,  y = -996.2932,  z = 29.1205, h = 248.2568},
    {x = 55.6280,   y = -792.5734,  z = 31.5955, h = 160.6566},
    {x = 76.8087,   y = -799.1368,  z = 31.5802, h = 158.7955},
    {x = 102.7218,  y = -808.3702,  z = 31.4191, h = 160.3637},
    {x = 131.4403,  y = -787.1794,  z = 31.2966, h = 336.1524},
    {x = 215.5849,  y = -818.3110,  z = 30.6371, h = 342.9619},
    {x = 317.8807,  y = -817.1687,  z = 29.2772, h = 249.5879},
    {x = 333.5982,  y = -771.4371,  z = 29.2769, h = 252.9979},
    {x = 351.1658,  y = -718.4304,  z = 29.2759, h = 251.2580},
    {x = 328.5123,  y = -695.6565,  z = 29.3097, h = 72.6609},
    {x = 306.6965,  y = -757.0514,  z = 29.3100, h = 70.8890},
    {x = 286.7085,  y = -818.1135,  z = 29.3099, h = 68.3277},
    {x = 334.2407,  y = -951.7277,  z = 29.6030, h = 12.0549},
    {x = 344.2732,  y = -959.7680,  z = 29.4319, h = 181.2829},
    {x = 72.4137,   y = -870.5861,  z = 30.5299, h = 261.7058},
    {x = 48.2880,   y = -906.8010,  z = 29.9513, h = 61.5799},
    {x = 23.5499,   y = -823.0858,  z = 30.9971, h = 236.1618},
    {x = -2.1233,   y = -840.2816,  z = 30.4514, h = 68.1490},
    {x = 366.6276,  y = -798.4854,  z = 29.2886, h = 269.2122},
    {x = 399.2769,  y = -743.2401,  z = 29.2855, h = 92.2074},
    {x = 216.8035,  y = -1009.5715, z = 29.2544, h = 69.9031},
}

Translation = {
    ['de'] = {
        ['start_mission_text'] = 'Drücke ~g~[E]~s~ um den Job zu starten',
        ['cancel_mission_text'] = 'Drücke ~r~[G]~s~ um den Job zu beenden',
        ['already_startet_mission'] = 'Du hast bereits den Job gestartet',
        ['canceled_mission'] = 'Du hast den Job beendet',
        ['prop_blip_name'] = 'Müll',
        ['sucessfully_removed_prop'] = 'Du hast den Müll genommen',
        ['sucessfully_started_mission'] = 'Du hast den Job erfolgreich gestartet. Fahr nun mit deinem Müllfahrzeug',
        ['step1'] = 'Bringe die Mülltonne jetzt zu dem Müllwagen',
        ['cant_do_in_vehicle'] = 'Du kannst dies nicht in einem Fahrzeug tun',
        ['reward'] = 'Du hast ~g~'..Config.Reward..'$~s~ erhalten',
        ['reward_title'] = 'Belohnung',
        ['bring_can_back'] = 'Bringe die leere Mülltonne wieder zurück',
        ['Bonus'] = 'Du hast einen Bonus in Höhe von '..Config.Bonus..'$ erhalten',
        ['press_e_to_take_trash'] = 'Drücke ~g~[E]~s~ um die Mülltonne zu nehmen',
        ['press_to_bring_trash_back'] = 'Drücke ~g~[E]~s~ um die Mülltonne zurückzustellen',
        ['press_to_take_trunk'] = 'Drücke ~g~[E]~s~ um die Mülltonne zu entleeren',
        ['trash_empty'] = 'Die Mülltonne wird entleert...',
        ['took_bail'] = 'Ich habe dir eine Kaution in Höhe von ~r~'..Config.Bail..'$~s~ berechnet. Also bring das Fahrzeug wieder!',
        ['back_bail'] = 'Du hast deine Kaution wieder zurück erhalten [~g~'..Config.Bail..'$~w~]',
        ['trasher_not_nearby'] = 'Der Müllwagen ist nicht in der Nähe, weshalb du keine Kaution zurück erhälst!'
    },

    ['en'] = {
        ['start_mission_text'] = 'Press ~g~[E]~s~ to start the Job',
        ['cancel_mission_text'] = 'Press ~r~[G]~s~ to end the Job',
        ['already_startet_mission'] = 'You already started the Job',
        ['canceled_mission'] = 'You canceled the Job',
        ['prop_blip_name'] = 'Trash',
        ['sucessfully_removed_prop'] = 'You took the Trash',
        ['sucessfully_started_mission'] = 'You took your Trashcar. Now go and do your Job',
        ['step1'] = 'Now bring the Trashcan to the Car',
        ['cant_do_in_vehicle'] = 'You cant do this in a Vehicle',
        ['reward'] = 'You earned~g~ '..Config.Reward..'$',
        ['reward_title'] = 'Reward',
        ['bring_can_back'] = 'Bring the empty Trashcan back',
        ['Bonus'] = 'You received a Bonus',
        ['press_e_to_take_trash'] = 'Press ~g~[E]~s~ to take the Trashcan',
        ['press_to_bring_trash_back'] = 'Press ~g~[E]~s~ to take the Trashcan back',
        ['press_to_take_trunk'] = 'Press ~g~[E]~s~ to empty the Trashcan',
        ['trash_empty'] = 'Trashcan will be emptied...',
        ['took_bail'] = 'I took ~r~'..Config.Bail..'$~s~ for the Trashcar, so bring it back to me later!',
        ['back_bail'] = 'You got the Cash back from the Trasher [~g~'..Config.Bail..'$~w~]',
        ['trasher_not_nearby'] = 'You dont brought the Trasher back. You dont get any Money back!'


    }

}