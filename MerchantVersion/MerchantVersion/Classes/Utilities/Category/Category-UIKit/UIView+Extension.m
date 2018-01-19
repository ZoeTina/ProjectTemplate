//
//  UIView+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/9.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setLz_x:(CGFloat)lz_x{
    CGRect frame = self.frame;
    frame.origin.x = lz_x;
    self.frame = frame;
}

- (CGFloat)lz_x {
    return self.frame.origin.x;
}

- (void)setLz_y:(CGFloat)lz_y {
    CGRect frame = self.frame;
    frame.origin.y = lz_y;
    self.frame = frame;
}

- (CGFloat)lz_y {
    return self.frame.origin.y;
}

- (void)setLz_width:(CGFloat)lz_width {
    CGRect frame = self.frame;
    frame.size.width = lz_width;
    self.frame = frame;
}

- (CGFloat)lz_width {
    return self.frame.size.width;
}

- (void)setLz_height:(CGFloat)lz_height {
    CGRect frame = self.frame;
    frame.size.height = lz_height;
    self.frame = frame;
}

- (CGFloat)lz_height {
    return self.frame.size.height;
}

- (void)setLz_size:(CGSize)lz_size {
    //    self.lz_width = size.width;
    //    self.lz_height = size.height;
    CGRect frame = self.frame;
    frame.size = lz_size;
    self.frame = frame;
}

- (CGSize)lz_size {
    return self.frame.size;
}

- (void)setLz_origin:(CGPoint)lz_origin {
    CGRect frame = self.frame;
    frame.origin = lz_origin;
    self.frame = frame;
}

- (CGPoint)lz_origin {
    return self.frame.origin;
}

- (void)setLz_centerX:(CGFloat)lz_centerX {
    CGPoint center = self.center;
    center.x = lz_centerX;
    self.center = center;
}

- (CGFloat)lz_centerX {
    return self.center.x;
}

- (void)setLz_centerY:(CGFloat)lz_centerY {
    CGPoint center = self.center;
    center.y = lz_centerY;
    self.center = center;
}

- (CGFloat)lz_centerY {
    return self.center.y;
}


- (CGFloat)lz_left {
    return self.frame.origin.x;
}

- (void)setLz_left:(CGFloat)lz_left {

    CGRect frame = self.frame;
    frame.origin.x = lz_left;
    self.frame = frame;
}

- (CGFloat)lz_top {
    return self.frame.origin.y;
}

- (void)setLz_top:(CGFloat)lz_top {
    CGRect frame = self.frame;
    frame.origin.y = lz_top;
    self.frame = frame;
}

- (CGFloat)lz_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLz_right:(CGFloat)lz_right {
    CGRect frame = self.frame;
    frame.origin.x = lz_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)lz_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLz_bottom:(CGFloat)lz_bottom {
    CGRect frame = self.frame;
    frame.origin.y = lz_bottom - frame.size.height;
    self.frame = frame;
}

- (CGPoint)lz_viewOrigin {
    
    return self.frame.origin;
}

- (void)setLz_viewOrigin:(CGPoint)lz_viewOrigin {
    
    CGRect frame = self.frame;
    frame.origin = lz_viewOrigin;
    self.frame   = frame;
}

- (CGSize)lz_viewSize {
    
    return self.frame.size;
}

- (void)setLz_viewSize:(CGSize)lz_viewSize {
    CGRect frame = self.frame;
    frame.size   = lz_viewSize;
    self.frame   = frame;
}

- (CGFloat)lz_middleX {
    
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)lz_middleY {
    
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)lz_middlePoint {
    
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}

- (void)lz_addTarget:(nonnull id)target action:(nonnull SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

#pragma mark - 截屏
- (UIImage *)lz_capturedImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    UIImage *result = nil;
    if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    return result;
}

+ (nullable instancetype)lz_viewWithColor:(nonnull UIColor *)color {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}

- (BOOL)lz_isShowingOnKeyWindow
{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

@end


/**
 *    创建View使用的
 */
@implementation UIView (Extensions)

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame backgroundColor:(UIColor * _Nonnull)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view setBackgroundColor:backgroundColor];
    
    return view;
}

- (void)lz_createBordersWithColor:(UIColor * _Nonnull)color withCornerRadius:(CGFloat)radius andWidth:(CGFloat)width {
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.layer.shouldRasterize = NO;
    self.layer.rasterizationScale = 2;
    self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGColorRef cgColor = [color CGColor];
    self.layer.borderColor = cgColor;
    CGColorSpaceRelease(space);
}

- (void)lz_removeBorders {
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor = nil;
}



- (void)lz_createRectShadowWithOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.masksToBounds = NO;
}

- (void)lz_createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shouldRasterize = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:cornerRadius] CGPath];
    self.layer.masksToBounds = NO;
}

- (void)lz_removeShadow {
    [self.layer setShadowColor:[[UIColor clearColor] CGColor]];
    [self.layer setShadowOpacity:0.0f];
    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
}

- (void)lz_setCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    [self.layer setMasksToBounds:YES];
}

- (void)lz_shakeView {
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shake.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)], [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    shake.autoreverses = YES;
    shake.repeatCount = 2.0f;
    shake.duration = 0.07f;
    
    [self.layer addAnimation:shake forKey:@"shake"];
}

- (void)lz_pulseViewWithDuration:(CGFloat)duration {
    [UIView animateWithDuration:duration / 6 animations:^{
        [self setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:duration / 6 animations:^{
                [self setTransform:CGAffineTransformMakeScale(0.96, 0.96)];
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:duration / 6 animations:^{
                        [self setTransform:CGAffineTransformMakeScale(1.03, 1.03)];
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [UIView animateWithDuration:duration / 6 animations:^{
                                [self setTransform:CGAffineTransformMakeScale(0.985, 0.985)];
                            } completion:^(BOOL finished) {
                                if (finished) {
                                    [UIView animateWithDuration:duration / 6 animations:^{
                                        [self setTransform:CGAffineTransformMakeScale(1.007, 1.007)];
                                    } completion:^(BOOL finished) {
                                        if (finished) {
                                            [UIView animateWithDuration:duration / 6 animations:^{
                                                [self setTransform:CGAffineTransformMakeScale(1, 1)];
                                            } completion:nil];
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];
}

- (void)lz_heartbeatViewWithDuration:(CGFloat)duration {
    float maxSize = 1.4f, durationPerBeat = 0.5f;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D scale2 = CATransform3DMakeScale(maxSize, maxSize, 1);
    CATransform3D scale3 = CATransform3DMakeScale(maxSize - 0.3f, maxSize - 0.3f, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:scale1], [NSValue valueWithCATransform3D:scale2], [NSValue valueWithCATransform3D:scale3], [NSValue valueWithCATransform3D:scale4], nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.05], [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.6], [NSNumber numberWithFloat:1.0], nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.duration = durationPerBeat;
    animation.repeatCount = duration / durationPerBeat;
    
    [self.layer addAnimation:animation forKey:@"heartbeat"];
}

- (void)lz_applyMotionEffects {
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-10.0f);
    horizontalEffect.maximumRelativeValue = @(10.0f);
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-10.0f);
    verticalEffect.maximumRelativeValue = @(10.0f);
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    [self addMotionEffect:motionEffectGroup];
}





- (UIImage * _Nonnull)lz_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(image);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

- (UIImage * _Nonnull)lz_saveScreenshot {
    UIImage *image = [self lz_screenshot];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
}

- (void)lz_removeAllSubviews {
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

// 获取指定视图在window中的位置
+ (CGRect)lz_getFrameInWindow:(UIView *)view
{
    // 改用[UIApplication sharedApplication].keyWindow.rootViewController.view，防止present新viewController坐标转换不准问题
    return [view.superview convertRect:view.frame toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
}

@end
