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
    
    self.textField.frame = CGRectMake(20, 80, BAKit_SCREEN_WIDTH - 20 * 2, 30);
    self.textField1.frame = CGRectMake(20, _textField.bottom + 20, BAKit_SCREEN_WIDTH - 20 * 2, 30);
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

@end
