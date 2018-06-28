//
//  PTTableViewCell.m
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/21.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import "PTTableViewCell.h"

@interface PTTableViewCell()

@property (nonatomic, strong) UILabel* orderNameLb;//工单号
@property (nonatomic, strong) UILabel* guestNameLb;//客户名
@property (nonatomic, strong) UILabel* assignNameLb;//指派人
@property (nonatomic, strong) UILabel* timeLb;//指派时间
@property (nonatomic, strong) UILabel* stateLb;//状态
@property (nonatomic, strong) UIView* seperateLine;//分割线

@end

@implementation PTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(instancetype)createPTTableViewCellWithTableView:(UITableView *)tableView{
    static NSString* reuseId = @"PTTableViewCell";
    PTTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[PTTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    self.orderNameLb = [[UILabel alloc]init];
    _orderNameLb.textColor = RGBA(102, 102, 102, 1);
    _orderNameLb.font = [UIFont systemFontOfSize:14.0f];
    _orderNameLb.textAlignment = NSTextAlignmentCenter;
    _orderNameLb.numberOfLines = 0;
    _orderNameLb.text = @"巴拉拉";
    [self addSubview:_orderNameLb];
    [_orderNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(@(SCREEN_WIDTH/5.0));
    }];
    
    self.guestNameLb = [[UILabel alloc]init];
    _guestNameLb.textColor = RGBA(102, 102, 102, 1);
    _guestNameLb.font = [UIFont systemFontOfSize:14.0f];
    _guestNameLb.textAlignment = NSTextAlignmentCenter;
    _guestNameLb.numberOfLines = 0;
    _guestNameLb.text = @"小魔仙";
    [self addSubview:_guestNameLb];
    [_guestNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.orderNameLb.mas_right);
        make.width.mas_equalTo(@(SCREEN_WIDTH/5.0));
    }];
    
    self.assignNameLb = [[UILabel alloc]init];
    _assignNameLb.textColor = RGBA(102, 102, 102, 1);
    _assignNameLb.font = [UIFont systemFontOfSize:14.0f];
    _assignNameLb.textAlignment = NSTextAlignmentCenter;
    _assignNameLb.numberOfLines = 0;
    _assignNameLb.text = @"开始";
    [self addSubview:_assignNameLb];
    [_assignNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.guestNameLb.mas_right);
        make.width.mas_equalTo(@(SCREEN_WIDTH/5.0));
    }];
    
    self.timeLb = [[UILabel alloc]init];
    _timeLb.textColor = RGBA(102, 102, 102, 1);
    _timeLb.font = [UIFont systemFontOfSize:14.0f];
    _timeLb.textAlignment = NSTextAlignmentCenter;
    _timeLb.numberOfLines = 0;
    _timeLb.text = @"变";
    [self addSubview:_timeLb];
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.assignNameLb.mas_right);
        make.width.mas_equalTo(@(SCREEN_WIDTH/5.0));
    }];
    
    self.stateLb = [[UILabel alloc]init];
    _stateLb.textColor = RGBA(52, 151, 250, 1);
    _stateLb.font = [UIFont systemFontOfSize:14.0f];
    _stateLb.textAlignment = NSTextAlignmentCenter;
    _stateLb.numberOfLines = 0;
    _stateLb.text = @"身";
    [self addSubview:_stateLb];
    [_stateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.timeLb.mas_right);
        make.width.mas_equalTo(@(SCREEN_WIDTH/5.0));
    }];
    
    self.seperateLine = [[UIView alloc]init];
    _seperateLine.backgroundColor = RGBA(191, 191, 191, 1);
    [self addSubview:_seperateLine];
    [_seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(@1);
    }];
    
}

-(void)updateCellDatas{
    
}
@end
