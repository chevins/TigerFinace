//
//  ItemViewController.m
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "ItemViewController.h"
#import "ItemListViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 60);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"项目列表" forState:UIControlStateNormal];
    [button addTarget: self action:@selector(gotoItemList:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)gotoItemList:(UIButton *)button {
    ItemListViewController *controller = [[ItemListViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
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
