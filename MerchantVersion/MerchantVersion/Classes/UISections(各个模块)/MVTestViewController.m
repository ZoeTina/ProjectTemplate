//
//  MVTestViewController.m
//  MerchantVersion
//
//  Created by 寜小陌 on 2018/1/18.
//  Copyright © 2018年 寜小陌. All rights reserved.
//

#import "MVTestViewController.h"
#import "MVBViewController.h"

@interface MVTestViewController ()

@end

@implementation MVTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 64, kScreenWidth, 30);
    [button setTitle:@"我是Test页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void) didOnClick:(UIButton *) sender{
    MVBViewController *vc = [[MVBViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
