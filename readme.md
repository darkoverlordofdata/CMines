# CMines

port of GNUstep demo GMines, using Cappuccino on web or electron

```
cd CMines.app
(yarn or yarn global install electron)
npm start
```


## proposed changes

* use png files instead of drawn images
* or change to CPBezierPath + CoreGraphics

The original GMines encapsulates post-script functions in View.m, which I can not find any documentation for.

This seems to have been done to demonstrate GNUstep post-script functionality rather than to show a typical way of writing a game - most games would use graphic image files such as png. 


# GNUstep - working
## source from http://gap.nongnu.org/gmines/index.html

![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/gnustep1.png)

![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/gnustep2.png)

# Cappucinno - not so much
## port
![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/cappuccino1.png)

![Screenshot](https://github.com/darkoverlordofdata/CMines/raw/master/Screenshots/cappuccino2.png)
