
LEDs
----

https://www.amazon.com/LED-Waterproof-Bedroom-RGB-DotStone/dp/B06Y15YVFN/ref=sr_1_2?ie=UTF8&qid=1496580802&sr=8-2-spons&keywords=LED+lights&psc=1
https://www.youtube.com/watch?v=JorBRTODjGU
https://www.youtube.com/watch?v=9KI36GTgwuQ
https://www.youtube.com/watch?v=AsDHEDbyLfg
https://www.youtube.com/channel/UCLecVrux63S6aYiErxdiy4w

Mosquito MQTT
http://mosquitto.org/
https://test.mosquitto.org/

Streaming Radio Station
-----------------------

http://www.caster.fm/
http://www.wikihow.com/Create-an-Internet-Radio-Station
http://rivendellaudio.org/
http://ross.sourceforge.net/
https://www.maketecheasier.com/run-a-diy-internet-radio-station-with-icecast-linux/
https://en.wikipedia.org/wiki/Icecast
https://en.wikipedia.org/wiki/List_of_streaming_media_systems

Toilet
------

http://www.instructables.com/id/How-to-fix-leaking-Water-Ridge-dual-flush-toilet-f/
http://www.sears.com/search=water%20ridge%20toilet
http://terrylove.com/forums/index.php?threads/costco-water-ridge-dual-flush-toilet-review-pictures.15411/

Honeywell Thermostat
--------------------

https://www.linkedin.com/pulse/honeywell-total-connect-comfort-brute-robert-mccurdy

```
while true
do
    echo HVAC   1.0Alpha rmccurdy.com

    # login and get SessionID
    export ID=`curl -s -k -X 'POST' -H 'Content-Type: application/x-www-form-urlencoded' -H 'User-Agent: Apache-HttpClient/UNAVAILABLE (java 1.4)' --data-binary $'ApplicationID=a0c7a795-ff44-4bcd-9a99-420fac57ff04&ApplicationVersion=2&Username=freeload101%40yahoo.com&UiLanguage=English&Password=YOURPASSWORDHERE' 'https://204.141.56.180/TotalConnectComfort/ws/MobileV2.asmx/AuthenticateUserLogin' | grep SessionID  | sed -e 's/.*<SessionID>//g' -e 's/<\/SessionID>.//g'`

    # submit 72F with SessionID 
    curl -s -k \
         -X 'POST' \
         -H 'Content-Type: application/x-www-form-urlencoded' \
         -H 'User-Agent: Apache-HttpClient/UNAVAILABLE (java 1.4)' \
         --data-binary \
         $"ChangeHeatNextPeriod=true&SessionID=$ID&ChangeHeatSetpoint=true&CoolSetpoint=72&CoolNextPeriod=95&ChangeStatusHeat=true&SystemSwitch=3&HeatSetpoint=68&ChangeCoolNextPeriod=true&StatusCool=1&ThermostatID=599354&ChangeCoolSetpoint=true&HeatNextPeriod=95&StatusHeat=1&ChangeStatusCool=true&ChangeSystemSwitch=true" \
         'https://204.141.56.180/TotalConnectComfort/ws/MobileV2.asmx/ChangeThermostatUI'
    sleep 5

    # logout you must logout because it craps out with you many sessions
    curl -s -k \
         -X 'POST' \
        -H 'Content-Type: application/x-www-form-urlencoded' \
        -H 'User-Agent: Apache-HttpClient/UNAVAILABLE (java 1.4)' \
        --data-binary $"SessionID=$ID" \
        'https://204.141.56.180/TotalConnectComfort/ws/MobileV2.asmx/LogOff'

    sleep 60
done
```

http://www.theghostbit.com/2015/06/controlling-honeywell-thermostat.html
http://www.bradgoodman.com/thermostat/therm.py
https://www.bogleheads.org/forum/viewtopic.php?t=166354

Plastic Repair
---------------

 * ThermoMorph - https://www.amazon.com/dp/B00D3LAZ9O?psc=1
 * https://www.youtube.com/results?search_query=thermomorph
 * PlastiMake - https://www.youtube.com/watch?v=nMAd4FpXpy4

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
