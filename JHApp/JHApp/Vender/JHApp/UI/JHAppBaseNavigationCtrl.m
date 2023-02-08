//
//  JHAppBaseNavigationCtrl.m
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import "JHAppBaseNavigationCtrl.h"
#import "JHAppBaseCtrl.h"

@interface JHAppBaseNavigationCtrl ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation JHAppBaseNavigationCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 左滑返回
    __weak typeof(self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    
    // 导航代理
    self.delegate = self;
}

#pragma mark -------------------------------------视图-------------------------------------------

+ (void)initialize
{
    // 导航样式统一设置
    
    // 导航栏，不透明
    //[UINavigationBar appearance].translucent = NO;
    
    // 导航栏的字体大小和颜色
    [UINavigationBar appearance].titleTextAttributes = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
        NSForegroundColorAttributeName: [UIColor systemBlueColor]
    };
    
    // 隐藏导航栏底部的细黑线
    //[UINavigationBar appearance].shadowImage = [UIImage new];
    
    // 导航背景图，纯白色图片
    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)] forBarMetrics:UIBarMetricsDefault];
    // 导航背景图，透明图片
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)backAction
{
    if (_navDelegate && [_navDelegate respondsToSelector:@selector(didClickBackButton)]) {
        [_navDelegate didClickBackButton];
    }else{
        [self popViewControllerAnimated:YES];
    }
}

#pragma mark --- override

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 44, 44);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //button.touchAreaInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [button setImage:[UIImage imageNamed:@"nav_btn_back_black"] forState:0];
        [button addTarget:self action:@selector(backAction) forControlEvents:1<<6];
        
        BOOL hidden = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = hidden;
        
        // 是基类控制器，则设置 backBtn
        if ([viewController isKindOfClass:[JHAppBaseCtrl class]]) {
            [(JHAppBaseCtrl *)viewController setBackButton:button];
        }
    }
    
    self.modalPresentationStyle = 0;
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!_ctrlsThatNavigationBarHidden.count) {
        return;
    }
    
    // 处理导航的隐藏与显示
    BOOL isMe = [_ctrlsThatNavigationBarHidden containsObject:NSStringFromClass([viewController class])];
    [self setNavigationBarHidden:isMe animated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
// 子控制器大于 1 时，说明不在根控制器
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.viewControllers.count > 1;
}

#pragma mark -------------------------------------懒加载-----------------------------------------


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
