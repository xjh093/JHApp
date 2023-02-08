//
//  JHAppBaseCtrl.h
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import <UIKit/UIKit.h>
#import "JHAppBaseNavigationCtrl.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHAppBaseCtrl : UIViewController<JHAppBaseNavigationCtrlDelegate>

/// 导航返回按钮
@property (nonatomic,  strong) UIButton *backButton;

/// 是否能滑动返回，默认 YES
@property (nonatomic,  assign) BOOL  canSlideBack;

/// 返回按钮设置为白色图标
- (void)backButtonColorWhite;
/// 返回按钮设置为灰色图标
- (void)backButtonColorBlack;

/// 配置那些需要隐藏导航的控制器，在第一个控制器配置即可
- (void)configCtrlForNavigationBarHidden:(NSArray <NSString *>*)ctrls;

@end

NS_ASSUME_NONNULL_END
