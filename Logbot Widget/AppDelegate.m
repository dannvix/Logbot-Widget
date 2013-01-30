//
//  AppDelegate.m
//  Logbot Widget
//
//  Created by Shao-Chung Chen on 1/28/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;
@synthesize currentUnreadCount;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  currentUnreadCount = 0;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
  return YES;
}


- (void)applicationDidBecomeActive:(NSNotification *)aNotification
{
  currentUnreadCount = 0;
  [[NSApp dockTile] setBadgeLabel:nil];
}

@end
