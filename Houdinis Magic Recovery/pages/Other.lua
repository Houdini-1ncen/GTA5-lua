local HC_Recovery = Submenu.add_static_submenu("Recovery", "BS_HC_Recovery")
HC_Main:add_sub_option("Other", "BS_HC_Recovery", HC_Recovery)

    HC_Recovery:add_click_option("Coming Soon", "BS_HC_recovery_Coming_Soon", function ()
        notify.warning("Coming Soon", "Coming Soon!")
    end)

