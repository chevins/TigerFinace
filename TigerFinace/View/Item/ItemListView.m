//
//  IteamView.m
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "ItemListView.h"

@implementation ItemListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    __weak UIView *_view = self;
    
    UIView *buttonContainerView = [[UIView alloc] init];
    [self addSubview:buttonContainerView];
    [buttonContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view.mas_left).with.offset(12);
        make.top.equalTo(_view.mas_top).with.offset(12);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH-24, 25*HEIGHT_Rate));
    }];
    buttonContainerView.layer.cornerRadius = 25*HEIGHT_Rate/2.0;
    buttonContainerView.layer.borderColor = COLOR_Red.CGColor;
    buttonContainerView.layer.borderWidth = 1;
    buttonContainerView.backgroundColor = COLOR_Red;
    
    NSArray *typeArray =@[@"全部类型",@"全部收益率",@"全部期限"];
    for (NSInteger i = 0 ; i<typeArray.count ;i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [buttonContainerView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonContainerView.mas_left).with.offset((SCREENWIDTH-24)/3.0*i);
            make.top.equalTo(buttonContainerView.mas_top);
            make.size.mas_equalTo(CGSizeMake((SCREENWIDTH-24)/3.0-1, 25*HEIGHT_Rate));
        }];

        button.backgroundColor = COLOR_Background;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitle:typeArray[i] forState:UIControlStateNormal];
        [button setTitle:typeArray[i] forState:UIControlStateSelected];
        [button setTitleColor:COLOR_Red forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.tag = 100+i;
        if (i == 0) {
            button.selected = YES;
            button.backgroundColor = [UIColor clearColor];
        }
        if (i == 1) {
            button.layer.borderColor = COLOR_Red.CGColor;
            buttonContainerView.layer.borderWidth = 1;
        }
        [button addTarget:self action:@selector(segmentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.itemListTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 43*HEIGHT_Rate, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49-43*HEIGHT_Rate)];
    [self addSubview:self.itemListTabelView];
    self.itemListTabelView.backgroundColor = COLOR_Background;
    self.itemListTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)buttonClick:(UIButton *)button {
    self.sendButtonBlock(button);
}

- (void)segmentButtonClick:(UIButton *)button {
    self.sendSegmentBlock(button);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
