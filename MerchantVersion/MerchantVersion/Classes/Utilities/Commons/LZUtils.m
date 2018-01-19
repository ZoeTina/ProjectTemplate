//
//  LZUtils.m
//  LZKit
//
//  Created by 寕小陌 on 2016/12/15.
//  Copyright © 2016年 寜小陌. All rights reserved.
//


/*********************************************
 ******
 ******        自定义公共的方法
 ******
 *********************************************/

#import "LZUtils.h"
#import <UIKit/UIKit.h>
@implementation LZUtils

/**
 *  加载tabelViewCell
 *
 *  @param tableViewCell tableViewCell
 *  @param index         第几个视图
 */
+ (UITableViewCell *) lz_loadCellNib:(UITableViewCell *) tableViewCell objectAtIndex:(NSUInteger)index{

    UITableViewCell *cell;
//    UITableViewCell *cell1= (tableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:tableViewCell owner:self options:nil]  objectAtIndex:index];
    return cell;
}

// 19.按照文字计算高度
- (void)lz_descHeightWithDesc:(NSString *)desc{
    
    CGRect rect = [desc boundingRectWithSize:CGSizeMake(240, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:@""} context:nil];
    //按照文字计算高度
    float textHeight = rect.size.height;
    YYLog(@"%f", textHeight);
//    CGRect frame = self.descLabel.frame;
//    frame.size.height = textHeight;
//    self.descLabel.frame = frame;
    
}

//图片转字符串
-(NSString *)lz_UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

//字符串转图片
-(UIImage *)lz_Base64StrToUIImage:(NSString *)_encodedImageStr
{
//    NSData *_decodedImageData   = [[NSData alloc] initWithBase64Encoding:_encodedImageStr];
    NSData *_decodedImageData   = [[NSData alloc] initWithBase64EncodedString:_encodedImageStr options:0];
    UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
    return _decodedImage;
}

/**
 *  设置UILabel背景透明
 *
 *  @param label 当前label
 *
 *  @return 设置后的label
 */
+ (UILabel *) lz_setLabelTransparent:(UILabel *) label{

    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.5f];
    label.layer.cornerRadius = 8;
    label.clipsToBounds = YES;
    
    return label;
}

#pragma mark - 读取plist的文件数据
//-------------------------------------------------------------------------------------------------------------------------------------------------
+ (NSArray *) lz_loadLocalResources :(NSString *) fileName
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
    NSString *paths = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *data = [NSArray arrayWithContentsOfFile:paths];
    
    return data;
}

#pragma mark --- 清除tableView多余分割线
//-------------------------------------------------------------------------------------------------------------------------------------------------
/** 清除tableView多余分割线 */
+ (UITableView *)lz_setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    return tableView;
}

/**
 *  生成图片
 *
 *  @param color  图片颜色
 *
 *  @return 生成的图片
 */
+ (UIImage *) lz_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);   //图片尺寸
    UIGraphicsBeginImageContext(rect.size);             //填充画笔
    CGContextRef context = UIGraphicsGetCurrentContext();//根据所传颜色绘制
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);                       //联系显示区域
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();// 得到图片信息
    UIGraphicsEndImageContext();//消除画笔
    
    return image;
}

/**
 *  设置公共按钮背景图(视频播放以及直播界面底部按钮)
 *
 *  @param button 需要设置的按钮
 *
 *  @return 返回已经设置好的内容
 */
+ (UIButton *) lz_setButtonWithBGImage :(UIButton *) button{

    button.tintColor = [UIColor whiteColor];
//    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button.layer.cornerRadius = 20.0;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:[LZUtils lz_imageWithColor:kColorWithRGB(143, 0, 7)] forState:UIControlStateNormal];
    [button setBackgroundImage:[LZUtils lz_imageWithColor:kColorWithRGB(143, 0, 7)] forState:UIControlStateHighlighted];
    return button;
}

/**
 *  11. 将十六进制颜色转换为 UIColor 对象
 *
 *  @param color 颜色值
 *
 *  @return 将十六进制颜色转换为 UIColor 对象
 */
+ (UIColor *)lz_colorWithHexString:(NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip "0X" or "#" if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark -- 标签自适应，测算高度
/**
 *  设置公共按钮背景图
 *
 *  @param text 文字内容
 *  @param font 文字字体
 *  @param maxW 最大宽度
 *
 *  @return 返回已经设置好的内容
 */
+ (CGSize)lz_sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW {
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = font;
    CGSize textSize = CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

/**
 *  时间戳转换为时间
 *
 *  @param timeString 时间戳
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_timeWithTimeIntervalString:(NSString *)timeString
{
    
    NSTimeInterval time = [timeString doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    YYLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString*currentDateStr = [dateFormatter stringFromDate:detaildate];
    YYLog(@"时间戳转换后的日期时间:%@",currentDateStr);
    return currentDateStr;
}

/**
 *  获取当前系统时间
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyy-MM-dd HH:mm:ss"];
    NSString*dateTime = [formatter stringFromDate:[NSDate date]];
    //    self.CurrentTime = dateTime;
    NSLog(@"当前时间是===%@",dateTime);
    return dateTime;
}

/**
 *  获取当前系统日期
 *
 *  @return 返回字符串格式时间
 */
+ (NSString*)lz_getCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSLog(@"当前日期===%@",dateTime);
    return dateTime;
}

/**
 *  获取当前时间的时间戳
 *
 *  @return 返回字符串格式时间
 */
+ (NSString*)lz_getCurrentTimestamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    NSLog(@"当前时间是时间戳===%@",timeString);
    
    return timeString;
}

/**
 *  据图片名将图片保存到ImageFile文件夹中
 *
 *  @param imageName 图片名称
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)lz_imageSavedPath :(NSString *) imageName{
    
    //获取Documents文件夹目录
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //获取文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //指定新建文件夹路径
    NSString *imageDocPath = [documentPath stringByAppendingPathComponent:@"ImageFile"];
    //创建ImageFile文件夹
    [fileManager createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    //返回保存图片的路径（图片保存在ImageFile文件夹下）
    NSString * imagePath = [imageDocPath stringByAppendingPathComponent:imageName];
    return imagePath;
    
}

/**
 *  解析编码格式
 *
 *  @param responseObject 解析的数据
 *
 *  @return 返回字符串格式
 */
+ (NSString *) lz_dataWithJSONObject:(NSDictionary *) responseObject{

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json  = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json;
}

/**
 *  将数字转换为 时、分、秒、
 *
 *  @param totalSeconds 时间转换
 *
 *  @return 返回字符串格式
 */
+ (NSString *)lz_timeFormatted:(int)totalSeconds {
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
//    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d",minutes, seconds];
}

/**
 *  设置searchBar的背景色使用的
 *
 *  @param size searchBar 的size
 *
 *  @return 返回设置好的图片
 */
+ (UIImage *)lz_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  银行卡字符串格式化
 *  参数 str 银行卡号
 */
+ (NSString *)lz_backCardOrFormatString:(NSString *) string{
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (string.length > 0) {
        NSString *subString = [string substringToIndex:MIN(string.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        string = [string substringFromIndex:MIN(string.length, 4)];
    }
    
    return newString;
}

/**
 *  银行卡字符串格式化星号显示
 *  参数 bankCard 银行卡号
 */
+ (NSString*) lz_bankCardToAsterisk:(NSString *) bankCard{
    

    // 后四位
    bankCard = [bankCard substringFromIndex:bankCard.length - 4];
    NSString *string = [NSString stringWithFormat:@"************%@",bankCard];
    
    return string;
}

/**
 *  获取当前的ViewController
 *
 *  @return 返回当前的ViewController
 */
- (UIViewController *)lz_getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        
        result = nextResponder;
    else
        
        result = window.rootViewController;
    return result;
}
@end
