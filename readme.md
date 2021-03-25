# CMines

port of GNUstep demo GMines, using Cappuccino on web or electron

```
cd CMines.app
(yarn or yarn global install electron)
npm start
```

## changes

* use png files instead of drawn images
* or change to CPBezierPath + CoreGraphics

The original GMines encapsulates post-script functions in View.m, which I can not find any documentation for.

This seems to have been done to demonstrate GNUstep post-script functionality rather than to show a typical way of writing a game - most games would use graphic image files such as png. 

# GNUstep - working
![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/gnustep 1.png "start")

![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/gnustep 2.png "end")

# Cappucinno - not so much
![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/cappucinno 1.png "start")

![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/cappucinno 2.png "end")
