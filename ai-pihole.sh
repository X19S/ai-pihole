#!/bin/bash

echo "
      .;;,.
      .ccccc:,.
       :cccclll:.      ..,,
        :ccccclll.   ;ooodc
         'ccll:;ll .oooodc
           .;cll.;;looo:.
               .. ','.
              .',,,,,,'.
            .',,,,,,,,,,.
          .',,,,,,,,,,,,....
        ....''',,,,,,,'.......
      .........  ....  .........
      ..........      ..........
      ..........      ..........
      .........  ....  .........
        ........,,,,,,,'......
          ....',,,,,,,,,,,,.
             .',,,,,,,,,'.
              .',,,,,,'.
                ..'''."
echo ""
echo "      +---------------------------+"
echo "      | 1. Install Pi-hole        |"
echo "      | 2. Uninstall Pi-hole      |"
echo "      | 3. Pi-hole Administration |"
echo "      | 4. Update Pi-hole         |"
echo "      | 5. Get to our GitHub page |"
echo "      +---------------------------+"
echo "          Visit us @ AutoInst.me"
echo ""
echo ""

read -p "Select your option: " opt1
echo ""

if [ "$opt1" = "1" ]; then

  clear
  echo "Updating system..."

  #Install Updates
  apt -y update && apt -y dist-upgrade
  clear

  echo "Installing Pi-hole..."
  sleep 3

  #Automated script from the devs
  curl -sSL https://install.pi-hole.net | bash
fi

if [ "$opt1" = "2" ]; then

  clear
  echo "Uninstalling Pi-hole..."

  pihole uninstall
fi

if [ "$opt1" = "3" ]; then

  clear
  echo "      +-------------------------------+"
  echo "      | 1. Debugger                   |"
  echo "      | 2. Flush logs                 |"
  echo "      | 3. Tail                       |"
  echo "      | 4. Change password            |"
  echo "      | 5. Chronometer (Perf Monitor) |"
  echo "      | 6. Update blocklist           |"
  echo "      | 7. Stop logging               |"
  echo "      | 8. Start logging              |"
  echo "      | 9. Pi-hole Version            |"
  echo "      | 10. Check service status      |"
  echo "      | 11. Disable for 5 min         |"
  echo "      +-------------------------------+"
  echo ""
  echo ""

  read -p "Select your option: " opt2
  echo ""

  if [ "$opt2" = "1" ]; then
    pihole debug
  fi
  if [ "$opt2" = "2" ]; then
    pihole flush
  fi
  if [ "$opt2" = "3" ]; then
    pihole tail
  fi
  if [ "$opt2" = "4" ]; then
    pihole -a -p
  fi
  if [ "$opt2" = "5" ]; then
    pihole -c
  fi
  if [ "$opt2" = "6" ]; then
    pihole -g
  fi
  if [ "$opt2" = "7" ]; then
    pihole logging off
  fi
  if [ "$opt2" = "8" ]; then
    pihole logging on
  fi
  if [ "$opt2" = "9" ]; then
    pihole -v
  fi
  if [ "$opt2" = "10" ]; then
    pihole status
  fi
  if [ "$opt2" = "11" ]; then
    pihole disable 5m
  fi
fi

if [ "$opt1" = "4" ]; then
  pihole -up
fi

if [ "$opt1" = "5" ]; then
  echo "Here is our GitHub page:"
  echo ""
  echo "https://github.com/X19S/ai-pihole"
  echo ""
fi
