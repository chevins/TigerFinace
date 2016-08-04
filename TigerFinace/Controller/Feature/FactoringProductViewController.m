//
//  FactoringProductViewController.m
//  TigerFinace
//
//  Created by mooner on 16/7/23.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FactoringProductViewController.h"

//View
#import "FactoringProductView.h"
#import "FactoringProducHeader.h"

//Cell
#import "FactoringProductCell.h"

//Model
#import "FactoringProductModel.h"

@interface FactoringProductViewController ()<UITableViewDataSource,UITableViewDelegate>{
    FactoringProductView *_view;
    NSArray *_titleArray;
    NSMutableArray *_dataArray;
}

@end

@implementation FactoringProductViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
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
    _titleArray = @[@"本期购买用户",@"项目介绍",@"风控措施",@"还款计划"];
}

- (void)createUI {
    
    _view = [[FactoringProductView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    
    _view.factoringTableView.delegate = self;
    _view.factoringTableView.dataSource = self;
    [_view.factoringTableView registerClass:[FactoringProductCell class] forCellReuseIdentifier:@"FactoringProductCell"];
    
    _view.scrollContainer.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerStartReresh)];
    
    [self.view addSubview:_view];
    
    __weak FactoringProductViewController *controller = self;
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
    FactoringProductModel *model = [[FactoringProductModel alloc] init];
    model.startMoney = 100;
    model.limite = 6;
    model.progress = 100;//年化收益，取值范围在0-100之间
    model.payWay = @"等额本金";
    model.invenstMoney = 10000000;
    
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
        
        //返回
        case 1000: {
            [self.navigationController popViewControllerAnimated:YES];
        }break;
        
        //立即投资
        case 1002: {
            [SVProgressHUD showWithStatus:@"立即投资"];
        }break;

    }
}

#pragma -mark ======================= 代理事件 ======================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FactoringProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FactoringProductCell"];
    [cell fillCellWithTitle:_titleArray[indexPath.row] content:@"1000000" row:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55*HEIGHT_Rate;
}

//选择行数（本期购买用户、项目介绍、风控措施、还款计划）
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
        //本期购买用户
            
        } break;
            
        case 1: {
        //项目介绍
        
        } break;
            
        case 2: {
        //风控措施
            
        } break;
            
        case 3: {
        //还款计划
            
        } break;
            
        default:
            break;
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
