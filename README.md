<img align="left" width="100" height="100" src="https://raw.githubusercontent.com/tomkidd/VVVVVV-iOS/master/icon_vvvvvv.png">  

#  VVVVVV for iOS and tvOS for Apple TV

&nbsp;

This is my port of VVVVVV for iOS. I have also made a target and version for tvOS to run on Apple TV. **This version is based off of the C++ source code rather than the Flash source code**. 

![screenshot](https://raw.githubusercontent.com/tomkidd/VVVVVV-iOS/master/ss_vvvvvv.png)

Features

- Tested and builds on Xcode 11.
- Runs single player campaign at full screen and full speed on iOS
- MFi controller support (reccomended) and on-screen control options
- Second project target for tvOS that takes advantage of focus model and removes on-screen controls.
- Supports native menus of original game.

As of this writing, VVVVVV is [still available for purchase on the App Store](https://apps.apple.com/us/app/vvvvvv/id880645949) and so if you want to play the game on your iPhone right now this is the quickest way to do so. It is also considerably more tested than this version.

The version of VVVVVV on the App Store is based off of the original source code which was written in Flash, which is available [here](https://github.com/TerryCavanagh/VVVVVV/tree/master/mobile_version). The desktop version was converted to use C++ and SDL in 2011, the source for that version is available [here](https://github.com/TerryCavanagh/VVVVVV/tree/master/desktop_version). The version I have posted in this repo is for iOS but it is based off of the C++ version just to see how hard it would be to do. This repo also contains a port to the Apple TV which did not exist previously. 

You will need to provide your own copies of the `data.zip` file from an existing instalation of VVVVVV ([Steam](https://store.steampowered.com/app/70300/VVVVVV/), [GOG](https://www.gog.com/game/vvvvvv), [Humble](https://www.humblebundle.com/store/vvvvvv)) or you can acquire it from Terry Cavanagh's site [here](https://thelettervsixtim.es/makeandplay/) as part of the "Make and Play" version of the game. In accordance with his wishes I am not including it here. In the Xcode project modify the file reference to "data.zip" to point to wherever your data.zip file is.

![folders](https://raw.githubusercontent.com/tomkidd/VVVVVV-iOS/master/folders_vvvvvv.png)

Article is forthcoming.

<!--You can read a lengthy blog article on how I did all this [here](http://schnapple.com/doom-3-for-ios-and-tvos-for-apple-tv/).-->

This port was based on the [source code to VVVVVV](https://github.com/TerryCavanagh/VVVVVV) released as open source by Terry Cavanaugh and uses [SDL for iOS](https://www.libsdl.org/). On-screen joystick code came from [this repo](https://github.com/bradhowes/Joystick) by Brad Howe. I also studied the iOS port of [Hedgewars](https://github.com/hedgewars/hw) for information on how to use UIKit alongside SDL.

<!--[Video of DOOM 3 running on an iPhone X](https://www.youtube.com/watch?v=KEaeWKSfgB8)-->

<!--[Video of DOOM 3 running on an Apple TV](https://www.youtube.com/watch?v=jjO2pAVgb84)-->

I have also made iOS and tvOS ports for various other games which can be found [at my main GitHub repo](https://github.com/tomkidd/). As a stepping stone to this iOS version I also made an Xcode project for macOS which can be found [here](https://github.com/tomkidd/VVVVVV-macOS). It's identical to the main code except it bundles the data in to the .app file and gives it an icon. I've provided it if anyone's curious but if you want to get into contributing to the VVVVV source you should reference the [original repo](https://github.com/TerryCavanagh/VVVVVV/) instead.

Have fun. For any questions I can be reached at tomkidd@gmail.com
