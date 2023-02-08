//
//  ForthViewController.m
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import "ForthViewController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationItem.title = @"第四个页面";
    
    // 可以左滑返回
    // self.canSlideBack = YES; // 默认就是 YES
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 60);
    label.text = @"第四个页面，导航栏隐藏，可以左滑返回";
    label.textColor = [UIColor systemTealColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.center = self.view.center;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
