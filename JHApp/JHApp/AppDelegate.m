//
//  AppDelegate.m
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import "AppDelegate.h"
#import "JHApp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [JHApp app];

    NSLog(@"kScreenWidth          = %@", @(kScreenWidth));
    NSLog(@"kScreenHeight         = %@", @(kScreenHeight));
    NSLog(@"k1Pixel               = %@", @(k1Pixel));
    NSLog(@"kStatusBarHeight      = %@", @(kStatusBarHeight));
    NSLog(@"kTopBarHeight         = %@", @(kTopBarHeight));
    NSLog(@"kBottomSafeAreaHeight = %@", @(kBottomSafeAreaHeight));
    NSLog(@"kTabbarHeight         = %@", @(kTabbarHeight));
    NSLog(@"kFullScreen           = %@", @(kFullScreen));
    
    return YES;
}

@end
