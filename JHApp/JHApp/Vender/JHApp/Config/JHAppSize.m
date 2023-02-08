//
//  JHAppSize.m
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import "JHAppSize.h"

@implementation JHAppSize

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGRect rect = [UIScreen mainScreen].bounds;
        
        _width = rect.size.width;
        _height = rect.size.height;
        _onePixel = 1 / [UIScreen mainScreen].scale;
        
        //
        UIEdgeInsets insets = UIEdgeInsetsZero;
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIWindow.alloc.init;
            insets = window.safeAreaInsets;
        }
        
        //NSLog(@"UIEdgeInsets = %@", NSStringFromUIEdgeInsets(insets));
        /*
         5S: UIEdgeInsets = {20, 0, 0, 0}
         6P: UIEdgeInsets = {20, 0, 0, 0}
         X:  UIEdgeInsets = {44, 0, 34, 0}
         XR: UIEdgeInsets = {48, 0, 34, 0}
         
         8 : UIEdgeInsets = {20, 0, 0, 0}
         12: UIEdgeInsets = {47, 0, 34, 0}
         */
        
        _statusBarHeight = insets.top;
        _topBarHeight = 44.0 + insets.top;
        _bottomSafeAreaHeight = insets.bottom;
        _tabbarHeight = 49.0 + insets.bottom;
        _isFullScreen = (insets.bottom > 0);
    }
    return self;
}

@end
