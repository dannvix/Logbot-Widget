//
//  WebViewController.h
//  Logbot Widget
//
//  Created by Shao-Chung Chen on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WebViewController : NSObject

@property (assign) IBOutlet WebView *webView;

- (void) requestUserAttention;
- (void) addUnreadCountToBadgeLabel: (int)unreadCount;

@end
