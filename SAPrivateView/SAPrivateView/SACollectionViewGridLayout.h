//
//  SACollectionViewGridLayout.h
//  SAPrivateView
//
//  Created by 李磊 on 25/5/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SACollectionViewGridLayout : UICollectionViewLayout

@property (nonatomic) CGFloat minimumLineSpacing; //行间距

@property (nonatomic) CGFloat minimumInteritemSpacing; //item间距

@property (nonatomic) CGSize itemSize; //item大小

@property (nonatomic) UIEdgeInsets sectionInset;

- (instancetype)init;
@end
