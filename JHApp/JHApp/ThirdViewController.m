//
//  ThirdViewController.m
//  JHApp
//
//  Created by HaoCold on 2023/2/7.
//

#import "ThirdViewController.h"
#import "ForthViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"第三个页面";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 62);
    button.backgroundColor = [UIColor systemPurpleColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"第四个页面" forState:0];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:1<<6];
    [self.view addSubview:button];
    button.center = self.view.center;
}

- (void)buttonAction
{
    [self.navigationController pushViewController:[[ForthViewController alloc] init] animated:YES];
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
