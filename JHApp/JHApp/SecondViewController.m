//
//  SecondViewController.m
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 禁止左滑返回
    self.canSlideBack = NO;
    
    //self.navigationItem.title = @"第二个页面";
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 60);
    label.text = @"第二个页面，导航栏隐藏，无法左滑返回";
    label.textColor = [UIColor systemTealColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.center = CGPointMake(self.view.center.x, self.view.center.y - 70);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 62);
    button.backgroundColor = [UIColor systemPurpleColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"第三个页面" forState:0];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:1<<6];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 62);
    button.backgroundColor = [UIColor systemPinkColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"返回" forState:0];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button addTarget:self action:@selector(backAction) forControlEvents:1<<6];
    [self.view addSubview:button];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 70);
    }
}

- (void)buttonAction
{
    [self.navigationController pushViewController:[[ThirdViewController alloc] init] animated:YES];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
