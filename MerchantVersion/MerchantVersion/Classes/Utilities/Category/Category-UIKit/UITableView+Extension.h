//
//  UITableView+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此分类增加了一些关于UITableView的有用方法
 */
@interface UITableView (Extension)

/**
 *  快速创建一个UITableView并且设置一些属性
 *
 *  @param frame              TableView的rame
 *  @param style              TableView的样式
 *  @param cellSeparatorStyle Cell分割线样式
 *  @param separatorInset     Cell分割线内切
 *  @param isIndicator        是否显示滚动条
 *  @param dataSource         TableView的数据源
 *  @param delegate           TableView的代理
 *
 *  @return 返回创建的UITableView实例
 */
+ (instancetype _Nonnull)lz_initWithFrame:(CGRect)frame
                                    style:(UITableViewStyle)style
                       cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle
                           separatorInset:(UIEdgeInsets)separatorInset
             showsVerticalScrollIndicator:(BOOL)isIndicator
                               dataSource:(id <UITableViewDataSource> _Nullable)dataSource
                                 delegate:(id <UITableViewDelegate> _Nullable)delegate;

/**
 *  获取指定组的所有索引路径
 *
 *  @param section 指定组
 *
 *  @return 返回一个包含所以索引路径的数组
 */
- (NSArray * _Nonnull)lz_getIndexPathsForSection:(NSUInteger)section;

/**
 *  在指定组中获取指定行的下一个索引路径
 *
 *  @param row     指定行的索引路径
 *  @param section 指定组的索引路径
 *
 *  @return 返回下一个索引路径
 */
- (NSIndexPath * _Nonnull)lz_getNextIndexPath:(NSUInteger)row
                                   forSection:(NSUInteger)section;


/**
 *  在指定组中获取指定行的上一个索引路径
 *
 *  @param row     指定行的索引路径
 *  @param section 指定组的索引路径
 *
 *  @return 返回上一个索引路径
 */
- (NSIndexPath * _Nonnull)lz_getPreviousIndexPath:(NSUInteger)row
                                       forSection:(NSUInteger)section;


@end
