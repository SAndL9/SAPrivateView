//
//  LLTextFieldViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 9/2/18.
//  Copyright © 2018年 SAndL9. All rights reserved.
//

#import "LLTextFieldViewController.h"
#import "UITextField+NumberFormat.h"
@interface LLTextFieldViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textBankNumber;
@end

@implementation LLTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self textBankNumber];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return [UITextField inputTextField:textField
         shouldChangeCharactersInRange:range
                     replacementString:string
                        blankLocations:@[@4,@9,@14,@19,@24]
                            limitCount:24];
    
}// @[@6,@15] @[@4,@9,@14,@19,@24] @[@4,@9]


#pragma mark - setupUI

- (UITextField *)textBankNumber {
    if (!_textBankNumber) {
        _textBankNumber = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 250, 30)];
        _textBankNumber.delegate = self;
        _textBankNumber.backgroundColor = [UIColor lightGrayColor];
        _textBankNumber.keyboardType = UIKeyboardTypeNumberPad;
        _textBankNumber.placeholder = @"请输入~~";
        [self.view addSubview:_textBankNumber];
    }
    return _textBankNumber;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
