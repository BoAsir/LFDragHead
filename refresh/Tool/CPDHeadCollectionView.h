//
//  CPDHeadCollectionView.h
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/27.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import <UIKit/UIKit.h>
//头部弹出供选择的视图
@interface CPDHeadCollectionView : UIView

@property (nonatomic, strong) NSString* currentClassName;
@property (nonatomic, strong) NSArray* badgeNumArr;//角标数量数组

-(void)reloadDatas;//刷新

@end
