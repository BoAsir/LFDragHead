//
//  LFTableHeaderView.m
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/27.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import "LFTableHeaderView.h"
#import "UIView+MJExtension.h"
#import "UIScrollView+MJExtension.h"
#import "CPDHeadCollectionView.h"

@interface LFTableHeaderView()

@property (nonatomic, strong) CPDHeadCollectionView* collectionView;

@end

@implementation LFTableHeaderView

#pragma mark - 控件初始化
-(CPDHeadCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[CPDHeadCollectionView alloc]initWithFrame:self.bounds];
    }
    return _collectionView;
}
-(void)setClassName:(NSString *)className{
    _className = className;
}
-(void)setBadgeNumArr:(NSArray *)badgeNumArr{
    _badgeNumArr = badgeNumArr;
    _collectionView.badgeNumArr = badgeNumArr;
    [_collectionView reloadDatas];
}
/**
 *  时间标签
 */
-(void)setInsetTop:(int)insetTop{
    _insetTop = insetTop;
    
}
+ (instancetype)header{
    return [[LFTableHeaderView alloc] initWithLFFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
}

- (instancetype)initWithLFFrame:(CGRect)frame{
    if (self = [super initWithLFFrame:frame]) {
        [self initViews:frame];
    }
    return self;
}

-(void)initViews:(CGRect)frame{
    [self addSubview:self.collectionView];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.arrowImage removeFromSuperview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    // 设置自己的位置和尺寸
    _collectionView.currentClassName = _className;
    self.mj_y = - self.mj_height;
}

#pragma mark - 状态相关

#pragma mark - 监听UIScrollView的contentOffset属性
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    // 不能跟用户交互就直接返回
    if (!self.userInteractionEnabled || self.alpha <= 0.01 || self.hidden) return;
    
    // 如果正在刷新，直接返回
    if (self.state == MJRefreshStateRefreshing) return;
    
    if ([MJRefreshContentOffset isEqualToString:keyPath]) {
        [self adjustStateWithContentOffset];
    }
}

/**
 *  调整状态
 */
- (void)adjustStateWithContentOffset{
    // 当前的contentOffset
    CGFloat currentOffsetY = self.scrollView.mj_contentOffsetY;
    // 头部控件刚好出现的offsetY
    CGFloat happenOffsetY = - self.scrollViewOriginalInset.top;
    
    // 如果是向上滚动到看不见头部控件，直接返回
    if (currentOffsetY >= happenOffsetY) return;
    
    if (self.scrollView.isDragging) {
        // 普通 和 即将刷新 的临界点
        CGFloat normal2pullingOffsetY = happenOffsetY - self.mj_height;
        
        if (self.state == MJRefreshStateNormal && currentOffsetY < normal2pullingOffsetY) {
            // 转为即将刷新状态
            self.state = MJRefreshStatePulling;
        } else if (self.state == MJRefreshStatePulling && currentOffsetY >= normal2pullingOffsetY) {
            // 转为普通状态
            self.state = MJRefreshStateNormal;
        }
    } else if (self.state == MJRefreshStatePulling) {// 即将刷新 && 手松开
        // 开始刷新
        self.state = MJRefreshStateRefreshing;
    }
}

#pragma mark 设置状态
- (void)setState:(MJRefreshState)state{
    // 1.一样的就直接返回
    if (self.state == state) return;
    
    // 2.保存旧状态
    MJRefreshState oldState = self.state;
    
    // 3.调用父类方法
    [super setState:state];
    
    // 4.根据状态执行不同的操作
    switch (state) {
        case MJRefreshStateNormal: // 下拉可以刷新
        {
            // 刷新完毕
            if (MJRefreshStateRefreshing == oldState) {
//                self.arrowImage.transform = CGAffineTransformIdentity;
                __weak typeof(self) weakSelf = self;
                [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
                    //                    self.scrollView.mj_contentInsetTop -= self.mj_height;
                    weakSelf.scrollView.mj_contentInsetTop = weakSelf.insetTop;
                    
                }];
                
                
            } else {
                // 执行动画
//                [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
//                    self.arrowImage.transform = CGAffineTransformIdentity;
//                }];
            }
            break;
        }
            
        case MJRefreshStatePulling: // 松开可立即刷新
        {
            // 执行动画
//            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
//                self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
//            }];
            break;
        }
            
        case MJRefreshStateRefreshing: // 正在刷新中
        {
            // 执行动画
            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                // 1.增加滚动区域
                CGFloat top = self.scrollViewOriginalInset.top + self.mj_height;
                self.scrollView.mj_contentInsetTop = top;
                
                // 2.设置滚动位置
                self.scrollView.mj_contentOffsetY = - top;
            }];
            break;
        }
            
        default:
            break;
    }
}

@end
