//
//  JHAppBaseNavigationCtrl.h
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JHAppBaseNavigationCtrlDelegate <NSObject>

/**
 导航 返回代理方法
 可配合 JHAppBaseCtrl 的 canSlideBack 属性，进行返回判断
 */
- (void)didClickBackButton;

@end

@interface JHAppBaseNavigationCtrl : UINavigationController
/// 导航返回代理
@property (nonatomic,    weak) id<JHAppBaseNavigationCtrlDelegate>navDelegate;

/// 需要隐藏导航栏的控制器
@property (nonatomic,  strong) NSArray *ctrlsThatNavigationBarHidden;

@end

NS_ASSUME_NONNULL_END
