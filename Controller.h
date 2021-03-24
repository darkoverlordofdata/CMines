#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "Views.h"

@interface Controller : NSObject
{
    NSWindow *window;
    NSTextField *timeField, *markField;
    Square *fields[8][8];

    int uncovered;

    BOOL atStart;
    NSDate *startDate;
}

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification;

- makeGameWindow;

- newGame:(id)sender;

- uncoverRegion:(Square *)item;

- uncoverAll:(Square *)item;

- uncovered:(Square *)item;
- marked:(Square *)item;

- start;
- tick;

@end

