//
//  ViewController.m
//  BATextField
//
//  Created by boai on 2017/6/17.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "ViewController.h"

#import "BATextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *textField;
@property(nonatomic, strong) UITextField *textField1;
@property(nonatomic, strong) UITextField *textField2;

@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"BATextField";
    self.view.backgroundColor = BAKit_Color_White_pod;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    self.label1.frame = CGRectMake(20, 80, BAKit_SCREEN_WIDTH - 20 * 2, 30);
    self.textField.frame = CGRectMake(20, self.label1.bottom + 20, BAKit_SCREEN_WIDTH - 20 * 2, 30);

    self.label2.frame = CGRectMake(20, self.textField.bottom + 20, BAKit_SCREEN_WIDTH - 20 * 2, 30);
    self.textField1.frame = CGRectMake(20, self.label2.bottom + 20, BAKit_SCREEN_WIDTH - 20 * 2, 30);

    self.label3.frame = CGRectMake(20, self.textField1.bottom + 20, BAKit_SCREEN_WIDTH - 20 * 2, 30);
    self.textField2.frame = CGRectMake(20, self.label3.bottom + 20, BAKit_SCREEN_WIDTH - 20 * 2, 30);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [_textField1 ba_textFieldHistoryArrayHide];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (_textField1 == textField)
    {
        // 当开始编辑的时候，显示 历史数据
        [_textField1 ba_textFieldHistoryArrayShow];
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (_textField1 == textField)
    {
        // 点击 return，一定要记得 同步数据
        [_textField1 ba_textFieldHistoryArraySynchronize];
        
        // 同步完数据后，记得隐藏 历史数据
        [_textField1 ba_textFieldHistoryArrayHide];
        _textField1.text = nil;
        [_textField1 resignFirstResponder];
        return YES;
    }
    return NO;
}

#pragma mark - setter / getter

- (UITextField *)textField
{
    if (!_textField)
    {
        _textField = [UITextField new];
        _textField.placeholder = @"这里是 placeholder！限制最大位数：6！";
        _textField.backgroundColor = BAKit_Color_Gray_11_pod;
        
        // placeholder：文字颜色
        _textField.ba_placeholderColor = BAKit_Color_Green_pod;
        // placeholder：文字字体
        _textField.ba_placeholderFont = [UIFont systemFontOfSize:11];
        // 限制最大输入长度
        _textField.ba_maxLength = 6;
        
        [self.view addSubview:_textField];
    }
    return _textField;
}

- (UITextField *)textField1
{
    if (!_textField1)
    {
        _textField1 = [UITextField new];
        _textField1.placeholder = @"点击 return 后，可以保存输入历史！【限制输入11位】";
        _textField1.backgroundColor = BAKit_Color_Gray_11_pod;
        _textField1.delegate = self;
        
        // placeholder：文字颜色，默认：黑色
        _textField1.ba_placeholderColor = BAKit_Color_Orange_pod;
        // placeholder：文字字体
        _textField1.ba_placeholderFont = [UIFont boldSystemFontOfSize:13];
        // 限制最大输入长度
        _textField1.ba_maxLength = 11;
        // textFieldID：识别 ID，要用到历史记录，请务必添加
        _textField1.ba_textFieldID = @"user_account";
        
        // clearButton 标题，默认：清楚历史内容
        _textField1.ba_clearButtonTitle = @"clear";
        // clearButton 标题颜色，默认：[[UIColor blueColor] colorWithAlphaComponent:0.5f]
        _textField1.ba_clearButtonTitleColor = BAKit_Color_Green_pod;
        
        [self.view addSubview:_textField1];
    }
    return _textField1;
}

- (UITextField *)textField2
{
    if (!_textField2)
    {
        _textField2 = [UITextField new];
        _textField2.placeholder = @"限制输入小数点后 2 位！";
        _textField2.backgroundColor = BAKit_Color_Gray_11_pod;
        _textField2.keyboardType = UIKeyboardTypeDecimalPad;
        
        // placeholder：文字颜色，默认：黑色
//        _textField2.ba_placeholderColor = BAKit_Color_Orange_pod;
        // placeholder：文字字体
//        _textField2.ba_placeholderFont = [UIFont boldSystemFontOfSize:13];
        // 限制最大输入长度
//        _textField2.ba_maxLength = 11;

        // 先设置 _textField2 的代理
        [_textField2 ba_textField_setDelegate:_textField2];
        // 再设置小数点后的位数，如果不使用 ba_maxDecimalPointNumber ，请务必删除 上面的代理，以免出现其他异常
        _textField2.ba_maxDecimalPointNumber = 2;
        // 设置首位数是否可以为 0，默认：NO
        _textField2.ba_isFirstNumberZero = YES;
        
        [self.view addSubview:_textField2];
    }
    return _textField2;
}

- (UILabel *)label1
{
    if (!_label1)
    {
        NSString *msg = @"1、自定义 placeholder 字体和颜色，限制最大位数为 6 位！";
        _label1 = [self ba_addLabelWithMsg:msg];
        
        [self.view addSubview:_label1];
    }
    return _label1;
}

- (UILabel *)label2
{
    if (!_label2)
    {
        NSString *msg = @"2、点击 return 后，可以保存输入历史，限制最大位数为 6 位！";
        _label2 = [self ba_addLabelWithMsg:msg];
        
        [self.view addSubview:_label2];
    }
    return _label2;
}

- (UILabel *)label3
{
    if (!_label3)
    {
        NSString *msg = @"3、限制输入小数点后 N 位数，首字母是否可以为0";
        _label3 = [self ba_addLabelWithMsg:msg];
        
        [self.view addSubview:_label3];
    }
    return _label3;
}

- (UILabel *)ba_addLabelWithMsg:(NSString *)msg
{
    UILabel *label = [UILabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:11];
    
    return label;
}

@end
