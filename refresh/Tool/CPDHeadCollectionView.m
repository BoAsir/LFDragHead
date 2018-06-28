//
//  CPDHeadCollectionView.m
//  LotteryOrderSystem
//
//  Created by 路飞  on 2018/6/27.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import "CPDHeadCollectionView.h"
#import "CPDHeadCollectionViewCell.h"

@interface CPDHeadCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong)NSArray *imgDataArr ;
@property (nonatomic, strong) UIButton* backBtn;

@end

@implementation CPDHeadCollectionView
#pragma mark - property
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setBackgroundColor:RGBA(99, 109, 129, 1)];
        [_backBtn setTitle:@"返\n回\n首\n页" forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:21];
        _backBtn.titleLabel.numberOfLines = 0;
        [_backBtn addTarget:self action:@selector(clickToBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width-48, self.frame.size.height) collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO ;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = RGBA(61, 69, 86, 1);
    }
    return _collectionView;
}
-(NSArray *)imgDataArr{
    if (!_imgDataArr) {
        _imgDataArr = @[@"doge", @"doge", @"doge", @"doge", @"doge", @"doge"];
    }
    return _imgDataArr;
}
#pragma lifeCycle
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}
#pragma private
-(void)initViews{
    [self addSubview:self.collectionView];
    [_collectionView registerClass:[CPDHeadCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"] ;
    [_collectionView registerClass:[UICollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self addSubview:self.backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.mas_equalTo(@(48));
    }];
}
-(void)clickToBack:(UIButton*)sender{
        //返回首页
//       UINavigationController* navC =  (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
//        [navC popToRootViewControllerAnimated:YES];
}
#pragma public
-(void)reloadDatas{
    [self.collectionView reloadData];
}
#pragma delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgDataArr.count ;
}
#pragma mark -----DataSource-----

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *imgString = self.imgDataArr[indexPath.item] ;
    
    CPDHeadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.logoImg.image = [UIImage imageNamed:imgString];
    cell.unreadNum = [self.badgeNumArr[indexPath.item] integerValue];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


// 设置cell大小 itemSize：可以给每一个cell指定不同的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 100;
    CGFloat width = 100;
    return CGSizeMake(width, height);
}
// 设置UIcollectionView整体的内边距（这样item不贴边显示）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 上 左 下 右
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

// 设置minimumLineSpacing：cell上下之间最小的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

// 设置minimumInteritemSpacing：cell左右之间最小的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

@end
