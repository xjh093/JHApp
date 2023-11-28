//
//  JHApp.m
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import "JHApp.h"

@implementation JHApp

+ (instancetype)app
{
    static JHApp *app;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        app = [[JHApp alloc] init];
    });
    return app;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size = [[JHAppSize alloc] init];
    }
    return self;
}

+ (void)appConfig
{
#ifdef __IPHONE_11_0
    if (@available(ios 11.0,*)){
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
    
#endif
#ifdef __IPHONE_15_0
    if (@available(iOS 15.0, *)) {
        UITableView.appearance.sectionHeaderTopPadding = 0;
    }
#endif
}

@end
