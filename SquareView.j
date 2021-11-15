@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>


// var DIMENSION    = 24;
var DIMENSION    = 40;
var SEPARATOR    = 10;
var MARGIN        = 6;

@typedef COV_STATE
COV_COVERED=0;
COV_UNCOVERED=1;
COV_UNCOVERED_BY_CLICK=2;

@implementation SquareView : CPView
{
    int row;
    int col;

    BOOL isMine;
    int neighbors;
    COV_STATE covered;
    BOOL marked;

    id con;
    CPBezierPath path;
    CPImage image_0;
    CPImage image_1;
    CPImage image_2;
    CPImage image_3;
    CPImage image_4;
    CPImage image_5;
    CPImage image_6;
    CPImage image_7;
    CPImage image_8;
    CPImage image_flag;
    CPImage image_hidden;
    CPImage image_mine;
    CPImage image_misplaced;
    CPImage image_question;
}


- initAtPoint:(CPPoint)aPoint row:(int)rval col:(int)cval
   controller:(id)theCon
{
    image_0 = [[CPImage alloc] initWithContentsOfFile:"Resources/0.png" size:CPSizeMake(40, 40)];
    image_1 = [[CPImage alloc] initWithContentsOfFile:"Resources/1.png" size:CPSizeMake(40, 40)];
    image_2 = [[CPImage alloc] initWithContentsOfFile:"Resources/2.png" size:CPSizeMake(40, 40)];
    image_3 = [[CPImage alloc] initWithContentsOfFile:"Resources/3.png" size:CPSizeMake(40, 40)];
    image_4 = [[CPImage alloc] initWithContentsOfFile:"Resources/4.png" size:CPSizeMake(40, 40)];
    image_5 = [[CPImage alloc] initWithContentsOfFile:"Resources/5.png" size:CPSizeMake(40, 40)];
    image_6 = [[CPImage alloc] initWithContentsOfFile:"Resources/6.png" size:CPSizeMake(40, 40)];
    image_7 = [[CPImage alloc] initWithContentsOfFile:"Resources/7.png" size:CPSizeMake(40, 40)];
    image_8 = [[CPImage alloc] initWithContentsOfFile:"Resources/8.png" size:CPSizeMake(40, 40)];
    image_flag = [[CPImage alloc] initWithContentsOfFile:"Resources/flag.png" size:CPSizeMake(40, 40)];
    image_hidden = [[CPImage alloc] initWithContentsOfFile:"Resources/hidden.png" size:CPSizeMake(40, 40)];
    image_mine = [[CPImage alloc] initWithContentsOfFile:"Resources/mine.png" size:CPSizeMake(40, 40)];
    image_misplaced = [[CPImage alloc] initWithContentsOfFile:"Resources/misplaced.png" size:CPSizeMake(40, 40)];
    image_question = [[CPImage alloc] initWithContentsOfFile:"Resources/question.png" size:CPSizeMake(40, 40)];


    var frame = CPMakeRect(0, 0, 0, 0);

    frame.origin = aPoint;
    frame.size.width = frame.size.height = DIMENSION;

    [super initWithFrame:frame];

    [self setDefaults];
    con = theCon;

    row = rval;
    col = cval;

    path = [[CPBezierPath alloc] init];

    return self;
}

- (int)row
{
    return row;
}

- (int)col
{
    return col;
}

- setDefaults
{
    isMine = NO;
    neighbors = 0;
    covered = COV_COVERED;
    marked = NO;

    [self setNeedsDisplay:YES];
    return self;
}

- setMine:(BOOL)flag;
{
    if (flag!=isMine){
        [self setNeedsDisplay:YES];
    }

    isMine = flag;
    return self;
}

- setNeighbors:(int)count;
{
    if (count!=neighbors){
        [self setNeedsDisplay:YES];
    }

    neighbors = count;
    return self;
}

- setCovered:(COV_STATE)aState
{
    if (aState!=covered){
        [self setNeedsDisplay:YES];
    }

    covered = aState;
    return self;
}

- setMarked:(BOOL)flag;
{
    if (flag!=marked){
        [self setNeedsDisplay:YES];
    }

    marked = flag;
    return self;
}

- (BOOL)mine;
{
    return isMine;
}

- (int)neighbors
{
    return neighbors;
}

- (COV_STATE)covered
{
    return covered;
}

- (BOOL)marked
{
    return marked;
}

- (void)drawRect:(CPRect)aRect
{ 
    [path setLineWidth:1.0];
    // PSsetlinewidth(1.0);

    if (covered==COV_COVERED){
        if (marked==YES){
            var center = DIMENSION-DIMENSION/3, width = DIMENSION/3+4;

            [[CPColor blackColor] set];
            [CPBezierPath fillRect: CPMakeRect(center-width/2, 2, width, 4)];
            [CPBezierPath fillRect: CPMakeRect(center-width/2+2, 6, width-4, 3)];

            [path moveToPoint:CGPointMake(center, 9)];
            [path lineToPoint:CGPointMake(center, 5*DIMENSION/6)];
            [path stroke];

            [[CPColor redColor] set];
            [CPBezierPath fillRect: CPMakeRect(center-DIMENSION/2, DIMENSION/2, 
                       DIMENSION/2, 5*DIMENSION/6-DIMENSION/2)];
        }
    }
    else{
        if (covered==COV_UNCOVERED_BY_CLICK && isMine==YES){
            [[CPColor redColor] set];
        }
        else{
            [[CPColor whiteColor] set];
        }
        [CPBezierPath fillRect: CPMakeRect(0, 0, DIMENSION, DIMENSION)];

        // PSrectfill(0, 0, DIMENSION, DIMENSION);

        if (isMine==YES || marked==YES){
            [[CPColor blackColor] set];

            [path appendBezierPathWithArcFromPoint: CGPointMake(DIMENSION/2, DIMENSION/2) 
                toPoint:CGPointMake(DIMENSION/2-3, 0)
                radius:360];

            [path fill];
            // PSgsave();??
            // PStranslate(DIMENSION/2, DIMENSION/2);??
            [path moveToPoint:CGPointMake(-DIMENSION/2, 0)];
            [path lineToPoint:CGPointMake(DIMENSION/2, 0)];
            [path moveToPoint:CGPointMake(0, -DIMENSION/2)];
            [path lineToPoint:CGPointMake(0, DIMENSION/2)];

            // PSrotate(45);??

            [path moveToPoint:CGPointMake(-DIMENSION/2, 0)];
            [path lineToPoint:CGPointMake(DIMENSION/2, 0)];
            [path moveToPoint:CGPointMake(0, -DIMENSION/2)];
            [path lineToPoint:CGPointMake(0, DIMENSION/2)];

            [path stroke];

            // PSgrestore();??

            [[CPColor whiteColor] set];
            [path appendBezierPathWithArcFromPoint: CGPointMake(DIMENSION/2-DIMENSION/8, DIMENSION/2+DIMENSION/8)
                toPoint: CGPointMake(DIMENSION/10, 0)
                radius:360];
            [path fill];
        }

        if (isMine==NO && marked==YES){
            [[CPColor redColor] set];

            // PSgsave();??

            [path setLineWidth:5.0];

            [path moveToPoint:CGPointMake(3, 3)];
            [path lineToPoint:CGPointMake(DIMENSION-3, DIMENSION-3)];
            [path moveToPoint:CGPointMake(3, DIMENSION-3)];
            [path lineToPoint:CGPointMake(DIMENSION-3, 3)];
            [path stroke];

            // PSgrestore();??
        }

        if (isMine==NO && marked==NO && neighbors>0){
            var str = [ "0", 0 ];
            var comp = (neighbors)/9.0;
            // var font = [CPFont systemFontOfSize:DIMENSION-6];
            // [font set];

            str[0] += neighbors;

            [[CPColor colorWithRed:1.0-comp green:comp blue:comp alpha:1.0] set]
            [path moveToPoint:CGPointMake(3, 3)];
            // PSshow(str);??
            [path stroke];
        }
    }


    [[CPColor blackColor] set];
    [CPBezierPath strokeRect: CPMakeRect(0, 0, DIMENSION, DIMENSION)];

    [[CPColor whiteColor] set];
    [CPBezierPath strokeRect: CPMakeRect(1, 1, DIMENSION-1, DIMENSION-1)];
}


- (void)mouseDown:(CPEvent)theEvent
{
    if (covered==COV_COVERED && marked==NO){
        [con uncovered:self];
        [self setCovered:COV_UNCOVERED_BY_CLICK];
    }
}

- (void)rightMouseDown:(CPEvent)theEvent
{
    if (covered==COV_COVERED){
        [self setMarked:(marked==YES ? NO : YES)];
        [con marked:self];
    }
}

@end

