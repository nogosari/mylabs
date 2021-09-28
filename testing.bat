:local targetIp "1.1.1.1"
:local targetAlias "AP 1"
:local pingCount "5"
:local varHostname ([/system identity get name])
:local varTime ([/system clock get time])
:local varDate ([/system clock get date])

:if ([/ping $targetIp interval=1 count=$pingCount] = 0) do={
    :log warning "HOST $targetAlias down (Ping Failure)"
    /tool fetch url="https://api.telegram.org/bot1991008596:AAGj0Uslh6vqwZxh1KeYVJLUYR7YRRrOyL8/sendMessage?chat_id=-585627461&text=[$varHostname] - $targetAlias is Down" keep-result=no 
} else {
    :log warning "HOST $targetAlias ping is ok, no need to take any action ...";
    /tool fetch url="https://api.telegram.org/bot1991008596:AAGj0Uslh6vqwZxh1KeYVJLUYR7YRRrOyL8/sendMessage?chat_id=-585627461&text=$varHostname - $targetAlias is Up" keep-result=no
}