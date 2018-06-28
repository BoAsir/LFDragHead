//
//  CPDHeadCollectionViewCell.h
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/27.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPDHeadCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *logoImg ;
@property (nonatomic, strong) UILabel* numLb;

@property (nonatomic, assign) NSInteger unreadNum;

@end
