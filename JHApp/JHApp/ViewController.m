//
//  ViewController.m
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //[self log:1];
    /*
     5s: 1.UIEdgeInsets = {0, 0, 0, 0}
     6p: 1.UIEdgeInsets = {0, 0, 0, 0}
     X:  1.UIEdgeInsets = {0, 0, 0, 0}
     XR: 1.UIEdgeInsets = {0, 0, 0, 0}
     */
    
    self.navigationItem.title = @"JHApp";
    //self.view.backgroundColor = [UIColor systemTealColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 62);
    button.backgroundColor = [UIColor systemPurpleColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"第二个页面" forState:0];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:1<<6];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 60);
    label.text = @"设置了第2，4个页面的导航需要隐藏";
    label.textColor = [UIColor systemTealColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.center = CGPointMake(self.view.center.x, self.view.center.y + 70);
    
    // 设置第2，4个页面的导航需要隐藏
    [self configCtrlForNavigationBarHidden:@[@"SecondViewController", @"ForthViewController"]];
}

- (void)buttonAction
{
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // 导航栏透明的情况下
    //[self log:2];
    /*
     5s: 2.UIEdgeInsets = {64, 0, 0, 0}
     6p: 2.UIEdgeInsets = {64, 0, 0, 0}
     X:  2.UIEdgeInsets = {88, 0, 34, 0}
     XR: 2.UIEdgeInsets = {92, 0, 34, 0}
     */
    
    // 导航栏不透明时
    /*
     XR:
     self.view.frame = {{0, 92}, {414, 804}}
     2.UIEdgeInsets = {0, 0, 34, 0}
     */
    
    // 加上 Tabbar 后
    /*
     6P:
     self.view.frame = {{0, 64}, {414, 672}}
     2.UIEdgeInsets = {0, 0, 49, 0}
     
     X:
     self.view.frame = {{0, 88}, {375, 724}}
     2.UIEdgeInsets = {0, 0, 83, 0}
     
     XR:
     self.view.frame = {{0, 92}, {414, 804}}
     2.UIEdgeInsets = {0, 0, 83, 0}
     */
}

- (void)log:(NSInteger)idx
{
    NSLog(@"self.view.frame = %@", NSStringFromCGRect(self.view.frame));
    NSLog(@"%@.UIEdgeInsets = %@", @(idx), NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
}

@end
