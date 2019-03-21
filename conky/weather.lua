-- Gibt das Wetter aus
output = "Kein Wetter"
lasttime = os.time()
function conky_weather()
  currenttime = os.time()
  timedifference = os.difftime(currenttime, lasttime)
  if timedifference > 60 then
    local file = io.popen("curl -s \"http://wttr.in/Stuttgart?0?T\"")
    output = file:read("*a")
    file:close()
  end
  return output
end
