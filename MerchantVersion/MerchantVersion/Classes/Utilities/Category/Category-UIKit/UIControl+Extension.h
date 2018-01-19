//
//  UIControl+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2017/10/27.
//  Copyright © 2017年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LZAction)(void);

///////// 使用方式 /////////
/**************************************
 
 [self.singleClickButton addAction:^{
     YYLog(@"单击");
 } forControlEvents:UIControlEventTouchUpInside];
 
 __weak __typeof(self) weakSelf = self;
 [self.multipleTriggerButton addIntervalAction:0.3 withAction:^{
     weakSelf.num++;
     YYLog(@"%d",weakSelf.num);
 }];
 
 ***************************************/
@interface UIControl (Extension)

//单击
- (void)addAction:(LZAction)action forControlEvents:(UIControlEvents)UIControlEvents;

//按住按钮的时候根据设置的间隔秒，不断触发点击事件
- (void)addIntervalAction:(double)seconds withAction:(LZAction)action;
@end
