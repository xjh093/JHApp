//
//  JHAppBaseCtrl.m
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import "JHAppBaseCtrl.h"

@interface JHAppBaseCtrl ()

@end

@implementation JHAppBaseCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _canSlideBack = YES;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 设置代理
    [(JHAppBaseNavigationCtrl *)self.navigationController setNavDelegate:self];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = _canSlideBack;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    // 取消代理
    [(JHAppBaseNavigationCtrl *)self.navigationController setNavDelegate:nil];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

#pragma mark -------------------------------------视图-------------------------------------------

#pragma mark -------------------------------------事件-------------------------------------------

- (void)backButtonColorWhite{
    [_backButton setImage:[UIImage imageNamed:@"nav_btn_back_white"] forState:0];
}

- (void)backButtonColorBlack{
    [_backButton setImage:[UIImage imageNamed:@"nav_btn_back_black"] forState:0];
}

- (void)configCtrlForNavigationBarHidden:(NSArray <NSString *>*)ctrls
{
    NSArray *arr = self.navigationController.viewControllers;
    // 空的
    if (!arr.count || !ctrls.count) {
        return;
    }
    
    // 不是导航控制器的第一个，只要配置一次即可，那就在第一个控制器内配置
    if (self != arr.firstObject) {
        return;
    }
    
    JHAppBaseNavigationCtrl *nav = (JHAppBaseNavigationCtrl *)self.navigationController;
    if ([nav respondsToSelector:@selector(setCtrlsThatNavigationBarHidden:)]) {
        [nav setCtrlsThatNavigationBarHidden:ctrls];
    }
}

#pragma mark --- YEBaseNavigationCtrlDelegate

- (void)didClickBackButton{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc{
    NSLog(@"-[%@ %@]\n",[self class], NSStringFromSelector(_cmd));
}

#pragma mark -------------------------------------懒加载-----------------------------------------


@end
