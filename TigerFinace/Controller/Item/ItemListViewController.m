//
//  ItemListViewController.m
//  TigerFinace
//
//  Created by mooner on 16/7/27.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "ItemListViewController.h"

//View
#import "ItemListView.h"

//Cell
#import "ItemListCell.h"

//Model
#import "ItemModel.h"

@interface ItemListViewController ()<UITableViewDelegate , UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate> {
    ItemListView *_view;
    NSArray *_typePickerData;
    NSArray *_earnPickerData;
    NSArray *_limitPickerData;
    NSArray *_selectedDataArray;
    NSMutableArray *_itemData;
    NSInteger _page;
    
}
@property (strong , nonatomic) UIPickerView *pickerView;
@property (strong , nonatomic) UIButton *sureButton;

@end

@implementation ItemListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"项目列表";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self createUI];
    [self simulateDataRequest];
}

- (void)initData {
    _page = 0;//加载列表数据的页数
    _selectedDataArray = [NSArray array];
    _typePickerData = @[@"全部类型",@"保理产品",@"担保产品",@"票据产品"];
    _earnPickerData = @[@"全部收益率",@"保理产品",@"担保产品",@"票据产品"];
    _limitPickerData = @[@"全部期限",@"保理产品",@"担保产品",@"票据产品"];
    _itemData = [NSMutableArray array];
}

- (void)createUI {
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(0, 0, 20, 20);
    shareButton.tag = 1002;
    [shareButton setBackgroundImage:[UIImage imageNamed:@"share_red"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    
    __weak ItemListViewController *controller = self;
    _view = [[ItemListView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64-49)];
    
    _view.itemListTabelView.delegate = self;
    _view.itemListTabelView.dataSource = self;
    [_view.itemListTabelView registerClass:[ItemListCell class] forCellReuseIdentifier:@"ItemListCell"];
    
    //下拉刷新
    _view.itemListTabelView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerStartReresh)];
    //上拉加载
    _view.itemListTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerStartRefresh)];
    
    _view.sendButtonBlock = ^(UIButton *button) {
        [controller buttonClick:button];
    };
    
    _view.sendSegmentBlock = ^(UIButton *segButton) {
        [controller segmentSelected:segButton];
    };
    [self.view addSubview:_view];
}

#pragma -mark ========================= 数据请求 =============================
//模拟数据请求
-(void)simulateDataRequest {
    NSLog(@"开始请求数据");
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    NSLog(@"正在请求数据");
    
    NSLog(@"数据请求成功或者请求失败都要结束刷新");
    
    //下拉刷新，装新数据前把旧数据清一遍
    if (_page == 0) {
        [_itemData removeAllObjects];
    }
   
    //数据请求成功就把数据用Model装起来
    for (NSInteger i = 1; i<4; i++) {
        ItemModel *model = [[ItemModel alloc] init];
        model.type = i;
        model.typeName = _typePickerData[i];
        model.item = @"蒙牛乳业保理项目20160504";
        model.yearProgress = i+40;
        model.startMoney = 100+i;
        model.limite = i;
        model.progress = i/10.0;
        [_itemData addObject:model];
    }
    
    //列表刷新数据
    [_view.itemListTabelView reloadData];
    
    //结束刷新
    [self headerEndReresh];
    [self footerEndReresh];
}

#pragma -mark ========================= 按钮点击事件 =============================
//列表头部的三个tag切换
-(void)segmentSelected:(UIButton *)segButton{
    
    //将按钮的选中状态去掉
    for (NSInteger i = 100; i<=102; i++) {
        UIButton *button = (UIButton *)[_view viewWithTag:i];
        button.selected = NO;
        button.backgroundColor = COLOR_Background;
    }
    //处理选中的按钮
    segButton.selected = YES;
    segButton.backgroundColor = [UIColor clearColor];
    
    //显示选择器
    [self showPickerView];
   
    switch (segButton.tag) {
        case 100: {
        //全部类型
            _selectedDataArray = _typePickerData;
            
        }break;
            
        case 101: {
        //全部收益
            _selectedDataArray = _earnPickerData;
            
        } break;
            
        case 102: {
        //全部期限
            _selectedDataArray = _limitPickerData;
            
        } break;
    }
    
    [self.pickerView reloadComponent:0];
}

- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        
        case 1001: {
        //选择器确定按钮
            [self.pickerView removeFromSuperview];
            [button removeFromSuperview];
        }break;
        
        case 1002: {
        //右上角分享按钮
            [SVProgressHUD showWithStatus:@"我是分享按钮..."];
           
          
        }break;
    }
}

#pragma -mark ======================= 代理事件 ======================
#pragma mark tableViewDelegate && tableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemListCell"];
    [cell fillCellWithModel:_itemData[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140*HEIGHT_Rate;
}

#pragma mark pickerViewDelegate && pickerViewDataSource
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _selectedDataArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 32;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = [[UILabel alloc] init];
    label.text = _selectedDataArray[row];
    label.textColor = COLOR_Red;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    
    return label;
}

//选择器选中了某一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%@",_selectedDataArray[row]);
}

 #pragma -mark ======================= 其他业务逻辑事件 ======================
//下拉刷新
- (void)headerStartReresh {
    //下拉刷新时请求数据
    _page = 0;
    [self simulateDataRequest];
    
}

- (void)headerEndReresh {
    //结束刷新
    [_view.itemListTabelView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}


//上拉加载
- (void)footerStartRefresh {
    //上拉加载时请求数据
    _page++;
    [self simulateDataRequest];
}

- (void)footerEndReresh {
    //结束刷新
    [_view.itemListTabelView.mj_footer endRefreshing];
    [SVProgressHUD dismiss];
}



-(void)showPickerView {
    [self.pickerView removeFromSuperview];
    [self.sureButton removeFromSuperview];
    self.pickerView = nil;
    self.sureButton = nil;
    
    if (self.pickerView == nil) {
        self.pickerView = [[UIPickerView alloc] init];
        [_view addSubview:self.pickerView];
        [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_view.mas_bottom);
            make.left.equalTo(_view.mas_left);
            make.right.equalTo(_view.mas_right);
            make.height.mas_equalTo(@(120*HEIGHT_Rate));
        }];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.pickerView.backgroundColor = COLOR_Background;
        [_view addSubview:self.pickerView];
        
        
        self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_view addSubview:self.sureButton];
        [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pickerView.mas_top).with.offset(4*HEIGHT_Rate);
            make.right.equalTo(self.pickerView.mas_right).with.offset(-8);
            make.size.mas_equalTo(CGSizeMake(60, 25));
        }];
        [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [self.sureButton setTitleColor:COLOR_Green forState:UIControlStateNormal];
        self.sureButton.titleLabel.font = [UIFont systemFontOfSize:14*HEIGHT_Rate];
        self.sureButton.tag = 1001;
        [self.sureButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
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
