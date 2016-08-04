//
//  MineHeader.m
//  TigerFinace
//
//  Created by mooner on 16/7/25.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "MineHeader.h"

@implementation MineHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    __weak UIView  *_view =  self;
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MineHeader.png"]];
    backgroundImageView.frame = self.frame;
    [self addSubview:backgroundImageView];
    
    
    self.infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview: self.infoButton];
    [ self.infoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.mas_top).with.offset(30);
        make.right.equalTo(_view.mas_right).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    self.infoButton.selected = YES;
    self.infoButton.tag = 1001;
    
    UIImageView *infoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"infoSelected"]];
    [self.infoButton addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.infoButton);
        make.size.mas_equalTo(CGSizeMake(25, 18));
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.centerY.equalTo(self.infoButton.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    titleLabel.text = @"我的老虎";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    
    //总资产
    self.assetsLabel = [[UILabel alloc] init];
    [self addSubview:self.assetsLabel];
    [self.assetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(240*WIDTH_Rate, 30*HEIGHT_Rate));
    }];
    self.assetsLabel.text = @"0";
    self.assetsLabel.textColor = [UIColor whiteColor];
    self.assetsLabel.font = [UIFont systemFontOfSize:42*WIDTH_Rate];
    self.assetsLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *myAssetsLabel = [[UILabel alloc] init];
    [self addSubview:myAssetsLabel];
    [myAssetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.assetsLabel.mas_centerX);
        make.top.equalTo(self.assetsLabel.mas_bottom).with.offset(8*HEIGHT_Rate);
        make.size.mas_equalTo(CGSizeMake(60*WIDTH_Rate, 20*HEIGHT_Rate));
    }];
    myAssetsLabel.text = @"总资产";
    myAssetsLabel.textColor = [UIColor whiteColor];
    myAssetsLabel.font = [UIFont systemFontOfSize:14*WIDTH_Rate];
    myAssetsLabel.textAlignment = NSTextAlignmentCenter;
    
    self.invenstAgainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.invenstAgainButton];
    [self.invenstAgainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.assetsLabel.mas_bottom).with.offset(-15*HEIGHT_Rate);
        make.right.equalTo(_view.mas_right).with.offset(15*WIDTH_Rate);
        make.size.mas_equalTo(CGSizeMake(90*WIDTH_Rate, 30*HEIGHT_Rate));
    }];
    self.invenstAgainButton.backgroundColor = COLOR_Orange;
    [self.invenstAgainButton setTitle:@"再次投资" forState:UIControlStateNormal];
    [self.invenstAgainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.invenstAgainButton.titleEdgeInsets = UIEdgeInsetsMake(0, -6, 0, 0);
    self.invenstAgainButton.titleLabel.font = [UIFont systemFontOfSize:14*WIDTH_Rate];
    self.invenstAgainButton.layer.cornerRadius = 15;
    self.invenstAgainButton.layer.masksToBounds = YES;
    self.invenstAgainButton.tag = 1003;
    
    
    //累计收益
    UILabel *earnMoneyLabel = [[UILabel alloc] init];
    [self addSubview:earnMoneyLabel];
    [earnMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(myAssetsLabel.mas_bottom).with.offset(24*HEIGHT_Rate);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(_view.mas_centerX).with.offset(-0.5);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    earnMoneyLabel.text = @"累计收益（元）";
    earnMoneyLabel.textAlignment = NSTextAlignmentCenter;
    earnMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.shareButton];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(earnMoneyLabel.mas_right).with.offset(-28*WIDTH_Rate);
        make.centerY.equalTo(earnMoneyLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(15*WIDTH_Rate, 15*HEIGHT_Rate));
    }];
    self.shareButton.tag = 1004;
    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"SharePostSymbol"] forState:UIControlStateNormal];
    
    self.earnMoneyLabel = [[UILabel alloc] init];
    [self addSubview:self.earnMoneyLabel];
    [self.earnMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(earnMoneyLabel.mas_bottom);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(earnMoneyLabel.mas_right).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.earnMoneyLabel.text = @"0";
    self.earnMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.earnMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.earnMoneyLabel.textColor = [UIColor whiteColor];
    
    //可用余额
    UILabel *balanceLabel = [[UILabel alloc] init];
    [self addSubview:balanceLabel];
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(earnMoneyLabel.mas_centerY);
        make.right.equalTo(_view.mas_right);
        make.left.equalTo(_view.mas_centerX).with.offset(0.5);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    balanceLabel.text = @"可用余额（元）";
    balanceLabel.textAlignment = NSTextAlignmentCenter;
    balanceLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.balanceLabel = [[UILabel alloc] init];
    [self addSubview:self.balanceLabel];
    [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(balanceLabel.mas_bottom);
        make.right.equalTo(_view.mas_right);
        make.left.equalTo(balanceLabel.mas_left).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.balanceLabel.text = @"0";
    self.balanceLabel.textAlignment = NSTextAlignmentCenter;
    self.balanceLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.balanceLabel.textColor = [UIColor whiteColor];
    
    
    //待收本息
    UILabel *interestLabel = [[UILabel alloc] init];
    [self addSubview:interestLabel];
    [interestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.balanceLabel.mas_bottom).with.offset(5*HEIGHT_Rate);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(_view.mas_centerX).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    interestLabel.text = @"待收本息（元）";
    interestLabel.textAlignment = NSTextAlignmentCenter;
    interestLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.interestLabel = [[UILabel alloc] init];
    [self addSubview:self.interestLabel];
    [self.interestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(interestLabel.mas_bottom);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(interestLabel.mas_right).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.interestLabel.text = @"0";
    self.interestLabel.textAlignment = NSTextAlignmentCenter;
    self.interestLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.interestLabel.textColor = [UIColor whiteColor];
    
    
    //可投金额
    UILabel *freezonMoneyLabel = [[UILabel alloc] init];
    [self addSubview:freezonMoneyLabel];
    [freezonMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(interestLabel.mas_top);
        make.left.equalTo(_view.mas_centerX);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    freezonMoneyLabel.text = @"冻结金额（元）";
    freezonMoneyLabel.textAlignment = NSTextAlignmentCenter;
    freezonMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.freezonMoneyLabel = [[UILabel alloc] init];
    [self addSubview:self.freezonMoneyLabel];
    [self.freezonMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(freezonMoneyLabel.mas_bottom);
        make.left.equalTo(_view.mas_centerX);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.freezonMoneyLabel.text = @"0";
    self.freezonMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.freezonMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.freezonMoneyLabel.textColor = [UIColor whiteColor];
    
    UIView *whiteLineView = [[UIView alloc] init];
    [self addSubview:whiteLineView];
    [whiteLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(earnMoneyLabel.mas_top).with.offset(3);
        make.centerX.equalTo(_view.mas_centerX);
        make.bottom.equalTo(self.freezonMoneyLabel.mas_bottom).with.offset(-2*HEIGHT_Rate);
        make.width.mas_equalTo(@0.5);
    }];
    whiteLineView.backgroundColor = [UIColor whiteColor];
}

- (void)buttonClick:(UIButton *)button {
    self.sendButtonBlock(button);
}


@end
