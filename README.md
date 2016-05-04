# Tangible-Puzzle
The Tangible Puzzle allows players to play jigsaw puzzle games over distance. It can be used in some specific game settings such as escape rooms.

## Playing Scenario
![Scenario](http://i.imgur.com/UxKoyV6.jpg "Scenario")
A player is playing with the system. She can see the manipulations done both by herself and on the other side on the screen.

![Scenario](http://i.imgur.com/KSUmkq0.png "Scenario")

The player can only manipulate his/her own puzzle pieces. They need to communicate and collaborate together to complete the whole digital pattern.

## Physical Setting
![Scenario](http://i.imgur.com/emXtaHX.png "Scenario")

It requires two tabletops similar to this photo. They can be easily made by paper board and photo frame. You also need two cameras for detecting the fiducial markers on the back of puzzle pieces.
![Scenario](http://i.imgur.com/GDTx7XH.png "Scenario")

## Dependent Software and Tools
Building Tool: [Processing](https://processing.org)
Computer Vision Engine: [reacTIVision](https://github.com/mkalten/reacTIVision)
Mapping between Physical and Digital Objects: [TUIO](http://tuio.org/)
Network & Multicasting [oscP5](http://www.sojamo.de/libraries/oscP5/)

## Guide
Follow the steps (for one side):
1. Locate your reacTIVision configuration file (right click the icon of 'reacTIVision.app', and choose 'Show Package Contents', the configuration file should be 'reacTIVision.app/Contents/Resources/reacTIVision.xml)

2. In order to support globally-scoped Internet address (public address). Please set your reacTIVision.xml to 

  `<tuio host="224.0.0.1" port="7777" />`

  Or, if you just need to play within Intranet set reacTIVision.xml to

  `<tuio host="239.0.0.1" port="7777" />`

3. Know the IP address (make sure you use public ip or intranet ip for both sides. If one is public ip and one is intranet ip, it usually doesnt work! Intranet ip start with 192, 172 or 10 etc.)

4. Edit Tangible-Puzzle/Server/Server.pde file. Change the `server` (224.0.0.1 or 239.0.0.1, depending on your reacTIVision.xml) and `client2Address` ip. You need to change it for both side.  

5. Run reacTIVision.app, Server.pde and Tangible_Puzzle.pde for both side.

