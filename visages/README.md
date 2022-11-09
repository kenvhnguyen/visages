#  NSObject 
The standard UserDefaults are stored in a property list document (.plist) in your app bundle.
/AppData/Library/Preferences/<bundle-identifier>.plist
However, if you run your app in simulator it is stored somewhere else.
This article will help you locate the UserDefaults on both the physical device and the simulator so you can open and read it.

* Physical Device
Open your App in Xcode.
Build and run your app on your physical device.
Select Window -> Device and Simulators from the Xcode’s file menu or press the keyboard shortcut: CMD+SHIFT+2.
Select your app in the section Installed Apps.
Tap on the Gear-icon.
Select Download Container… and store it somewhere.
This will download and place an ‘App Data’-document (.xcappdata) on your computer.
Locate the ‘App Data’-document and secondary click (control + click or right mouse click) on the file to open the context menu.
Select Show Package Contents.
Navigate to AppData -> Library -> Preferences.
The property list file (.plist) in this folder is the database file of the standard UserDefaults of your app. Double click to view it in Xcode.

* Simulator
Open your App in Xcode.
Set a breakpoint anywhere in your code, by clicking on any line number.

Build and run your app and make sure the app reaches the place where you set the breakpoint.
Go to the console by clicking on the space next to (lldb).
Or select View -> Debug Area -> Activate Console from the Xcode file menu.
Or press the keyboard shortcut SHIFT+CMD+C.

Execute the following command:
po NSHomeDirectory()
Copy the home directory by copying everything between quotes in the output.

Now open Finder.
Select Go > Go to Folder… in the Finder’s file menu and a new window will open where you can enter the path to a folder.
Paste our copied home directory in the input field.
Click the Go-button.
A quick way to do this is by using CMD+TAB into Finder and then CMD+SHIFT+G to open the ‘Go to folder’-window, pasting the path to the home directory and clicking the Go-button.
A new Finder window willen open showing the home directory of our app in simulator.
Navigate to Library -> Preferences.
The property list file (.plist) in this folder is the database file of the standard UserDefaults of your app. Double click to view it in Xcode.

