
/*!
 *  @header BAKit.h
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright  Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用 BAKit 的过程中如果出现 bug 请及时以以下任意一种方式联系我，我会及时修复 bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * BAHome : https://github.com/BAHome
 * 博客    : http://boaihome.com
 
 *********************************************************************************
 
 */


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^BAKit_textFieldDidEndEditingBlock)(UITextField *textField);

@interface UITextField (BAKit)<UITextViewDelegate>

@property(nonatomic, copy) BAKit_textFieldDidEndEditingBlock textFieldDidEndEditingBlock;

/**
 UITextField：placeholder：文字颜色，默认：黑色
 */
@property(nonatomic, strong) UIColor *ba_placeholderColor;

/**
 UITextField：placeholder：文字字体
 */
@property(nonatomic, strong) UIFont *ba_placeholderFont;

/**
 UITextField：限制最大输入长度
 */
@property(nonatomic, assign) NSInteger ba_maxLength;

/**
 UITextField：小数点后的最大位数，默认：无，
 注意：如果需要使用此方法，键盘默认为 UIKeyboardTypeDecimalPad，请务必遵循两步：
 // 先设置 _textField2 的代理
 [_textField2 ba_textField_setDelegate:_textField2];
 // 再设置小数点后的位数，如果不使用 ba_maxDecimalPointNumber ，请务必删除 上面的代理，以免出现其他异常
 _textField2.ba_maxDecimalPointNumber = 2;
 */
@property(nonatomic, assign) NSInteger ba_maxDecimalPointNumber;

/**
 UITextField：是否包含小数点，默认：NO
 */
@property(nonatomic, assign) BOOL ba_isHaveDecimalPoint;

/**
 UITextField：首位数是否可以为 0，默认：NO
 */
@property(nonatomic, assign) BOOL ba_isFirstNumberZero;


/**
 UITextField：首先设置代理

 @param delegate delegate description
 */
- (void)ba_textField_setDelegate:(id<UITextViewDelegate>)delegate;

/**
 UITextField：判断 UITextField 输入的内容是否为空
 
 @return YES，NO
 */
- (BOOL)ba_textField_isEmpty;

/**
 UITextField：选中所有文字
 */
- (void)ba_textField_selectAllText;

/**
 UITextField：当前选中的字符串范围

 @return NSRange
 */
- (NSRange)ba_textField_selectedRange;

/**
 UITextField：选中指定范围的文字

 @param range NSRange 范围
 */
- (void)ba_textField_setSelectedRange:(NSRange)range;

@end
