#!/bin/bash

#Pushbullet key zum Versenden von Nachrichten
APIKEY=MyApiKey
# Ueberprüft ob der Ordner schon vorhanden ist oder nicht und erstellt ihn wenn dieser nicht vorhanden ist
declare dir=/var/log/scriptlog/jdstate
declare dir2=~/jdownloader/logs
if [ ! -e $dir ]; then
mkdir $dir; fi
#geht zum jdownloader und dort in den Log Ordner
cd $dir2

# Neuster Ordner im Jdownloader Log Verzeichniss und schreibe es in ein log file
NewFolder=`ls -rt1 ~/jdownloader/logs -I extracting -I updatehistory | tail -1 > /var/log/scriptlog/jdstate/newfolder.log`
AusgabeNewFolder=`cat $dir/newfolder.log`
OutputNewFolder=`head $dir/newfolder.log -n 1`
declare dir3=~/jdownloader/logs/$AusgabeNewFolder2
declare dir4=""\"$dir2/$AusgabeNewFolder2"\""
#cd \"$dir3\"
echo $OutputNewFolder
cd "$dir2/$OutputNewFolder"

# Mit Log.L.log.0 wird geprüft ob Jdownloader aktuell am Herunterladen ist oder nicht
# Wie oft wird das wort gefunden und zaehlt dieses Hoch
StateStop=`grep -o STOPPING--1 Log.L.log.0 | wc -w`
StateRunning=`grep -o RUNNING--1 Log.L.log.0 | wc -w`
# Guckt wie oft es im LogFile steht
LogStateR=`grep -o RUNNING--1 /var/log/scriptlog/jdstate/jdState.log | wc -w`
LogStateS=`grep -o STOPPING--1 /var/log/scriptlog/jdstate/jdState.log | wc -w`

# Guckt ob StateRunning Größer ist und schickt dann eine Pushbullet
# Wenn der Wert gleich groß ist dann soll er eine andere Nachricht schicken
if [ $StateRunning -gt $StateStop ]
then
#Guckt ob der State schon existiert. Ergo ob er schon am runter laden ist
        if [ $LogStateR -eq 1 ]
                then
                # Mache Nix wenn schon am runter laden ist !
                echo "Jdownloader allready runs!"
        else
                # Schicke Pushbullet wenn der Status neu ist und jetzt Runter laedt
                curl -u $APIKEY: https://api.pushbullet.com/v2/pushes -d type=note -d title="JDownloader State" -d body="JD laedt runter !"
                # Schreibe den Status ins LogFile
                echo "RUNNING--1" > /var/log/scriptlog/jdstate/jdState.log
        fi
else
        if [ $LogStateS -eq 1 ]
        then
                # Mache Nix wenn er auch nix macht
                echo "Jdownloader is still in Standby!"
        else
                # Schicke Pushbullet wenn der Status neu ist und jetzt nix mehr macht
                curl -u $APIKEY: https://api.pushbullet.com/v2/pushes -d type=note -d title="JDownloader State" -d body="JD schlaeft jetzt !"
                # Schreibe den Status ins LogFile
                echo "STOPPING--1" > /var/log/scriptlog/jdstate/jdState.log
        fi
fi
