//
//  LFTableHeaderView.h
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/27.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import "MJRefreshBaseView.h"
#import "MJRefreshConst.h"

@interface LFTableHeaderView : MJRefreshBaseView

@property (nonatomic,assign) int insetTop;//当自定义过insetTop时，不会依然等于0
@property (nonatomic, strong) NSString* className;
@property (nonatomic, strong) NSArray* badgeNumArr;
+ (instancetype)header;

@end
