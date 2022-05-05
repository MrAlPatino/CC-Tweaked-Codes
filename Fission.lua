local reactor = peripheral.wrap("fissionReactorLogicAdapter_1") --Replace with LogicAdpacter ID 
local monitor = peripheral.wrap("top")  --Replace with Monitor position or id like "top" "bottom" "monitor_1" "monitor_10"

monitor.clear()

while true do 
monitor.setCursorPos(1,1)
monitor.write("Core Temp in K: "..reactor.getTemperature())
monitor.setCursorPos(1,2)
monitor.write("so far no meltdon")
monitor.setCursorPos(1,3)
monitor.write("reactor damage: "..reactor.getDamagePercent())
if reactor.getTemperature() > 1200 then --set Temperature limit in kelvin
reactor.setBurnRate(0)
monitor.setCursorPos(1,4)
monitor.write("EMERGENCY OVERHEAT")
end
if reactor.getDamagePercent() > 10 then --set Damage warning and auto shutdown
monitor.setCursorPos(1,5)
monitor.write("WARNING: Core damage at: "..reactor.getDamagePercent().."% please do not operate")
reactor.setBurnRate(0)
end
sleep(0.2)
monitor.clear()
sleep(0.1)
end
