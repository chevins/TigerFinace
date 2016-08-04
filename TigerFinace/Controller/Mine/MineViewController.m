//
//  MineViewController.m
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "MineViewController.h"

//View
#import "MineView.h"

//Cell
#import "FuncCell.h"

//Model
#import "MineModel.h"

@interface MineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    MineView *_view;
    NSMutableArray *_dataArray;
    NSArray *_funcTitleArray;
    NSArray *_funcImageArray;
}

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialData];
    [self createUI];
    [self simulateDataRequest];
}

- (void)initialData {
    _dataArray = [NSMutableArray array];
    _funcTitleArray = @[@"个人中心",@"投资记录",@"资金记录",@"我要提现",@"我的奖励",@"我要充值",@"借款管理",@"邀请有礼"];
    _funcImageArray = @[@"personCenter",@"investRecord",@"assetsRecord",@"withdraw",@"reward",@"recharge",@"loanManage",@"inviteGift"];
}

- (void)createUI {
    _view = [[MineView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _view.funcCollectionView.delegate = self;
    _view.funcCollectionView.dataSource = self;
    [_view.funcCollectionView registerClass:[FuncCell class] forCellWithReuseIdentifier:@"FuncCell"];
    _view.scrollContainer.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerStartReresh)];
    [self.view addSubview:_view];
    
    __weak MineViewController *controller = self;
    _view.sendButtonBlock = ^(UIButton *button) {
        [controller buttonClick:button];
    };
    
}

#pragma -mark ========================= 数据请求 =============================
//模拟数据请求
-(void)simulateDataRequest {
    NSLog(@"开始请求数据");
    [SVProgressHUD showWithStatus:@"加载中..."];
    NSLog(@"正在请求数据");
    //模拟数据请求时间
    
    NSLog(@"数据请求成功或者请求失败都要结束刷新");
    
    //装新数据前把旧数据清一遍
    [_dataArray removeAllObjects];
    
    //数据请求成功就把数据用Model装起来
    MineModel *model = [[MineModel alloc] init];
    model.assetsMoney = @"1000000";
    model.earnMoney = @"12133";
    model.balance = @"21312";
    model.interes = @"12312";
    model.freezonMoney = @"100000";
    
    //把Model装进数组里方便调用
    [_dataArray addObject:model];
    
    //在数据请求拿到数据后给Model赋值，然后调用[_view fillViewWithModel:model];
    //Model的字段到时可以根据服务端返回的字段再做定义
    //这里是模拟数据
    [_view fillViewWithModel:_dataArray[0]];
    
    //结束刷新
    [self headerEndReresh];
}

#pragma -mark ========================= 按钮点击事件 =============================
- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
            
        case 1001: {
         //右上角信息按钮
            [SVProgressHUD showWithStatus:@"我是信息按钮"];
        }break;
            
        
        case 1002: {
        //退出登录
            [SVProgressHUD showWithStatus:@"我是退出登录按钮"];
        }break;
            
        case 1003: {
         //再次投资
            [SVProgressHUD showWithStatus:@"我是再次投资按钮"];
            
        }break;
            
        case 1004: {
        //累计收益分享
            [SVProgressHUD showWithStatus:@"我是累计收益分享按钮"];
           
            
        }break;
    }
}

#pragma -mark ========================= 代理事件 =============================
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _funcTitleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FuncCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FuncCell" forIndexPath:indexPath];
    [cell fillCellWithTitle:_funcTitleArray[indexPath.item] image:_funcImageArray[indexPath.item]];
    return cell;
}

//功能模块点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.item) {
        case 0: {
         //个人中心
            [SVProgressHUD showWithStatus:@"个人中心"];
            
        }break;
            
        case 1: {
        //投资记录
           [SVProgressHUD showWithStatus:@"投资记录"];
            
        }break;
            
        case 2: {
        //资金记录
            [SVProgressHUD showWithStatus:@"资金记录"];
            
        }break;
            
        case 3: {
        //我要提现
            [SVProgressHUD showWithStatus:@"我要提现"];
            
        }break;
            
        case 4: {
        //我的奖励
           [SVProgressHUD showWithStatus:@"我的奖励"];
            
        }break;
            
        case 5: {
        //我要充值
           [SVProgressHUD showWithStatus:@"我要充值"];
        }break;
            
        case 6: {
        //借款管理
            [SVProgressHUD showWithStatus:@"借款管理"];
        }break;
            
        case 7: {
        //邀请有礼
            [SVProgressHUD showWithStatus:@"邀请有礼"];
        }break;
    }
    
}

#pragma -mark ======================= 其他业务逻辑事件 ======================
- (void)headerStartReresh {
    //下拉刷新时请求数据
    [self simulateDataRequest];
    
}

- (void)headerEndReresh {
    //结束刷新
    [_view.scrollContainer.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
