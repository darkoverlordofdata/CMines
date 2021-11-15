## notes:

### gaps in the api

* the main item is the lack of PS* (postscript) functions such as PSmoveto. CPBezier path can replace some, but not all functionality. 
* CPText field methid setBackgroundColor is not working
* various default positioning is not the same

originally I thought this is due to intentional changes to the GNUstep api, but after searching the project issues and reviewing the code, I realize that it is merely full of bugs, and differences are more due to workarounds for this. This is more like a pre-beta than a 1.0 release - that's dissapointing. 

### additional setup:

ln -s /home/darko/cappuccino/dist/cappuccino/Frameworks ./Frameworks