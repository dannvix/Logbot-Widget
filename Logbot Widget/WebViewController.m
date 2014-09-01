//
//  WebViewController.m
//  Logbot Widget
//
//  Created by Shao-Chung Chen on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "WebViewController.h"

@implementation WebViewController

@synthesize webView;

- (void) awakeFromNib
{
  NSURL *defaultURL = [NSURL URLWithString:@"http://logbot.g0v.tw/channel/g0v.tw"];
  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:defaultURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
  
  [webView setFrameLoadDelegate:self];
  [[webView mainFrame] loadRequest:urlRequest];
  

}

- (void) windowDidResize:(NSNotification *)aNotification
{
  NSWindow *mainWindow = [NSApp mainWindow];
  NSRect contentRect = [mainWindow contentRectForFrameRect:[mainWindow frame]];
  NSRect newRectOfView = NSMakeRect(0, 0, contentRect.size.width, contentRect.size.height);
  [webView setFrame: newRectOfView];
}

// the script environment is ready
- (void) webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowScriptObject forFrame:(WebFrame *)frame
{
  // add current controller to the script environment
  // it'll be available as "Cocoa" object to JavaScript in the WebView
  [windowScriptObject setValue:self forKey:@"Cocoa"];
}

+(NSString*) webScriptNameForSelector:(SEL)sel
{
  NSLog(@"webScriptNameForSelector:");
  if (sel == @selector(requestUserAttention)) return @"requestUserAttention";
  if (sel == @selector(addUnreadCountToBadgeLabel:)) return @"addUnreadCountToBadgeLabel";
  return nil;
}

+ (BOOL) isSelectorExcludedFromWebScript:(SEL)sel
{
  NSLog(@"isSelectorExcludedFromWebScript:");
  if (sel == @selector(requestUserAttention)) return NO;
  if (sel == @selector(addUnreadCountToBadgeLabel:)) return NO;
  return YES;
}

- (void) requestUserAttention
{
  [NSApp requestUserAttention:NSInformationalRequest];
}

- (void) addUnreadCountToBadgeLabel:(int)unreadCount
{
  int newUnreadCount = [[NSApp delegate] currentUnreadCount] + unreadCount;
  [[NSApp delegate] setCurrentUnreadCount:newUnreadCount];
  [[NSApp dockTile] setBadgeLabel:[NSString stringWithFormat:@"%d", newUnreadCount]];
}

@end
