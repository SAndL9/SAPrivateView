//
//  LLProgressView.m
//  SAPrivateView
//
//  Created by LiLei on 28/2/18.
//  Copyright © 2018年 李磊. All rights reserved.
//

#import "LLProgressView.h"

@interface LLProgressView ()

#define kBorderColor [UIColor colorWithRed:254/255. green:181./255. blue:179./255. alpha:1]
#define kTitleColor  [UIColor colorWithRed:253./255. green:61./255. blue:57./255. alpha:1]

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UILabel *backLabel;
@property (nonatomic, strong) UILabel *fontLabel;

@end
@implementation LLProgressView

- (UIImageView *)backImageView {
    if (!_backImageView) {
        UIImage *backImg = [self imageResize:[UIImage imageNamed:@"bg"]
                                 andResizeTo:self.bounds.size];
        _backImageView = [[UIImageView alloc] initWithImage:backImg];
        _backImageView.frame = self.bounds;
    }
    return _backImageView;
}

- (UILabel *)backLabel {
    if (!_backLabel) {
        _backLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _backLabel.textColor = kTitleColor;
        _backLabel.font = [UIFont systemFontOfSize:20];
        UIBezierPath *path = [self pathWithEndX:self.bounds.size.width];
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.path = path.CGPath;
        borderLayer.lineWidth = 1;
        borderLayer.strokeColor = kBorderColor.CGColor;
        borderLayer.fillColor = nil;
        [_backLabel.layer addSublayer:borderLayer];
    }
    return _backLabel;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _fontLabel.textColor = [UIColor whiteColor];
        _fontLabel.font = [UIFont systemFontOfSize:20];
        _fontLabel.backgroundColor = kTitleColor;
        UIBezierPath *path = [self pathWithEndX:self.bounds.size.height];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = path.CGPath;
        _fontLabel.layer.mask = maskLayer;
    }
    return _fontLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //背景图
        [self addSubview:self.backImageView];
        //背景字
        [self addSubview:self.backLabel];
        //进度条
        [self addSubview:self.fontLabel];
    }
    return self;
}

-(UIImage *)imageResize:(UIImage*)img andResizeTo:(CGSize)newSize
{
    UIBezierPath *path = [self pathWithEndX:newSize.width];
    //生成带圆角图片
    CGRect rect = CGRectMake(0, 0, newSize.width, newSize.height);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, [[UIScreen mainScreen] scale]);
    CGContextAddPath(UIGraphicsGetCurrentContext(), path.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [img drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(),kCGPathFillStroke);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIBezierPath *)pathWithEndX:(CGFloat)endX {
    
    CGFloat viewHeight = self.bounds.size.height;
    CGFloat topLeftRadius = viewHeight/2;
    CGFloat topRightRadius = viewHeight/2;
    CGFloat bottomRightRadius = viewHeight/2;
    CGFloat bottomLeftRadius = viewHeight/2;
    
    CGFloat minx = 0;
    CGFloat miny = 0;
    CGFloat maxx = endX;
    CGFloat maxy = viewHeight;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(minx + topLeftRadius, miny)];
    [path addLineToPoint:CGPointMake(maxx - topRightRadius, miny)];
    [path addArcWithCenter:CGPointMake(maxx - topRightRadius, miny + topRightRadius) radius: topRightRadius startAngle: 3 * M_PI_2 endAngle: 0 clockwise: YES];
    [path addLineToPoint:CGPointMake(maxx, maxy - bottomRightRadius)];
    [path addArcWithCenter:CGPointMake(maxx - bottomRightRadius, maxy - bottomRightRadius) radius: bottomRightRadius startAngle: 0 endAngle: M_PI_2 clockwise: YES];
    [path addLineToPoint:CGPointMake(minx + bottomLeftRadius, maxy)];
    [path addArcWithCenter:CGPointMake(minx + bottomLeftRadius, maxy - bottomLeftRadius) radius: bottomLeftRadius startAngle: M_PI_2 endAngle:M_PI clockwise: YES];
    [path addLineToPoint:CGPointMake(minx, miny + topLeftRadius)];
    [path addArcWithCenter:CGPointMake(minx + topLeftRadius, miny + topLeftRadius) radius: topLeftRadius startAngle: M_PI endAngle:3 * M_PI_2 clockwise: YES];
    [path closePath];
    return path;
}

- (void)setTitle:(NSString *)title {
    _title = [NSString stringWithFormat:@"%@",title];
    self.backLabel.text = _title;
    self.fontLabel.text = _title;
}

- (void)playAnimation {
    [self.fontLabel.layer.mask removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    UIBezierPath *fromPath = [self pathWithEndX:self.bounds.size.height];
    UIBezierPath *toPath = [self pathWithEndX:self.bounds.size.height+(self.bounds.size.width-self.bounds.size.height)*self.progress];
    pathAnimation.fromValue = (id)fromPath.CGPath;
    pathAnimation.toValue = (id)toPath.CGPath;
    pathAnimation.duration = 1.0*self.progress;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    [self.fontLabel.layer.mask addAnimation:pathAnimation forKey:@"mask"];
}

@end

