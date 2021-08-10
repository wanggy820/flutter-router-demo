#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSObject+Router.h"
#import "TJFlutterManager.h"
#import "TJFlutterRouterPlugin.h"
#import "TJFlutterViewController.h"
#import "TJRouter.h"
#import "TJWebViewController.h"

FOUNDATION_EXPORT double tj_flutter_router_pluginVersionNumber;
FOUNDATION_EXPORT const unsigned char tj_flutter_router_pluginVersionString[];

