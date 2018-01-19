//
//  UIControl+Extension.m
//  LZExtension
//
//  Created by 寕小陌 寕小陌 2017/10/27.
//  Copyright © 2017年 寕小陌. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/message.h>

static char actionkey;
static char timerkey;

@interface  UIControl()

/** 防止重复点击间隔 */
@property (nonatomic, assign) NSTimeInterval adAcceptEventInterval;

@end

@implementation UIControl (Extension)

- (void)addAction:(LZAction)action forControlEvents:(UIControlEvents)UIControlEvents{
    if ([self clickInterval]) {
        objc_setAssociatedObject(self, &actionkey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(intervalCallClick:) forControlEvents:UIControlEvents];
    }
}

- (void)addIntervalAction:(double)seconds withAction:(LZAction)action{
    if ([self clickInterval]) {
        [self addTarget:self action:@selector(intervalCallClick:) forControlEvents:UIControlEventTouchDown];
        objc_setAssociatedObject(self, &actionkey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, &timerkey, [[NSNumber alloc]initWithDouble:seconds], OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

//判断点击间隔
- (BOOL)clickInterval{
    if (self.adAcceptEventInterval <= 0) {
        // 点击间隔设为.4秒
        self.adAcceptEventInterval = .2;
    }
    
    // 是否小于设定的时间间隔
    BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.adAcceptEventTime >= self.adAcceptEventInterval);
    
    // 更新上一次点击时间戳
    if (self.adAcceptEventInterval > 0) {
        self.adAcceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    // 两次点击的时间间隔小于设定的时间间隔时，才执行响应事件
    if (needSendAction) {
        return YES;
    }else{
        return NO;
    }
}

- (void)intervalCallClick:(UIButton *)sender{
    NSNumber *seconds = objc_getAssociatedObject(self, &timerkey);
    LZAction action = objc_getAssociatedObject(self, &actionkey);
    action();
    if (seconds!=nil) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, [seconds doubleValue] * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if (self.isTouchInside) {
                [self intervalCallClick:nil];
            }
        });
    }
}

- (NSTimeInterval )adAcceptEventInterval{
    return [objc_getAssociatedObject(self, "UIControl_acceptEventInterval") doubleValue];
}

- (void)setAdAcceptEventInterval:(NSTimeInterval)adAcceptEventInterval{
    objc_setAssociatedObject(self, "UIControl_acceptEventInterval", @(adAcceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )adAcceptEventTime{
    return [objc_getAssociatedObject(self, "UIControl_acceptEventTime") doubleValue];
}

- (void)setAdAcceptEventTime:(NSTimeInterval)adAcceptEventTime{
    objc_setAssociatedObject(self, "UIControl_acceptEventTime", @(adAcceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dealloc{
    NSLog(@"LZControlDealloc");
}

@end
