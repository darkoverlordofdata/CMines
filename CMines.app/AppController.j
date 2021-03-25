@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "SquareView.j"

var DIMENSION    = 24;
var SEPARATOR    = 10;
var MARGIN        = 6;

@implementation AppController : CPObject
{
    CPWindow window;
    CPTextField timeField;
    CPTextField markField;
    SquareView fields;//[8][8];

    int uncovered;

    BOOL atStart;
    CPDate startDate;
}

- (void)applicationDidFinishLaunching:(CPNotification )aNotification
{

    var inv = [CPInvocation 
              invocationWithMethodSignature: 
                  [self methodSignatureForSelector: 
                            @selector(tick)]];
    [inv setSelector:@selector(tick)];
    [inv setTarget:self];
    [inv retain];

    [CPTimer scheduledTimerWithTimeInterval:1.0
             invocation:inv
             repeats:YES];

    window = nil;

    [self makeGameWindow];
    [self newGame:nil];

}

- makeGameWindow
{
    var m = CPTitledWindowMask;

    var view  = [[CPView alloc] 
                initWithFrame:
                    CPMakeRect(0, 0, DIMENSION*8, DIMENSION*8)];

    fields = [Array(8), Array(8), Array(8), Array(8), 
              Array(8), Array(8), Array(8), Array(8)];

    for (var row=0; row<8; row++){
        for (var col=0; col<8; col++){
            var spoint = CPMakePoint(row*DIMENSION, col*DIMENSION);
            var field = [[SquareView alloc] initAtPoint:spoint
                    row:row col:col controller:self];
            [view addSubview:field];
            fields[row][col] = field;
        }
    }

    markField =
        [[CPTextField alloc]
            initWithFrame:
                CPMakeRect(0, DIMENSION*8+SEPARATOR,
                           3*DIMENSION, DIMENSION)];
    [markField setEditable:NO];
    [markField setSelectable:NO];
    [markField setBackgroundColor:[CPColor blackColor]];
    [markField setTextColor:[CPColor redColor]];
    [view addSubview:markField];

    timeField =
        [[CPTextField alloc]
            initWithFrame:
                CPMakeRect(DIMENSION*5, DIMENSION*8+SEPARATOR,
                           3*DIMENSION, DIMENSION)];
    [timeField setEditable:NO];
    [timeField setSelectable:NO];
    [timeField setBackgroundColor:[CPColor blackColor]];
    [timeField setTextColor:[CPColor redColor]];
    [view addSubview:timeField];

    var boardBox = 
        [[CPBox alloc] 
            initWithFrame:
                CPMakeRect(0, 0, DIMENSION*8.5, DIMENSION*8.5)];
    [boardBox setContentView:view];
    [boardBox setContentViewMargins:CPMakeSize(MARGIN, MARGIN)];
    [boardBox setTitle:@"Board"];
    [boardBox setBorderType:CPGrooveBorder];
    [boardBox sizeToFit];

    var frame = [CPWindow frameRectForContentRect:[boardBox frame] styleMask:m];

    window = [[CPWindow alloc] initWithContentRect:frame styleMask:m];

    [window setMinSize:frame.size];
    [window setTitle:@"Mines"];
    [window setDelegate:self];


    [window setFrame:frame display:YES];
    [window setMaxSize:frame.size];

    [window setContentView:boardBox];
    
    // several Unrecognized selector errors:

    // [window setReleasedWhenClosed:YES];


    [window center];
    console.log("makeGameWindow");
    // [window orderFront]; //Regardless];
    console.log("makeGameWindow");
    [window makeKeyWindow];
    // [window display];


    return self;
}


- newGame:(id)sender
{
    for (var row=0; row<8; row++){
        for (var col=0; col<8; col++){
            [fields[row][col] setDefaults];
        }
    }
    
    var mrow;
    var mcol;

    for (var index=0; index<10; index++){
        do {
            mrow = ~~(Math.random()*8); //lrand48()%8;
            mcol = ~~(Math.random()*8); //lrand48()%8;
        }
        while([fields[mrow][mcol] mine]==YES);
        [fields[mrow][mcol] setMine:YES];
    }

    for (row=0; row<8; row++){
        for (col=0; col<8; col++){
            // int sx, sy, nb;
            var nb = 0;
            for (var sx=-1; sx<=1; sx++){
                for (var sy=-1; sy<=1; sy++){
                    var cx = row+sx, cy = col+sy;
                    if (!(sx==0 && sy==0) &&
                       (0<=cx && cx<8) &&
                       (0<=cy && cy<8)){
                        if ([fields[cx][cy] mine]==YES){
                            nb++;
                        }
                    }
                }
            }

            if (nb>0){
                [fields[row][col] setNeighbors:nb];
            }
        }
    }

    [markField setIntValue:10];
    [timeField setStringValue:@""];

    uncovered = 0;
    atStart = YES;

    return self;
}


- uncoverRegion:(SquareView)item
{
    if ([item covered]!=COV_COVERED || [item marked]==YES){
        return self;
    }

    [item setCovered:COV_UNCOVERED];
    uncovered++;

    if ([item neighbors]>0){
        return self;
    }

    var row = [item row]; 
    var col = [item col];
    for (var sx=-1; sx<=1; sx++){
        for (var sy=-1; sy<=1; sy++){
            var cx = row + sx;
            var cy = col + sy;
            if (!(sx==0 && sy==0) &&
               (0<=cx && cx<8) &&
               (0<=cy && cy<8)){
                [self uncoverRegion:fields[cx][cy]];
            }
        }
    }

    return self;
}

- uncoverAll:(SquareView)item
{
    for (var row=0; row<8; row++){
        for (var col=0; col<8; col++){
            var other = fields[row][col];
            if (other!=item){
                [other setCovered:COV_UNCOVERED];
            }
        }
    }
    
    atStart = YES;

    return self;
}

- uncovered:(SquareView)item
{
    [self start];

    if (![item neighbors] && [item mine]==NO){
        [self uncoverRegion:item];
    }
    else if ([item mine]==NO){
        uncovered++;
    }

    var win = ((uncovered==(64-10) && ![markField intValue]) ? YES : NO);

    if ([item mine]==YES || win==YES){
        [self uncoverAll:item];
    }

    if ([item mine]==YES){
        [CPAlert alertWithError:@"You Lose!" ];

        // [CPAlert alertWithMessageText:[@"Game over." 
        //     defaultButton: @"You lose." 
        //     alternateButton: @"Ok" 
        //     otherButton:nil 
        //     informativeTextWithFormat: nil]];
    }
    else if (win==YES){
        [CPAlert alertWithError:@"You Win!" ];
    }

    return self;
}

- marked:(SquareView)item
{
    var marks = [markField intValue];
    [markField setIntValue:marks+([item marked]==YES ? -1 : 1)];

    [self start];

    var win = ((uncovered==(64-10) && ![markField intValue]) ? YES : NO);
    if (win==YES){
        [self uncoverAll:nil];
        [CPAlert alertWithError:@"You Win!" ];
        // CPRunAlertPanel(@"Congratulations!", @"You win.",
        //                 @"Ok", nil, nil);
    }

    return self;
}

- start
{
    if (atStart==YES){
        startDate = [CPDate date];
        [startDate retain];
        atStart = NO;
    }
    
    return self;
}

- tick
{
    if (atStart==NO){
        var delta = -[startDate timeIntervalSinceNow];
        var timeStr = 
            [CPString stringWithFormat:@"%06d:%02d", 
                      delta/60, delta%60];
        [timeField setStringValue:timeStr];
    }

    return self;
}

@end


