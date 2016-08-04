//
//  ViewController.m
//  TigerFinace
//
//  Created by mooner on 16/7/21.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FeatureViewController.h"
#import "FactoringProductViewController.h"

//View
#import "FeatureView.h"
#import "SDCycleScrollView.h"

//Model
#import "FeatrueModel.h"

@interface FeatureViewController ()<SDCycleScrollViewDelegate>{
    FeatureView *_view;
    NSMutableArray *_dataArray;
    NSMutableArray *_bannerList;
}

@end

@implementation FeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self createUI];
    [self simulateDataRequest];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initData {
    _dataArray = [NSMutableArray array];
    _bannerList = [NSMutableArray array];
}

- (void)createUI {
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tigerFinace"]];
    self.navigationItem.titleView = titleView;
    
    _view.bannerSwipeView.delegate = self;
    _view.bannerSwipeView.autoScrollTimeInterval = 4;
    
    _view = [[FeatureView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64-49)];
    __weak FeatureViewController *controller = self;
    _view.sendButtonBlock = ^(UIButton *button){
        [controller buttonClick:button];
    };

    _view.containView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerStartReresh)];
    
    [self.view addSubview:_view];
    
}

#pragma -mark ========================= 数据请求 =============================
//模拟数据请求，请求完成后数据的赋值也在这里进行
-(void)simulateDataRequest {
    NSLog(@"开始请求数据，这里可以加Loading");
    SVProgressHUD.defaultStyle = SVProgressHUDStyleDark;
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    NSLog(@"正在请求数据");
    //模拟数据请求时间

    NSLog(@"数据请求成功");
    
    //装新数据前把旧数据清一遍
    [_dataArray removeAllObjects];
    
    //数据请求成功就把数据用Model装起来
    FeatrueModel *model = [[FeatrueModel alloc] init];
    model.payToString = @"我是汇付广告";
    model.repayString = @"我是还款广告";
    model.inventAllMoney = @"1000,1000,1000";//投资总额
    model.progress = 0.15;//年化收益，取值范围在0-1之间
    model.limite = 30;
    model.itemAllMoney = @"100万";
    model.buyPeople = 1000;
    
    //把Model装进数组里方便调用
    [_dataArray addObject:model];
    [_bannerList addObject:@"http://www.pptbz.com/pptpic/UploadFiles_6909/201204/2012041411433867.jpg"];
    [_bannerList addObject:@"http://pic25.nipic.com/20121112/5955207_224247025000_2.jpg"];
    
    //在数据请求拿到数据后给Model赋值，然后调用[_view fillViewWithModel:model];
    //Model的字段到时可以根据服务端返回的字段再做定义
    //这里是模拟数据
    [_view fillViewWithModel:_dataArray[0]];
    
    //将轮播图的图片url数组传给轮播图
    _view.bannerSwipeView.imageURLStringsGroup = _bannerList;
    
    //结束刷新
    [self headerEndReresh];

}

#pragma -mark ======================= 按钮点击事件 ======================
- (void)buttonClick:(UIButton *)button {
    //立即投资按钮点击
    FactoringProductViewController *controller = [[FactoringProductViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma -mark ======================= 代理事件 ======================
//广告轮播图
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张",index);
}

#pragma -mark ======================= 其他业务逻辑事件 ======================
- (void)headerStartReresh {
    //下拉刷新时请求数据
    [self simulateDataRequest];
    
}

- (void)headerEndReresh {
    //结束刷新
    [_view.containView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
