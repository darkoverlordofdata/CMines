@STATIC;1.0;p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
p;15;AppController.jt;15765;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;7;Views.jt;15686;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("Views.j", YES);var DIMENSION = 24;
var SEPARATOR = 10;
var MARGIN = 6;

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("window", "CPWindow"), new objj_ivar("timeField", "CPTextField"), new objj_ivar("markField", "CPTextField"), new objj_ivar("fields", "Square"), new objj_ivar("uncovered", "int"), new objj_ivar("atStart", "BOOL"), new objj_ivar("startDate", "CPDate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.fields = [Array(8), Array(8), Array(8), Array(8), Array(8), Array(8), Array(8), Array(8)];
    var inv = (CPInvocation.isa.method_msgSend["invocationWithMethodSignature:"] || _objj_forward)(CPInvocation, "invocationWithMethodSignature:", (self.isa.method_msgSend["methodSignatureForSelector:"] || _objj_forward)(self, "methodSignatureForSelector:", sel_getUid("tick")));
    (inv == null ? inv : (inv.isa.method_msgSend["setSelector:"] || _objj_forward)(inv, "setSelector:", sel_getUid("tick")));
    (inv == null ? inv : (inv.isa.method_msgSend["setTarget:"] || _objj_forward)(inv, "setTarget:", self));
    (inv == null ? inv : (inv.isa.method_msgSend["retain"] || _objj_forward)(inv, "retain"));
    (CPTimer.isa.method_msgSend["scheduledTimerWithTimeInterval:invocation:repeats:"] || _objj_forward)(CPTimer, "scheduledTimerWithTimeInterval:invocation:repeats:", 1.0, inv, YES);
    self.window = nil;
    (self.isa.method_msgSend["makeGameWindow"] || _objj_forward)(self, "makeGameWindow");
    (self.isa.method_msgSend["newGame:"] || _objj_forward)(self, "newGame:", nil);
}

,["void","CPNotification"]), new objj_method(sel_getUid("makeGameWindow"), function $AppController__makeGameWindow(self, _cmd)
{
    var m = CPTitledWindowMask;
    var view = ((___r1 = (CPView.isa.method_msgSend["alloc"] || _objj_forward)(CPView, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CPMakeRect(0, 0, DIMENSION * 8, DIMENSION * 8)));
    for (var row = 0; row < 8; row++)
    {
        for (var col = 0; col < 8; col++)
        {
            var spoint = CPMakePoint(row * DIMENSION, col * DIMENSION);
            var field = ((___r1 = (Square.isa.method_msgSend["alloc"] || _objj_forward)(Square, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["initAtPoint:row:col:controller:"] || _objj_forward)(___r1, "initAtPoint:row:col:controller:", spoint, row, col, self));
            (view == null ? view : (view.isa.method_msgSend["addSubview:"] || _objj_forward)(view, "addSubview:", field));
            self.fields[row][col] = field;
        }
    }
    self.markField = ((___r1 = (CPTextField.isa.method_msgSend["alloc"] || _objj_forward)(CPTextField, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CPMakeRect(0, DIMENSION * 8 + SEPARATOR, 3 * DIMENSION, DIMENSION)));
    ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setEditable:"] || _objj_forward)(___r1, "setEditable:", NO));
    ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setSelectable:"] || _objj_forward)(___r1, "setSelectable:", NO));
    ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setBackgroundColor:"] || _objj_forward)(___r1, "setBackgroundColor:", (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")));
    ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setTextColor:"] || _objj_forward)(___r1, "setTextColor:", (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor")));
    (view == null ? view : (view.isa.method_msgSend["addSubview:"] || _objj_forward)(view, "addSubview:", self.markField));
    self.timeField = ((___r1 = (CPTextField.isa.method_msgSend["alloc"] || _objj_forward)(CPTextField, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CPMakeRect(DIMENSION * 5, DIMENSION * 8 + SEPARATOR, 3 * DIMENSION, DIMENSION)));
    ((___r1 = self.timeField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setEditable:"] || _objj_forward)(___r1, "setEditable:", NO));
    ((___r1 = self.timeField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setSelectable:"] || _objj_forward)(___r1, "setSelectable:", NO));
    ((___r1 = self.timeField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setBackgroundColor:"] || _objj_forward)(___r1, "setBackgroundColor:", (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")));
    ((___r1 = self.timeField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setTextColor:"] || _objj_forward)(___r1, "setTextColor:", (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor")));
    (view == null ? view : (view.isa.method_msgSend["addSubview:"] || _objj_forward)(view, "addSubview:", self.timeField));
    var boardBox = ((___r1 = (CPBox.isa.method_msgSend["alloc"] || _objj_forward)(CPBox, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CPMakeRect(0, 0, DIMENSION * 8.5, DIMENSION * 8.5)));
    (boardBox == null ? boardBox : (boardBox.isa.method_msgSend["setContentView:"] || _objj_forward)(boardBox, "setContentView:", view));
    (boardBox == null ? boardBox : (boardBox.isa.method_msgSend["setContentViewMargins:"] || _objj_forward)(boardBox, "setContentViewMargins:", CPMakeSize(MARGIN, MARGIN)));
    (boardBox == null ? boardBox : (boardBox.isa.method_msgSend["setTitle:"] || _objj_forward)(boardBox, "setTitle:", "Board"));
    (boardBox == null ? boardBox : (boardBox.isa.method_msgSend["setBorderType:"] || _objj_forward)(boardBox, "setBorderType:", CPGrooveBorder));
    (boardBox == null ? boardBox : (boardBox.isa.method_msgSend["sizeToFit"] || _objj_forward)(boardBox, "sizeToFit"));
    var frame = (CPWindow.isa.method_msgSend["frameRectForContentRect:styleMask:"] || _objj_forward)(CPWindow, "frameRectForContentRect:styleMask:", (boardBox == null ? boardBox : (boardBox.isa.method_msgSend["frame"] || _objj_forward)(boardBox, "frame")), m);
    self.window = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", frame, m));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setMinSize:"] || _objj_forward)(___r1, "setMinSize:", frame.size));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setTitle:"] || _objj_forward)(___r1, "setTitle:", "Mines"));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setDelegate:"] || _objj_forward)(___r1, "setDelegate:", self));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setFrame:display:"] || _objj_forward)(___r1, "setFrame:display:", frame, YES));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setMaxSize:"] || _objj_forward)(___r1, "setMaxSize:", frame.size));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setContentView:"] || _objj_forward)(___r1, "setContentView:", boardBox));
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["center"] || _objj_forward)(___r1, "center"));
    console.log("makeGameWindow");
    console.log("makeGameWindow");
    ((___r1 = self.window), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["makeKeyWindow"] || _objj_forward)(___r1, "makeKeyWindow"));
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("newGame:"), function $AppController__newGame_(self, _cmd, sender)
{
    for (var row = 0; row < 8; row++)
    {
        for (var col = 0; col < 8; col++)
        {
            ((___r1 = self.fields[row][col]), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setDefaults"] || _objj_forward)(___r1, "setDefaults"));
        }
    }
    var mrow;
    var mcol;
    for (var index = 0; index < 10; index++)
    {
        do
        {
            mrow = ~~(Math.random() * 8);
            mcol = ~~(Math.random() * 8);
        }
        while (((___r1 = self.fields[mrow][mcol]), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["mine"] || _objj_forward)(___r1, "mine")) == YES);
                ((___r1 = self.fields[mrow][mcol]), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setMine:"] || _objj_forward)(___r1, "setMine:", YES));
    }
    for (row = 0; row < 8; row++)
    {
        for (col = 0; col < 8; col++)
        {
            var nb = 0;
            for (var sx = -1; sx <= 1; sx++)
            {
                for (var sy = -1; sy <= 1; sy++)
                {
                    var cx = row + sx,
                        cy = col + sy;
                    if (!(sx == 0 && sy == 0) && (0 <= cx && cx < 8) && (0 <= cy && cy < 8))
                    {
                        if (((___r1 = self.fields[cx][cy]), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["mine"] || _objj_forward)(___r1, "mine")) == YES)
                        {
                            nb++;
                        }
                    }
                }
            }
            if (nb > 0)
            {
                ((___r1 = self.fields[row][col]), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setNeighbors:"] || _objj_forward)(___r1, "setNeighbors:", nb));
            }
        }
    }
    ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setIntValue:"] || _objj_forward)(___r1, "setIntValue:", 10));
    ((___r1 = self.timeField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setStringValue:"] || _objj_forward)(___r1, "setStringValue:", ""));
    self.uncovered = 0;
    self.atStart = YES;
    return self;
    var ___r1;
}

,["id","id"]), new objj_method(sel_getUid("uncoverRegion:"), function $AppController__uncoverRegion_(self, _cmd, item)
{
    if ((item == null ? item : (item.isa.method_msgSend["covered"] || _objj_forward)(item, "covered")) != COV_COVERED || (item == null ? item : (item.isa.method_msgSend["marked"] || _objj_forward)(item, "marked")) == YES)
    {
        return self;
    }
    (item == null ? item : (item.isa.method_msgSend["setCovered:"] || _objj_forward)(item, "setCovered:", COV_UNCOVERED));
    self.uncovered++;
    if ((item == null ? item : (item.isa.method_msgSend["neighbors"] || _objj_forward)(item, "neighbors")) > 0)
    {
        return self;
    }
    var row = (item == null ? item : (item.isa.method_msgSend["row"] || _objj_forward)(item, "row"));
    var col = (item == null ? item : (item.isa.method_msgSend["col"] || _objj_forward)(item, "col"));
    for (var sx = -1; sx <= 1; sx++)
    {
        for (var sy = -1; sy <= 1; sy++)
        {
            var cx = row + sx;
            var cy = col + sy;
            if (!(sx == 0 && sy == 0) && (0 <= cx && cx < 8) && (0 <= cy && cy < 8))
            {
                (self.isa.method_msgSend["uncoverRegion:"] || _objj_forward)(self, "uncoverRegion:", self.fields[cx][cy]);
            }
        }
    }
    return self;
}

,["id","Square"]), new objj_method(sel_getUid("uncoverAll:"), function $AppController__uncoverAll_(self, _cmd, item)
{
    for (var row = 0; row < 8; row++)
    {
        for (var col = 0; col < 8; col++)
        {
            var other = self.fields[row][col];
            if (other != item)
            {
                (other == null ? other : (other.isa.method_msgSend["setCovered:"] || _objj_forward)(other, "setCovered:", COV_UNCOVERED));
            }
        }
    }
    self.atStart = YES;
    return self;
}

,["id","Square"]), new objj_method(sel_getUid("uncovered:"), function $AppController__uncovered_(self, _cmd, item)
{
    (self.isa.method_msgSend["start"] || _objj_forward)(self, "start");
    if (!(item == null ? item : (item.isa.method_msgSend["neighbors"] || _objj_forward)(item, "neighbors")) && (item == null ? item : (item.isa.method_msgSend["mine"] || _objj_forward)(item, "mine")) == NO)
    {
        (self.isa.method_msgSend["uncoverRegion:"] || _objj_forward)(self, "uncoverRegion:", item);
    }
    else if ((item == null ? item : (item.isa.method_msgSend["mine"] || _objj_forward)(item, "mine")) == NO)
    {
        self.uncovered++;
    }
    var win = self.uncovered == 64 - 10 && !((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["intValue"] || _objj_forward)(___r1, "intValue")) ? YES : NO;
    if ((item == null ? item : (item.isa.method_msgSend["mine"] || _objj_forward)(item, "mine")) == YES || win == YES)
    {
        (self.isa.method_msgSend["uncoverAll:"] || _objj_forward)(self, "uncoverAll:", item);
    }
    if ((item == null ? item : (item.isa.method_msgSend["mine"] || _objj_forward)(item, "mine")) == YES)
    {
        (CPAlert.isa.method_msgSend["alertWithError:"] || _objj_forward)(CPAlert, "alertWithError:", "You Lose!");
    }
    else if (win == YES)
    {
        (CPAlert.isa.method_msgSend["alertWithError:"] || _objj_forward)(CPAlert, "alertWithError:", "You Win!");
    }
    return self;
    var ___r1;
}

,["id","Square"]), new objj_method(sel_getUid("marked:"), function $AppController__marked_(self, _cmd, item)
{
    var marks = ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["intValue"] || _objj_forward)(___r1, "intValue"));
    ((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setIntValue:"] || _objj_forward)(___r1, "setIntValue:", marks + ((item == null ? item : (item.isa.method_msgSend["marked"] || _objj_forward)(item, "marked")) == YES ? -1 : 1)));
    (self.isa.method_msgSend["start"] || _objj_forward)(self, "start");
    var win = self.uncovered == 64 - 10 && !((___r1 = self.markField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["intValue"] || _objj_forward)(___r1, "intValue")) ? YES : NO;
    if (win == YES)
    {
        (self.isa.method_msgSend["uncoverAll:"] || _objj_forward)(self, "uncoverAll:", nil);
        (CPAlert.isa.method_msgSend["alertWithError:"] || _objj_forward)(CPAlert, "alertWithError:", "You Win!");
    }
    return self;
    var ___r1;
}

,["id","Square"]), new objj_method(sel_getUid("start"), function $AppController__start(self, _cmd)
{
    if (self.atStart == YES)
    {
        self.startDate = (CPDate.isa.method_msgSend["date"] || _objj_forward)(CPDate, "date");
        ((___r1 = self.startDate), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["retain"] || _objj_forward)(___r1, "retain"));
        self.atStart = NO;
    }
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("tick"), function $AppController__tick(self, _cmd)
{
    if (self.atStart == NO)
    {
        var delta = -((___r1 = self.startDate), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["timeIntervalSinceNow"] || _objj_forward)(___r1, "timeIntervalSinceNow"));
        var timeStr = (CPString.isa.method_msgSend["stringWithFormat:"] || _objj_forward)(CPString, "stringWithFormat:", "%06d:%02d", delta / 60, delta % 60);
        ((___r1 = self.timeField), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setStringValue:"] || _objj_forward)(___r1, "setStringValue:", timeStr));
    }
    return self;
    var ___r1;
}

,["id"])]);
}
p;7;Views.jt;12841;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;12773;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);var DIMENSION = 24;
var SEPARATOR = 10;
var MARGIN = 6;
{var the_typedef = objj_allocateTypeDef("COV_STATE");
objj_registerTypeDef(the_typedef);
}COV_COVERED = 0;
COV_UNCOVERED = 1;
COV_UNCOVERED_BY_CLICK = 2;

{var the_class = objj_allocateClassPair(CPView, "Square"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("row", "int"), new objj_ivar("col", "int"), new objj_ivar("isMine", "BOOL"), new objj_ivar("neighbors", "int"), new objj_ivar("covered", "COV_STATE"), new objj_ivar("marked", "BOOL"), new objj_ivar("con", "id"), new objj_ivar("path", "CPBezierPath")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initAtPoint:row:col:controller:"), function $Square__initAtPoint_row_col_controller_(self, _cmd, aPoint, rval, cval, theCon)
{
    var frame = CPMakeRect(0, 0, 0, 0);
    frame.origin = aPoint;
    frame.size.width = frame.size.height = DIMENSION;
    (objj_getClass("Square").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", frame);
    (self.isa.method_msgSend["setDefaults"] || _objj_forward)(self, "setDefaults");
    self.con = theCon;
    self.row = rval;
    self.col = cval;
    self.path = ((___r1 = (CPBezierPath.isa.method_msgSend["alloc"] || _objj_forward)(CPBezierPath, "alloc")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
    return self;
    var ___r1;
}

,["id","CPPoint","int","int","id"]), new objj_method(sel_getUid("row"), function $Square__row(self, _cmd)
{
    return self.row;
}

,["int"]), new objj_method(sel_getUid("col"), function $Square__col(self, _cmd)
{
    return self.col;
}

,["int"]), new objj_method(sel_getUid("setDefaults"), function $Square__setDefaults(self, _cmd)
{
    self.isMine = NO;
    self.neighbors = 0;
    self.covered = COV_COVERED;
    self.marked = NO;
    (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    return self;
}

,["id"]), new objj_method(sel_getUid("setMine:"), function $Square__setMine_(self, _cmd, flag)
{
    if (flag != self.isMine)
    {
        (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    }
    self.isMine = flag;
    return self;
}

,["id","BOOL"]), new objj_method(sel_getUid("setNeighbors:"), function $Square__setNeighbors_(self, _cmd, count)
{
    if (count != self.neighbors)
    {
        (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    }
    self.neighbors = count;
    return self;
}

,["id","int"]), new objj_method(sel_getUid("setCovered:"), function $Square__setCovered_(self, _cmd, aState)
{
    if (aState != self.covered)
    {
        (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    }
    self.covered = aState;
    return self;
}

,["id","COV_STATE"]), new objj_method(sel_getUid("setMarked:"), function $Square__setMarked_(self, _cmd, flag)
{
    if (flag != self.marked)
    {
        (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    }
    self.marked = flag;
    return self;
}

,["id","BOOL"]), new objj_method(sel_getUid("mine"), function $Square__mine(self, _cmd)
{
    return self.isMine;
}

,["BOOL"]), new objj_method(sel_getUid("neighbors"), function $Square__neighbors(self, _cmd)
{
    return self.neighbors;
}

,["int"]), new objj_method(sel_getUid("covered"), function $Square__covered(self, _cmd)
{
    return self.covered;
}

,["COV_STATE"]), new objj_method(sel_getUid("marked"), function $Square__marked(self, _cmd)
{
    return self.marked;
}

,["BOOL"]), new objj_method(sel_getUid("drawRect:"), function $Square__drawRect_(self, _cmd, aRect)
{
    ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setLineWidth:"] || _objj_forward)(___r1, "setLineWidth:", 1.0));
    if (self.covered == COV_COVERED)
    {
        if (self.marked == YES)
        {
            var center = DIMENSION - DIMENSION / 3,
                width = DIMENSION / 3 + 4;
            ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
            (CPBezierPath.isa.method_msgSend["fillRect:"] || _objj_forward)(CPBezierPath, "fillRect:", CPMakeRect(center - width / 2, 2, width, 4));
            (CPBezierPath.isa.method_msgSend["fillRect:"] || _objj_forward)(CPBezierPath, "fillRect:", CPMakeRect(center - width / 2 + 2, 6, width - 4, 3));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(center, 9)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(center, 5 * DIMENSION / 6)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["stroke"] || _objj_forward)(___r1, "stroke"));
            ((___r1 = (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
            (CPBezierPath.isa.method_msgSend["fillRect:"] || _objj_forward)(CPBezierPath, "fillRect:", CPMakeRect(center - DIMENSION / 2, DIMENSION / 2, DIMENSION / 2, 5 * DIMENSION / 6 - DIMENSION / 2));
        }
    }
    else
    {
        if (self.covered == COV_UNCOVERED_BY_CLICK && self.isMine == YES)
        {
            ((___r1 = (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
        }
        else
        {
            ((___r1 = (CPColor.isa.method_msgSend["whiteColor"] || _objj_forward)(CPColor, "whiteColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
        }
        (CPBezierPath.isa.method_msgSend["fillRect:"] || _objj_forward)(CPBezierPath, "fillRect:", CPMakeRect(0, 0, DIMENSION, DIMENSION));
        if (self.isMine == YES || self.marked == YES)
        {
            ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["appendBezierPathWithArcFromPoint:toPoint:radius:"] || _objj_forward)(___r1, "appendBezierPathWithArcFromPoint:toPoint:radius:", CGPointMake(DIMENSION / 2, DIMENSION / 2), CGPointMake(DIMENSION / 2 - 3, 0), 360));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["fill"] || _objj_forward)(___r1, "fill"));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(-DIMENSION / 2, 0)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(DIMENSION / 2, 0)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(0, -DIMENSION / 2)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(0, DIMENSION / 2)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(-DIMENSION / 2, 0)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(DIMENSION / 2, 0)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(0, -DIMENSION / 2)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(0, DIMENSION / 2)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["stroke"] || _objj_forward)(___r1, "stroke"));
            ((___r1 = (CPColor.isa.method_msgSend["whiteColor"] || _objj_forward)(CPColor, "whiteColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["appendBezierPathWithArcFromPoint:toPoint:radius:"] || _objj_forward)(___r1, "appendBezierPathWithArcFromPoint:toPoint:radius:", CGPointMake(DIMENSION / 2 - DIMENSION / 8, DIMENSION / 2 + DIMENSION / 8), CGPointMake(DIMENSION / 10, 0), 360));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["fill"] || _objj_forward)(___r1, "fill"));
        }
        if (self.isMine == NO && self.marked == YES)
        {
            ((___r1 = (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["setLineWidth:"] || _objj_forward)(___r1, "setLineWidth:", 5.0));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(3, 3)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(DIMENSION - 3, DIMENSION - 3)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(3, DIMENSION - 3)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["lineToPoint:"] || _objj_forward)(___r1, "lineToPoint:", CGPointMake(DIMENSION - 3, 3)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["stroke"] || _objj_forward)(___r1, "stroke"));
        }
        if (self.isMine == NO && self.marked == NO && self.neighbors > 0)
        {
            var str = ["0", 0];
            var comp = self.neighbors / 9.0;
            str[0] += self.neighbors;
            ((___r1 = (CPColor.isa.method_msgSend["colorWithRed:green:blue:alpha:"] || _objj_forward)(CPColor, "colorWithRed:green:blue:alpha:", 1.0 - comp, comp, comp, 1.0)), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["moveToPoint:"] || _objj_forward)(___r1, "moveToPoint:", CGPointMake(3, 3)));
            ((___r1 = self.path), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["stroke"] || _objj_forward)(___r1, "stroke"));
        }
    }
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    (CPBezierPath.isa.method_msgSend["strokeRect:"] || _objj_forward)(CPBezierPath, "strokeRect:", CPMakeRect(0, 0, DIMENSION, DIMENSION));
    ((___r1 = (CPColor.isa.method_msgSend["whiteColor"] || _objj_forward)(CPColor, "whiteColor")), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    (CPBezierPath.isa.method_msgSend["strokeRect:"] || _objj_forward)(CPBezierPath, "strokeRect:", CPMakeRect(1, 1, DIMENSION - 1, DIMENSION - 1));
    var ___r1;
}

,["void","CPRect"]), new objj_method(sel_getUid("mouseDown:"), function $Square__mouseDown_(self, _cmd, theEvent)
{
    if (self.covered == COV_COVERED && self.marked == NO)
    {
        ((___r1 = self.con), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["uncovered:"] || _objj_forward)(___r1, "uncovered:", self));
        (self.isa.method_msgSend["setCovered:"] || _objj_forward)(self, "setCovered:", COV_UNCOVERED_BY_CLICK);
    }
    var ___r1;
}

,["void","CPEvent"]), new objj_method(sel_getUid("rightMouseDown:"), function $Square__rightMouseDown_(self, _cmd, theEvent)
{
    if (self.covered == COV_COVERED)
    {
        (self.isa.method_msgSend["setMarked:"] || _objj_forward)(self, "setMarked:", self.marked == YES ? NO : YES);
        ((___r1 = self.con), ___r1 == null ? ___r1 : (___r1.isa.method_msgSend["marked:"] || _objj_forward)(___r1, "marked:", self));
    }
    var ___r1;
}

,["void","CPEvent"])]);
}
