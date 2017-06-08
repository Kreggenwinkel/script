# Info Sheet for my scripts

Some of my script for Testing doing stuff and so on 

The Scripts are running on an Unix System (Testet on Ubuntu 14.04/ Ubuntu 16.04 / Debian 7 / Debian 8 / Raspian)
The Commends in the Scripts are still in German and needs to replaced in English.

1. LocalOverwatch

This Script Sends an Pushbullet to Your Configured Device. 
The Message will output the Local Logged In Users In Your Subnet.
Its Designed to run as an Cron, because it will Check The Last Logged in Users against the Current User and will show you the Diffs.
Will Create an Log_Folder and Log_Files.

You Need:
- nmap
- Pushbullet Account and an API- Key


2. send_public_ip

This will just send you an Pushbullet to Your Configured Device.
The Message will output the your Public IP.
Needs to setup in a Cron.
Will Create an Log_Folder and Log_Files.

You Need:
- Curl
- Pushbullet Account and an API- Key


3. jdueberwachung

This will check Your JDownloader State of Your machine.
It Will send an Pushbullet if the JDownloader is running/downloading or is sleeping/ doing nothing.
Needs to setup in a Cron to work fine.
Will Create an Log_Folder and Log_Files.

You Need:
- Pushbullet Account and an API- Key
