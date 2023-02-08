//
//  JHAppSize.h
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHAppSize : NSObject

/// 屏幕宽度
@property (nonatomic,  assign) CGFloat  width;

/// 屏幕高度
@property (nonatomic,  assign) CGFloat  height;

/// 1个像素
@property (nonatomic,  assign) CGFloat  onePixel;

/// 状态栏高度
@property (nonatomic,  assign) CGFloat  statusBarHeight;

/// 导航栏高度(包含状态栏)
@property (nonatomic,  assign) CGFloat  topBarHeight;

/// 底部安全区域高度
@property (nonatomic,  assign) CGFloat  bottomSafeAreaHeight;

/// tabbar 高度
/// 在自定义的 TabbarCtrl，在方法 viewDidLayoutSubviews 内，可以获取到实际高度
/// 默认是 bottomSafeAreaHeight + 49
/// 疑问：不存在 UITabBarController 时，是否应该设置为 0 ？
@property (nonatomic,  assign) CGFloat  tabbarHeight;

/// 是否是全屏系列，根据 bottomSafeAreaHeight > 0 来判断
@property (nonatomic,  assign,  readonly) BOOL  isFullScreen;

@end

NS_ASSUME_NONNULL_END
