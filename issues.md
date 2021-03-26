# Issues

Porting GNUstep to Cappuccino does not go well. Much difference between the 2 frameworks. Other than that, Objective-J is just fine. But the framework needs documentation. My feeling is that it has changed to follow the Mac version of the framework, effectively creating vendor lock with Apple. Hardly a way to make cross-platform open source.


## CPTextField's are not displaying. 
I tried moving CPTextField to a separate view just to test it, and I find that the setBackgroundColr message does nothing, even after setting DrawsBackground to YES. 

## pswrap functionality does not exist. 
I’ve substituted CPBezierPath, but it is missing some constructs: PStranslate, PSrotate, PSgsave, PSgrestore, PSshow are all missing. It looks like I may be able to use core-graphics context, but PSshow still has no equivalent, and that is critical for this game. 

## selector not found
occurs in many places. In some case there is a similar function that seems to work.
In some cases, just commenting out the code seems to work.
But does it really work? It doesn't run correctly.

example, at the end of 'applicationDidFinishLaunching'

    [window center];
    // [window orderFront]; //Regardless];
    [window makeKeyWindow];
    // [window display];


