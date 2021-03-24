/*
 *  main.m: main function of Fractal.app
 *
 *  Copyright (c) 2002 Free Software Foundation, Inc.
 *  
 *  Author: Marko Riedel
 *  Date: May 2002
 *
 *  With code fragments from MemoryPanel, ImageViewer, Finger, GDraw 
 *  and GShisen.
 *
 *  This sample program is part of GNUstep.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <AppKit/GSHbox.h>
#import <AppKit/GSVbox.h>

#import "Controller.h"

int main(int argc, const char **argv, char** env)
{
   NSAutoreleasePool *pool;
   NSApplication *app;
   NSMenu *mainMenu, *subMenu;
   NSMenu *menu;
   NSMenuItem *menuItem, *subMenuItem;
   Controller *controller;

   pool = [NSAutoreleasePool new];
   app = [NSApplication sharedApplication];

   //
   // Create the Menu 
   //

   // Main Menu
   mainMenu = AUTORELEASE ([NSMenu new]);

   // Info SubMenu
   menuItem = [mainMenu addItemWithTitle: @"Info" 
			action: NULL 
			keyEquivalent: @""];
   menu = AUTORELEASE ([NSMenu new]);
   [mainMenu setSubmenu: menu forItem: menuItem];
   [menu addItemWithTitle: @"Info Panel..." 
	 action: @selector (orderFrontStandardInfoPanel:) 
	 keyEquivalent: @""];
   [menu addItemWithTitle: @"Preferences..." 
	 action: @selector (runPreferencesPanel:) 
	 keyEquivalent: @""];
   [menu addItemWithTitle: @"Help..." 
	 action: @selector (orderFrontHelpPanel:)
	 keyEquivalent: @"?"];

   // Game MenuItem.
   menuItem = [mainMenu addItemWithTitle: @"New game" 
			action: @selector(newGame:) 
			keyEquivalent: @""];
   
   // Hide MenuItem
   [mainMenu addItemWithTitle: @"Hide" 
	     action: @selector (hide:)
	     keyEquivalent: @"h"];	

   // Quit MenuItem
   [mainMenu addItemWithTitle: @"Quit" 
	     action: @selector (terminate:)
	     keyEquivalent: @"q"];	

   [app setMainMenu: mainMenu];

   controller = [Controller new];
   [app setDelegate: controller];

   NSApplicationMain(argc, argv);

   [[NSUserDefaults standardUserDefaults] synchronize];

   // RELEASE (controller);
   // RELEASE (pool);
   return 0;
}

