//
//  LLProgressView.h
//  SAPrivateView
//
//  Created by LiLei on 28/2/18.
//  Copyright © 2018年 李磊. All rights reserved.
//
//售出进度条
#import <UIKit/UIKit.h>

@interface LLProgressView : UIView
/** 售出文案 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) CGFloat progress;

- (void)playAnimation;

@end
