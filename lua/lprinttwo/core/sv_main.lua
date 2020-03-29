// Console printing
local function PrintToConsole(message)

  // The reason for these checks is because the Serverside console and Clientside console print colors diffrently, at least in my experience.

  local PrefixColor = Color(200, 0, 255)

  if SERVER then

    PrefixColor = Color(200, 150, 255)

  end

  MsgC(Color(255, 255, 255), "[")
  MsgC(PrefixColor, "Livaco's Printers 2")
  MsgC(Color(255, 255, 255), "] " .. message)
  MsgC(Color(255, 255, 255), "\n")

end

// Version Check
local RanCheck = false

hook.Add("PlayerConnect", "lprinttwo_checkversion", function()

  if(RanCheck == true) then return end

  PrintToConsole("Running version check!")

  // Post request.
  http.Post("https://livacoweb.000webhostapp.com/libaries/versions/lprinttwo.php", {RunningVar = "1.1"}, function(result)

    PrintToConsole(result)

  end, function(fail)

    PrintToConsole("Error: " .. fail)
    PrintToConsole("This is most likely due to my website being down. Try again later.")

  end)

  RanCheck = true

end)