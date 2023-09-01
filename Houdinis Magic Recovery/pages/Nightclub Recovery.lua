local HC_Recovery = Submenu.add_static_submenu("Recovery", "BS_HC_Recovery")
HC_Main:add_sub_option("Nightclub Recovery", "BS_HC_Recovery", HC_Recovery)

	HC_Recovery:add_click_option("Infos", "BS_HC_Recovery_Nightclub_Info", function()
		notify.important("Nightclub recovery", "Dont change any values inside the LUA itself\nDo not go above 400mil per Account\nDo not go above 40-60mil per IRL Day\nUse at your own Risk!\nEnjoy")
	end)

	HC_Recovery:add_click_option("Go to Safe", "BS_HC_Recovery_Nightclub_GoToSafe", function()
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), -1615.6942138672, -3015.7473144531, -75.205017089844)
		if not coords then return end
		features.teleport(coords)
	end)

	HC_Recovery:add_bool_option("Nightclub safe loop", "BS_HC_Recovery_Nightclub_Enable", function(state)
		if state then
			notify.warning("Nightclub recovery", "Chance of getting Banned\nUse at own Risk!")
			task.createTask("BS_HC_Recovery_Nightclub_Enable", 5.0, nil, function ()
				script_global:new(262145):at(24227):set_int64(300000) -- Dont change these Values, can cause the Safe to bug out!
				script_global:new(262145):at(24223):set_int64(300000) -- Dont change these Values, can cause the Safe to bug out!
				STATS.STAT_SET_INT(string.joaat(scripts.globals.getCharIdStr() .. "CLUB_POPULARITY"), 10000, true)
				STATS.STAT_SET_INT(string.joaat(scripts.globals.getCharIdStr() .. "CLUB_PAY_TIME_LEFT"), -1, true)
				STATS.STAT_SET_INT(string.joaat(scripts.globals.getCharIdStr() .. "CLUB_POPULARITY"), 10000, true)
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), -1618.348, -3012.625, -75.205)
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), -1615.6942138672, -3015.7473144531, -75.205017089844)
			end)
		elseif task.exists("BS_HC_Recovery_Nightclub_Enable") then
			task.removeTask("BS_HC_Recovery_Nightclub_Enable")
		end
	end)

	HC_Recovery:add_click_option("Clear Nightclub Income", "BS_HC_Recovery_Nightclub_ClearIncome", function() 
		STATS.STAT_SET_INT(string.joaat(scripts.globals.getCharIdStr() .. "MONEY_EARN_CLUB_INCOME"), 0, true) 
		STATS.STAT_SET_INT(string.joaat(scripts.globals.getCharIdStr() .. "NIGHTCLUB_EARNINGS"), 0, true) 
		STATS.STAT_SET_INT(string.joaat(scripts.globals.getCharIdStr() .. "HUB_EARNINGS"), 0, true)
		notify.important("Nightclub recovery", "Successfully cleared Nightclub Income!")
	end)

	
		
			