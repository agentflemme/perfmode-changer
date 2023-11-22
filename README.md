# perfmode-changer

A little script that helps changing power plans on Android

Run the script by pasting this command on Termux :
```wget https://raw.githubusercontent.com/agentflemme/perfmode-changer/main/perfmodechanger.sh```
```sudo bash perfmodechanger.sh```

Arguments
You can use arguments to change modes faster

Interactive mode ( -i )
Lists all the availables power profiles and makes you choose one

Manual mode ( 0,1,2 )
Changes directly to the power profile asked

0 = battery
1 = nolimits (performance, thermals disabled)
2 = mgame (performance)