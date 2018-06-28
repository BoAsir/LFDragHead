//
//  ViewController.m
//  refresh
//
//  Created by 路飞  on 2018/6/25.
//  Copyright © 2018年 lufei. All rights reserved.
//

#import "ViewController.h"
#import "PTTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

//标题
@property (nonatomic, strong) UIButton* titleBtn;
@property (nonatomic, strong) UIImageView* arrowImgV;

//列表
@property (nonatomic, strong) UITableView* tableView;

@end

@implementation ViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private
-(void)initNav{
    UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44.0)];
    [titleBtn addTarget:self action:@selector(clickToShow:) forControlEvents:UIControlEventTouchUpInside];
    [titleBtn setTitle:@"😋😋😋" forState:UIControlStateNormal];
    [titleBtn setTitle:@"😋😋😋" forState:UIControlStateSelected];
    [titleBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [titleBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateSelected];
    titleBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [titleBtn addSubview:self.arrowImgV];
    [_arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleBtn);
        make.left.equalTo(titleBtn.titleLabel.mas_right).offset(8);
        make.width.height.mas_equalTo(@16);
    }];
    self.titleBtn = titleBtn;
    [self.view addSubview:self.titleBtn];
}

-(void)clickToShow:(UIButton*)sender{
    sender.selected = !sender.isSelected;
    if (sender.isSelected == YES) {
        //选中状态
        _arrowImgV.image = [UIImage imageNamed:@"arrow_up"];
        [self.tableView showLf_header];
        
    }else{
        //未选中状态
        _arrowImgV.image = [UIImage imageNamed:@"arrow_down"];
        [self.tableView hideLf_header];
        
    }
}

-(void)initViews{
    [self.view addSubview:self.tableView];
    [_tableView addLFHeaderWithClassName:[NSString stringWithUTF8String:object_getClassName(self)] callback:nil];//添加一个头部
    _tableView.lf_header.badgeNumArr = @[@"20",@"1",@"101",@"2",@"0",@"0"];
}

#pragma mark - delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PTTableViewCell* cell = [PTTableViewCell createPTTableViewCellWithTableView:tableView];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    CGPoint vel = [scrollView.panGestureRecognizer velocityInView:scrollView];
    CGFloat currentY = scrollView.contentOffset.y;//起始点在下面的，不展开
    if (vel.y > 0) {
        // 下拉
        if (currentY <= 0) {
            self.titleBtn.selected = YES;
            self.arrowImgV.image = [UIImage imageNamed:@"arrow_up"];
            [self.tableView showLf_header];
        }
    }else{
        // 上拉
        self.titleBtn.selected = NO;
        self.arrowImgV.image = [UIImage imageNamed:@"arrow_down"];
        [self.tableView hideLf_header];
    }
}

#pragma mark - property
-(UIImageView *)arrowImgV{
    if (!_arrowImgV) {
        _arrowImgV = [[UIImageView alloc]init];
        _arrowImgV.image = [UIImage imageNamed:@"arrow_down"];
    }
    return _arrowImgV;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64.0, SCREEN_WIDTH, SCREEN_HEIGHT-64.0) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
