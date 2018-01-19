//
//  LZRootViewController.m
//  LZKit
//
//  Created by 寕小陌 on 2017/10/12.
//  Copyright © 2017年 寕小陌. All rights reserved.
//

#import "LZRootViewController.h"
#import "MVTestViewController.h"
#import "MVBViewController.h"
//#import "LZLiveViewController.h"
//#import "LZMineViewController.h"
//#import "LZSlidingCardViewController.h"

@interface LZRootViewController ()<UITabBarControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong, nonnull)NSArray *arrayTab;
@end

@implementation LZRootViewController

//APP生命周期中 只会执行一次
+ (void)initialize {
    
    // 默认字体颜色及选择字体颜色
    //-------------------------------------------------------------------------------------------------------------------------------------------------
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kTabBarColorNormal;
    
    
    NSMutableDictionary *selectedTextAttrs=[NSMutableDictionary dictionaryWithDictionary:textAttrs];
    selectedTextAttrs[NSForegroundColorAttributeName] = kTabBarColorSelected;
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lz_isJson = YES;
    // 添加所有子控制器
    [self addAllChildVc];
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildVc {
    
    if (_lz_isJson) {
        for (NSDictionary<NSString *, NSString *> *dicTab in self.arrayTab) {
            [self addChildVc:dicTab[@"controllerName"]
                       title:dicTab[@"title"]
                       image:dicTab[@"imageName"]
               selectedImage:dicTab[@"imageSelectName"]];
        }
    }else{
        MVTestViewController *vc1 = [[MVTestViewController alloc] init];
        MVBViewController *vc2 = [[MVBViewController alloc] init];
        UIViewController *vc3 = [[UIViewController alloc] init];
        UIViewController *vc4 = [[UIViewController alloc] init];
        UIViewController *vc5 = [[UIViewController alloc] init];

        [self addOneChildVC:vc1 title:@"消息" normalImageNamed:@"tab_messages_nor" selectedImageName:@"tab_messages_press"];
        [self addOneChildVC:vc2 title:@"通讯录" normalImageNamed:@"tab_groups_nor" selectedImageName:@"tab_groups_press"];
        [self addOneChildVC:vc3 title:@"发现" normalImageNamed:@"tab_dynamic_nor" selectedImageName:@"tab_dynamic_press"];
        [self addOneChildVC:vc4 title:@"Demo" normalImageNamed:@"tab_groups_nor" selectedImageName:@"tab_groups_press"];
        [self addOneChildVC:vc5 title:@"我" normalImageNamed:@"tab_me_nor" selectedImageName:@"tab_me_press"];
    }
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param normalImageNamed  图标
 *  @param selectedImageName 选中时的图标
 */

- (void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title normalImageNamed:(NSString *)normalImageNamed selectedImageName:(NSString *)selectedImageName {
    // 设置标题
    childVc.tabBarItem.title = title;
    childVc.title = title;
//    childVc.view.backgroundColor = kRandomColor;
    // 设置图标
    childVc.tabBarItem.image = [[UIImage imageNamed:normalImageNamed] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 声明显示图片的原始式样 不要渲染
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    childVc.tabBarItem.imageInsets = UIEdgeInsetsZero;
    
    // 3.设置文字的样式
    [self setTabBarItemTextColor:childVc];
    
    // 添加为tabbar控制器的子控制器
    LZNavigationController *navigation = [[LZNavigationController alloc] initWithRootViewController:childVc];
    navigation.isFullScreenPopGestureEnabled = YES;
    navigation.delegate = self;
    [self addChildViewController:navigation];
}

- (void) setTabBarItemTextColor:(UIViewController *)childVc{
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kTabBarColorNormal;
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    
    selectTextAttrs[NSForegroundColorAttributeName] = kTabBarColorSelected;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
}

#pragma mark - private methods 私有方法
/**
 *  1.添加一个子控制器
 *
 *  @param childName            子控制器名称
 *  @param title                标题
 *  @param normalImageNamed     图片
 *  @param selectedImageName    选中的图片
 */
- (void)addChildVc:(NSString *)childName title:(NSString *)title image:(NSString *)normalImageNamed selectedImage:(NSString *)selectedImageName
{
    // 1.设置子控制器的默认设置
    UIViewController *childVc = [NSClassFromString(childName) new];
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
//    [childVc.view setBackgroundColor:kRandomColor];
    
    // 2.设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:normalImageNamed] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 3.设置文字的样式
    [self setTabBarItemTextColor:childVc];
    
    // 4.先给外面传进来的小控制器 包装 一个导航控制器
    LZNavigationController *navigation = [[LZNavigationController alloc] initWithRootViewController:childVc];
    navigation.isFullScreenPopGestureEnabled = YES;
    // 5.添加为子控制器
    [self addChildViewController:navigation];
}

- (NSArray *)arrayTab
{
    if (!_arrayTab) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"LZRootView"
                                                         ofType:@"json"];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:path
                                                  options:NSDataReadingMappedIfSafe
                                                    error:nil];
        
        _arrayTab = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingMutableContainers
                                                      error:nil];
        
    }
    return _arrayTab;
}

- (void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
