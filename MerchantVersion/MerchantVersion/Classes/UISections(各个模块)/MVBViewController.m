//
//  MVBViewController.m
//  MerchantVersion
//
//  Created by 寜小陌 on 2018/1/18.
//  Copyright © 2018年 寜小陌. All rights reserved.
//

#import "MVBViewController.h"
#import "MVCViewController.h"

@interface MVBViewController ()

@end

@implementation MVBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"B";
//    self.view.backgroundColor = kColorWithRGB(211, 211, 211);
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 64, kScreenWidth, 30);
    [button setTitleColor:kColorWithRGB(211, 0, 0) forState:UIControlStateNormal];
    /// 后面用selected指的是按钮被点击后 被选择标题的颜色
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    
    [button setTitle:@"我是B页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void) didOnClick:(UIButton *) sender{
    MVCViewController *vc = [[MVCViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
