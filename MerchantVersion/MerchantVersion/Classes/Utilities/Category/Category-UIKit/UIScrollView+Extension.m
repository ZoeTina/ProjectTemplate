//
//  UIScrollView+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "UIScrollView+Extension.h"

@implementation UIScrollView (Extension)

+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame contentSize:(CGSize)contentSize clipsToBounds:(BOOL)clipsToBounds pagingEnabled:(BOOL)pagingEnabled showScrollIndicators:(BOOL)showScrollIndicators delegate:(id<UIScrollViewDelegate> _Nullable)delegate {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [scrollView setDelegate:delegate];
    [scrollView setPagingEnabled:pagingEnabled];
    [scrollView setClipsToBounds:clipsToBounds];
    [scrollView setShowsVerticalScrollIndicator:showScrollIndicators];
    [scrollView setShowsHorizontalScrollIndicator:showScrollIndicators];
    [scrollView setContentSize:contentSize];
    
    return scrollView;
}

@end
