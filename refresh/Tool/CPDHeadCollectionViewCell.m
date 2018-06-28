//
//  CPDHeadCollectionViewCell.m
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/27.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import "CPDHeadCollectionViewCell.h"

@implementation CPDHeadCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor] ;
        [self.contentView addSubview:self.logoImg] ;
        [self.logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        [self.contentView addSubview:self.numLb];
        [self.numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_right);
            make.centerY.equalTo(self.contentView.mas_top);
            make.width.height.mas_equalTo(28);
        }];
    }
    return self ;
}
-(UIImageView *)logoImg
{
    if (!_logoImg) {
        _logoImg = [[UIImageView alloc]init]; ;
        _logoImg.clipsToBounds = YES ;
        _logoImg.layer.cornerRadius = 12 ;
    }
    return _logoImg ;
}
-(UILabel *)numLb{
    if (!_numLb) {
        _numLb = [[UILabel alloc]init];
        _numLb.backgroundColor = RGB(253, 63, 63);
        _numLb.font = [UIFont systemFontOfSize:16];
        _numLb.clipsToBounds = YES ;
        _numLb.layer.cornerRadius = 14 ;
        _numLb.textColor = [UIColor whiteColor];
        _numLb.textAlignment = NSTextAlignmentCenter;
        _numLb.layer.masksToBounds = YES;
        _numLb.hidden = YES;
    }
    return _numLb;
}

-(void)setUnreadNum:(NSInteger)unreadNum{
    _unreadNum = unreadNum;
    if (unreadNum <= 0) {
        _numLb.hidden = YES;
    }else{
        _numLb.hidden = NO;
        _numLb.text = [NSString stringWithFormat:@"%ld", unreadNum];
        
        CGRect rect = [_numLb.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 28) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
        if (rect.size.width+10<28) {
            
        } else {
            [_numLb mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(rect.size.width+10);
            }];
        }
    }
}
@end
