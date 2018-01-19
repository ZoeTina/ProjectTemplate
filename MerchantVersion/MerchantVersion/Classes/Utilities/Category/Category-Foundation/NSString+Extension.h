//
//  NSString+Extension.h
//  LZExtension
//
//  Created by 寕小陌 on 2016/12/12.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  此分类增加了一些关于NSString的有用方法
 */
@interface NSString (Extension)
/**
 判断字符串是否为空
 
 @return YES非空，NO空
 */
- (BOOL)lz_isNotBlank;
/**
 判断字符串是否为空
 
 @return YES空，NO非空
 */
- (BOOL)lz_isBlank;
/**
 判断字符串是否为空
 
 @param string 判断的字符串
 
 @return YES非空，NO空
 */
+ (BOOL)lz_isNotBlankString:(NSString * _Nullable)string;

/**
 判断字符串是否为空
 
 @param string 判断的字符串
 
 @return YES空，NO非空
 */
+ (BOOL) lz_isBlankString:(NSString *_Nonnull)string;
///**
// *身份证验证
// */
//- (BOOL)validateIdentityCard;
/** 判断字段是否包含空格 */
- (BOOL)lz_validateContainsSpace;

/** 根据生日返回年龄 */
- (NSString *_Nonnull)lz_ageFromBirthday;

/** 根据身份证返回岁数 */
- (NSString *_Nonnull)lz_ageFromIDCard;

/** 根据身份证返回生日 */
- (NSString *_Nonnull)lz_birthdayFromIDCard;

/** 根据身份证返回性别 */
- (NSString *_Nonnull)lz_sexFromIDCard;

/** 正则有效的邮箱 */
- (BOOL) lz_isValidEmail;

/** 正则有效的字母数字密码 */
- (BOOL) lz_isValidAlphaNumberPassword;

/** 正则检测有效身份证(15位) */
- (BOOL) lz_isValidIdentifyFifteen;

/** 正则检测有效身份证(18位) */
- (BOOL) lz_isValidIdentifyEighteen;

/** 正则是否为纯数字 */
- (BOOL) lz_isOnlyNumber;

/** 正则检查给出的字符串是否是邮件地址
 *
 *  @param email 被检查的字符串
 *
 *  @return YES是，NO不是
 */
- (BOOL)lz_isEmail:(NSString * _Nonnull)email;

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)lz_sizeWithFont:(UIFont *_Nonnull)font maxSize:(CGSize)maxSize;
/** 字符串金额转换 */
+ (NSString *_Nonnull)lz_stringWithMoneyAmount:(double)amount;

- (BOOL)lz_isEmptyString;

/** 拼接了`文档目录`的全路径 */ 
@property (nullable, nonatomic, readonly) NSString *lz_documentDirectory;
/** 拼接了`缓存目录`的全路径 */
@property (nullable, nonatomic, readonly) NSString *lz_cacheDirecotry;
/** 拼接了临时目录的全路径 */
@property (nullable, nonatomic, readonly) NSString *lz_tmpDirectory;

/** 电话号码中间4位****显示 */
+ (NSString * _Nonnull) lz_getSecrectStringWithPhoneNumber:(NSString * _Nonnull)phoneNum;

/** 银行卡号中间8位**** ****显示 */
+ (NSString * _Nonnull) lz_getSecrectStringWithAccountNo:(NSString * _Nonnull)accountNo;

/** BASE 64 编码的字符串内容 */
@property(nullable, nonatomic, readonly) NSString *lz_base64encode;
/** BASE 64 解码的字符串内容 */
@property(nullable, nonatomic, readonly) NSString *lz_base64decode;

#pragma mark - 字符串与时间戳之间的相互转换处理
/** 通过时间戳计算时间差（几小时前、几天前） */
+ (NSString * _Nonnull) lz_compareCurrentTime:(NSTimeInterval) compareDate;
/** 通过时间戳通过开始时间和结束计算时间差（几小时前、几天前） */
+ (NSString * _Nonnull) lz_stringIntervalFrom:(NSDate *_Nonnull)startTime to:(NSDate *_Nonnull)endTime;
/** 通过时间戳得出显示时间 */
+ (NSString * _Nonnull) lz_getDateStringWithTimestamp:(NSTimeInterval)timestamp;
/**
 * 通过时间戳和格式显示时间
 * 参数1: 时间戳
 * 参数2: 时间格式 例:@"yyyy-MM-dd HH:mm:ss",@"yyyy/MM/dd",@"yyyy-MM-dd HH:mm",@"MM-dd HH:mm"
 */
+ (NSString * _Nonnull) lz_getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString *_Nonnull)formatter;

#pragma mark - 字符串的各种处理

/**
 *  在指定的字符串中按照开始字符和结束字符获取子字符串
 *  如:"This is a test" with start char 'h' and end char 't' will return "is is a "
 *
 *  @param string 被搜索的字符串
 *  @param start  开始字符
 *  @param end    结束字符
 *
 *  @return 返回子字符串
 */
+ (NSString * _Nonnull)lz_searchInString:(NSString *_Nonnull)string
                               charStart:(char)start
                                 charEnd:(char)end;

/**
 *  在字符串本身中按照开始字符和结束字符获取子字符串
 *  如: "This is a test" with start char 'h' and end char 't' will return "is is a "
 *
 *  @param start  开始字符
 *  @param end    结束字符
 *
 *  @return 返回子字符串
 */
- (NSString * _Nonnull)lz_searchCharStart:(char)start
                                  charEnd:(char)end;

/**
 *  返回给出字符的索引值(注:返回第一次被找到字符的索引值)
 *
 *  @param character 被搜索的字符
 *
 *  @return 返回被搜索字符的索引值，如果找不到返回-1
 */
- (NSInteger) lz_indexOfCharacter:(char)character;

/**
 *  截取一段从指定字符至末尾的子字符串(注：以找到的第一个字符索引位置开始)
 *
 *  @param character 指定字符
 *
 *  @return 返回从指定字符至末尾的子字符串
 */
- (NSString * _Nonnull) lz_substringFromCharacter:(char)character;

/**
 *  截取一段从头至指定字符的子字符串(注：以找到的第一个字符索引位置开始)
 *
 *  @param character 指定字符
 *
 *  @return 返回从头至指定字符的子字符串
 */
- (NSString * _Nonnull)lz_substringToCharacter:(char)character;

/**
 *  在高敏感度下检查自身是否包含指定的子字符串(区分大小写)
 *
 *  @param substring 被检查的子字符串
 *
 *  @return YES包含，NO不包含
 */
- (BOOL)lz_hasString:(NSString * _Nonnull)substring;

/**
 *  在指定敏感度下检查自身是否包含自定的子字符串
 *
 *  @param substring     被检查的子字符串
 *  @param caseSensitive YES高敏感度(区分大小写),NO低敏感度(不区分大小写)
 *
 *  @return YES包含，NO不包含
 */
- (BOOL)lz_hasString:(NSString * _Nonnull)substring
       caseSensitive:(BOOL)caseSensitive;

/**
 *  将指定的字符串转换为data数据
 *
 *  @param string 需要转换的字符串
 *
 *  @return 返回转换得到的data数据
 */
+ (NSData * _Nonnull) lz_convertToNSData:(NSString * _Nonnull)string;

/**
 *  转换自身为data数据
 *
 *  @return 返回转换得到的data数据
 */
- (NSData * _Nonnull) lz_convertToNSData;

/**
 *  将指定字符串转换为句首大写的标准语法
 *  如: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"
 *
 *  @return 返回句首大写的字符串
 */
- (NSString * _Nonnull) lz_sentenceCapitalizedString;

/**
 *  将时间戳转换为人类易于识别的字符串
 *
 *  @return 返回人类易于识别的字符串
 */
- (NSString * _Nonnull) lz_dateFromTimestamp;

/**
 *  创建一个UUID字符串
 *
 *  @return 返回被创建的UUID字符串
 */
+ (NSString * _Nonnull) lz_generateUUID;

/**
 *  判断此UUID是否可用
 *
 *  @return YES可用，NO不可用
 */
- (BOOL) lz_isUUID;

/**
 *  判断此UUID对APNS是否可用
 *
 *  @return YES可用，NO不可用
 */
- (BOOL) lz_isUUIDForAPNS;

/**
 *  将自身转换为一个对APNS可用的UUID(No "<>" or "-" or spaces)
 *
 *  @return 返回对APNS可用的UUID(No "<>" or "-" or spaces)
 */
- (NSString * _Nonnull) lz_convertToAPNSUUID;

#pragma mark - 散列函数 Hash

/**
 *  计算MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 -s "string"
 *  @endcode
 *
 *  <p>提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。<p>
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *_Nullable)lz_md5String;

#pragma mark - TODO:

#pragma mark - 判断字符串宽高
/**
 *  根据提供的最大width和font计算文本占用的高
 *
 *  @param width 文本的最大宽
 *  @param font  文本字体大小
 *
 *  @return 返回计算出的文本占用高
 */
- (CGFloat)lz_sizeWithFont:(UIFont * _Nonnull)font
                  maxWidth:(float)width;
@end
