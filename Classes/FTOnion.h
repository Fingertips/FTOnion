#import <Foundation/Foundation.h>

#import "TargetConditionals.h"
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#define WINDOW_CLASS UIWindow
#define VIEW_CLASS UIView
#else
#import <AppKit/AppKit.h>
#define WINDOW_CLASS NSWindow
#define VIEW_CLASS NSView
#endif

#import "View+FTOnion.h"
