//
//  MVAViewController.m
//  MerchantVersion
//
//  Created by 寜小陌 on 2018/1/19.
//  Copyright © 2018年 寜小陌. All rights reserved.
//

#import "MVAViewController.h"
#import "MVDViewController.h"

@interface MVAViewController ()

@end

@implementation MVAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"A";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 64, kScreenWidth, 30);
    [button setTitle:@"我是页面A" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back_copy"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(didTapPopButton:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.navigationBarHidden = NO;
}

- (void) didOnClick:(UIButton *) sender{
    MVDViewController *vc = [[MVDViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
    


- (void) didTapPopButton:(UIBarButtonItem *)barButtonItem{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapPopToButton:(id)sender {
    [self.navigationController popToViewController:self.lz_navigationController.lz_viewControllers[0] animated:YES];
}

- (IBAction)didTapPopToRootButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
