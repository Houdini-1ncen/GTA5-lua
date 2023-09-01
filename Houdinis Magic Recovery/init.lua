task.executeAsScript("HC_Versioncheck", function()
    if native.is_invoker_ready() then
        if NETWORK._GET_ONLINE_VERSION() ~= hc.support_ver then
            log.error("Houdinis Magic Recovery [ " .. hc.ver .. " ]", "\n\tYou are using an outdated version!\n\tSupported Game Version: ".. hc.support_ver .. ", Game Version: " .. NETWORK._GET_ONLINE_VERSION())
            utils.stop_script()
        end

        if task.exists("HC_Versioncheck") then task.removeTask("HC_Versioncheck") end
    end
end)  
  
HC_Main = Submenu.add_static_submenu("Houdinis Magic Recovery", "BS_HC_Submenu")
HOME_SUBMENU:add_sub_option("Houdinis Magic Recovery", "BS_HC_Suboption", HC_Main)

require("BoolyScript/util/DrawUI")
    hc = require("BoolyScript/pages/Houdinis Magic Recovery/include")
    require("BoolyScript/pages/Houdinis Magic Recovery/pages/Nightclub Recovery")
    require("BoolyScript/pages/Houdinis Magic Recovery/pages/Other")

notify.success("Houdinis Magic Recovery [" .. hc.ver .. " ]", "Has been successfully loaded :)")

