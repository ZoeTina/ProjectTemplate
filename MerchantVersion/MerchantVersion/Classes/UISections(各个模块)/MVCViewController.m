//
//  MVCViewController.m
//  MerchantVersion
//
//  Created by 寜小陌 on 2018/1/18.
//  Copyright © 2018年 寜小陌. All rights reserved.
//

#import "MVCViewController.h"

@interface MVCViewController ()

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"C";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 64, kScreenWidth, 30);
    [button setTitle:@"我是页面C-继续Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTapNextButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *buttonX = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonX.frame = CGRectMake(0, button.lz_y+50, kScreenWidth, 30);
    [buttonX setTitle:@"我是页面C-返回上一页" forState:UIControlStateNormal];
    [buttonX addTarget:self action:@selector(didTapPopButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonX];
    
    
    UIButton *buttonY = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonY.frame = CGRectMake(0, buttonX.lz_y+50, kScreenWidth, 30);
    [buttonY setTitle:@"我是页面C-返回指定控制器(默认返回第三个控制器)" forState:UIControlStateNormal];
    [buttonY addTarget:self action:@selector(didTapPopToButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonY];
    
    
    UIButton *buttonZ = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonZ.frame = CGRectMake(0, buttonY.lz_y+50, kScreenWidth, 30);
    [buttonZ setTitle:@"我是页面C-返回跟控制器" forState:UIControlStateNormal];
    [buttonZ addTarget:self action:@selector(didTapPopToRootButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonZ];
}

- (void)didTapNextButton:(UIButton *)sender {
    MVCViewController *vc = [[MVCViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) didTapPopButton:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapPopToButton:(id)sender {

    NSInteger idx = self.lz_navigationController.lz_viewControllers.count;
    if (idx <= 3) {
        [self lz_make:@"当前控制器数小于指定返回控制器的数"];
    }else{
        [self.navigationController popToViewController:self.lz_navigationController.lz_viewControllers[2] animated:YES];
    }
}

- (IBAction)didTapPopToRootButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
