local reactor = peripheral.wrap("fissionReactorLogicAdapter_1")
local monitor = peripheral.wrap("top") 
local MaxTemp = 800  --this is the default temperature cuttoff 
local MaxDam = 10 --this is the default max damage before reactor shutdown  

--reactor = your reactor port like fissionReactorLogicAdapter_0 
--monitor = your monitor positon like, top, bottom, left, right
--min size 3 tall and 4 wide
function touch()

while true do 
local e,s,Xt,Yt = os.pullEvent("monitor_touch")
print(Xt,Yt)



if Xt <= 3 and Yt == 1 and reactor.getStatus() == true then

reactor.scram()

end

if Xt >= 16 and Yt == 1 and reactor.getStatus() == false then

reactor.activate()

end

--burn rate controls  



if Xt <= 5 and Yt == 12 and reactor.getActualBurnRate ~= 0 then

reactor.setBurnRate(math.floor(reactor.getActualBurnRate())-1)

end

if Xt >= 11 and Yt == 12 then

reactor.setBurnRate(math.floor(reactor.getActualBurnRate())+1) 

end


if Xt <= 5 and Yt == 13 and reactor.getActualBurnRate ~= 0 then

reactor.setBurnRate(reactor.getActualBurnRate()-0.1)
end

if Xt >= 17 and Yt == 13 then

reactor.setBurnRate(reactor.getActualBurnRate()+0.1) 

end


--temp controls



if Xt <= 8 and Yt == 15 and MaxTemp ~= 0 then

MaxTemp = MaxTemp - 10

end

if Xt >= 5 and Yt == 16 then

MaxTemp = MaxTemp + 1

end


if Xt <= 4 and Yt == 16 and MaxTemp ~= 0 then
MaxTemp = MaxTemp - 1

end

if Xt >= 5 and Yt == 15 then
MaxTemp = MaxTemp + 10


end



sleep(0.1)
end
end

function main()
while true do 
local temp = reactor.getTemperature()/100
local rawtemp = math.floor(reactor.getTemperature())
local Xsize Ysize = monitor.getSize()

monitor.setBackgroundColor(colors.black)
monitor.clear()


--Damage bar NOTE: removed the arrows to allow more stuff to be added, this will soon be modified


monitor.setTextScale(1)
monitor.setCursorPos(2,3)
monitor.write("v")
monitor.setCursorPos(6,3)
monitor.write("v")
monitor.setCursorPos(10,3)
monitor.write("v")
monitor.setCursorPos(14,3)
monitor.write("v")
monitor.setCursorPos(18,3)
monitor.write("v")
monitor.setCursorPos(22,3)
monitor.write("v")


monitor.setTextScale(1)
monitor.setCursorPos(1,2)
monitor.write("00%")
monitor.setCursorPos(5,2)
monitor.write("10%")
monitor.setCursorPos(9,2)
monitor.write("20%")
monitor.setCursorPos(13,2)
monitor.write("30%")
monitor.setCursorPos(17,2)
monitor.write("40%")
monitor.setCursorPos(21,2)
monitor.write("50%")
monitor.setCursorPos(25,2)
monitor.write("60%")
monitor.setCursorPos(29,2)
monitor.write("Core Damage")

--damage slidder

monitor.setTextScale(1)
monitor.setCursorPos(reactor.getDamagePercent(),4)
monitor.setBackgroundColor(colors.red)
monitor.write(" ")

if reactor.getDamagePercent() == 0 then 

monitor.setCursorPos(1,4)
monitor.setBackgroundColor(colors.green)
monitor.write(" ")

end


monitor.setBackgroundColor(colors.black)




--Heat bar NOTE: removed the arrows to allow more stuff to be added, this will soon be modified

monitor.setTextScale(1)
monitor.setCursorPos(2,6)
monitor.write("^")
monitor.setCursorPos(6,6)
monitor.write("^")
monitor.setCursorPos(10,6)
monitor.write("^")
monitor.setCursorPos(14,6)
monitor.write("^")
monitor.setCursorPos(18,6)
monitor.write("^")
monitor.setCursorPos(22,6)
monitor.write("^")
monitor.setCursorPos(26,6)
monitor.write("^")
monitor.setCursorPos(30,6)
monitor.write("^")
monitor.setCursorPos(34,6)
monitor.write("^")
monitor.setTextScale(1)
monitor.setCursorPos(1,7)
monitor.write("100")
monitor.setCursorPos(5,7)
monitor.write("200")
monitor.setCursorPos(9,7)
monitor.write("300")
monitor.setCursorPos(13,7)
monitor.setBackgroundColor(colors.green)
monitor.write("400")
monitor.setCursorPos(17,7)
monitor.write("500")
monitor.setBackgroundColor(colors.yellow)
monitor.setCursorPos(21,7)
monitor.write("600")
monitor.setCursorPos(25,7)
monitor.write("700")
monitor.setBackgroundColor(colors.red)
monitor.setCursorPos(29,7)
monitor.write("800")
monitor.setCursorPos(33,7)
monitor.write("900")



monitor.setBackgroundColor(colors.black)


monitor.setCursorPos(37,7)
monitor.write("K")
monitor.setTextScale(1)



monitor.setCursorPos(1,8)
monitor.write("Reactor Core K: "..rawtemp)
monitor.setCursorPos(1,9)
monitor.write("Burn Rate MB: "..reactor.getActualBurnRate())
monitor.setCursorPos(1,10)
if reactor.getStatus() == true then
monitor.write("Reactor is on")
else 
monitor.write("Reactor is off")
end



monitor.setTextScale(1)
monitor.setBackgroundColor(colors.red)
monitor.setCursorPos(1,1)
monitor.write("SHUTDOWN")

monitor.setBackgroundColor(colors.green)
monitor.setCursorPos(16,1)
monitor.write("ACTIVATE")

--burn rate controls
--monitor.setTextScale(2)
monitor.setBackgroundColor(colors.green)
monitor.setCursorPos(1,11)
monitor.write("Burn Rate Control:  ")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(1,12)
monitor.write("-1mb burn rate")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(1,13)
monitor.write("-0.1mb burn rate")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(17,13)
monitor.write(" +0.1mb burn rate")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(15,12)
monitor.write("   +1mb burn rate  ")
--temp control
monitor.setBackgroundColor(colors.red)
monitor.setCursorPos(1,14)
monitor.write("Temp Control: Max: "..MaxTemp)
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(1,15)
monitor.write("-10 ")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(1,16)
monitor.write("-1  ")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(5,16)
monitor.write("+1 ")
monitor.setBackgroundColor(colors.blue)
monitor.setCursorPos(5,15)
monitor.write("+10")


--heat slidder
monitor.setTextScale(1)
monitor.setCursorPos(temp*3.5,5)
monitor.setBackgroundColor(1)
monitor.write(" ")

if rawtemp >= MaxTemp and reactor.getStatus() == true then

reactor.scram()
reactor.setBurnRate(0)

end

if reactor.getDamagePercent() >= MaxDam and reactor.getStatus() == true then

reactor.scram()
reactor.setBurnRate(0)

end

sleep(0.1)
end


end

parallel.waitForAny(main,touch)

