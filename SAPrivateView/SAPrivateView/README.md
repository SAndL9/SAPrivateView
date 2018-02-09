# TextField + NumberFormat

>TextField中输入身份证号，手机号，银行卡号时每隔几位需要添加空格。当输入错误时需要从末尾或者中间删除，删除之后还要保持当前textfield的中内容保持每隔几位就有一个空格的格式。这个分类主要是为了解决这个问题

```
textField中输入的空格格式化
 @param textField  
 @param range  
 @param string  
 @param blankLocation 要加的空格的位置 比如手机号11 位 如果需要 344的显示格式 空格位置就是 @[@4,@9]
                      身份证号最大 18位 684格式 空格位置 位@[@6,@15]
                      银行卡号最大 24 空格位置 @[@4,@9,@14,@19,@24] 不同的账号显示格式可以自定义
 @param limitCount 限制的长度 超过此限制长度 则不能输入 如果输入的为0 则不限制输入的长度
 @return textField中输入的身份证号 ，手机号，银行卡号 有需要在中间加入空格的需求 此扩展就是为了解决这类问题的
 
 */
+ (BOOL)inputTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
     replacementString:(NSString *)string
        blankLocations:(NSArray <NSNumber *>*)blankLocation
            limitCount:(NSInteger )limitCount;
            
```
### 使用方法

```

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 在textField的代理方法中调用这一句方法
    // 设置好要展示的格式 即 空格的位置blankLocations 
    // 如果limitCount 为0 表示不显示输入的长度大小
    return [UITextField inputTextField:textField
         shouldChangeCharactersInRange:range
                     replacementString:string
                        blankLocations:@[@4,@9,@14,@19,@24]
                            limitCount:24];
    
}



