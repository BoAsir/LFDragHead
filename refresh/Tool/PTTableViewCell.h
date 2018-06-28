//
//  PTTableViewCell.h
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/21.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTTableViewCell : UITableViewCell

+(instancetype)createPTTableViewCellWithTableView:(UITableView*)tableView;

-(void)updateCellDatas;

@end
