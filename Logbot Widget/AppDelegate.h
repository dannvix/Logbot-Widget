//
//  AppDelegate.h
//  Logbot Widget
//
//  Created by Shao-Chung Chen on 1/28/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (readwrite) int currentUnreadCount;

@end

