//
//  FactoringProducHeader.m
//  TigerFinace
//
//  Created by mooner on 16/7/24.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FactoringProducHeader.h"

@implementation FactoringProducHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        self.backgroundColor = COLOR_Red;
    }
    return self;
}

- (void)createUI {
    
    
    __weak UIView  *_view =  self;
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview: self.backButton];
    [ self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.mas_top).with.offset(30);
        make.left.equalTo(_view.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
     self.backButton.tag = 1000;
    
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back-icon"]];
    [self.backButton addSubview:backImage];

    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backButton.mas_centerY);
        make.left.equalTo(self.backButton.mas_left).with.offset(10);
     
        
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.centerY.equalTo(self.backButton.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    titleLabel.text = @"保理产品";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:17];
    

    
//年化收益
    UIView *yellowView = [[UIView alloc] init];
    [self addSubview:yellowView];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(130*WIDTH_Rate, 130*WIDTH_Rate));
    }];
    yellowView.backgroundColor = COLOR_Yellow;
    yellowView.layer.cornerRadius = 130*WIDTH_Rate/2.0;
    
    UIView *redView = [[UIView alloc] init];
    [yellowView addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(yellowView.mas_centerX);
        make.centerY.equalTo(yellowView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(115*WIDTH_Rate, 115*WIDTH_Rate));
    }];
    redView.backgroundColor = COLOR_Red;
    redView.layer.cornerRadius = 115*WIDTH_Rate/2.0;
 
    self.percentLabel = [[UILabel alloc] init];
    [redView addSubview:self.percentLabel];
    [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(redView.mas_centerX);
        make.bottom.equalTo(redView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100*WIDTH_Rate, 30*WIDTH_Rate));
    }];
    self.percentLabel.text = @"0%";
    self.percentLabel.textAlignment = NSTextAlignmentCenter;
    self.percentLabel.font = [UIFont boldSystemFontOfSize:35*WIDTH_Rate];
    self.percentLabel.textColor = [UIColor whiteColor];
    
    UILabel *percentLabel = [[UILabel alloc] init];
    [redView addSubview:percentLabel];
    [percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(redView.mas_centerX);
        make.top.equalTo(redView.mas_centerY).with.offset(7*HEIGHT_Rate);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 30*WIDTH_Rate));
    }];
    percentLabel.text = @"年化收益";
    percentLabel.textAlignment = NSTextAlignmentCenter;
    percentLabel.font = [UIFont systemFontOfSize:16*HEIGHT_Rate];
    percentLabel.textColor = [UIColor whiteColor];
    
    UIImageView *circleLineImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circleLine"]];
    [self addSubview:circleLineImg];
    [circleLineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yellowView.mas_bottom).with.offset(-25*HEIGHT_Rate);
        make.left.equalTo(_view.mas_left).with.offset(15*WIDTH_Rate);
        make.right.equalTo(_view.mas_right).with.offset(-15*WIDTH_Rate);
        make.height.mas_equalTo(@(40*HEIGHT_Rate));
    }];
    
//起头金额
    UILabel *startMoneyLabel = [[UILabel alloc] init];
    [self addSubview:startMoneyLabel];
    [startMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(redView.mas_centerY);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(yellowView.mas_left).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    startMoneyLabel.text = @"起头金额";
    startMoneyLabel.textAlignment = NSTextAlignmentCenter;
    startMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.startMoneyLabel = [[UILabel alloc] init];
    [self addSubview:self.startMoneyLabel];
    [self.startMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startMoneyLabel.mas_bottom);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(yellowView.mas_left).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.startMoneyLabel.text = @"0";
    self.startMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.startMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.startMoneyLabel.textColor = [UIColor whiteColor];

//期限
    UILabel *limitLabel = [[UILabel alloc] init];
    [self addSubview:limitLabel];
    [limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(redView.mas_centerY);
        make.right.equalTo(_view.mas_right);
        make.left.equalTo(yellowView.mas_right).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    limitLabel.text = @"期限（月）";
    limitLabel.textAlignment = NSTextAlignmentCenter;
    limitLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.limitLabel = [[UILabel alloc] init];
    [self addSubview:self.limitLabel];
    [self.limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(limitLabel.mas_bottom);
        make.right.equalTo(_view.mas_right);
        make.left.equalTo(yellowView.mas_right).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.limitLabel.text = @"0";
    self.limitLabel.textAlignment = NSTextAlignmentCenter;
    self.limitLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.limitLabel.textColor = [UIColor whiteColor];
    
    
//还本息方式
    UILabel *payWayLabel = [[UILabel alloc] init];
    [self addSubview:payWayLabel];
    [payWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.limitLabel.mas_bottom).with.offset(10*HEIGHT_Rate);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(yellowView.mas_left).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    payWayLabel.text = @"还本息方式";
    payWayLabel.textAlignment = NSTextAlignmentCenter;
    payWayLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.payWayLabel = [[UILabel alloc] init];
    [self addSubview:self.payWayLabel];
    [self.payWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(payWayLabel.mas_bottom);
        make.left.equalTo(_view.mas_left);
        make.right.equalTo(yellowView.mas_left).with.offset(0);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.payWayLabel.text = @"等额本金";
    self.payWayLabel.textAlignment = NSTextAlignmentCenter;
    self.payWayLabel.font = [UIFont systemFontOfSize:14*HEIGHT_Rate];
    self.payWayLabel.textColor = [UIColor whiteColor];
    
    
//可投金额
    UILabel *inputMoneyLabel = [[UILabel alloc] init];
    [self addSubview:inputMoneyLabel];
    [inputMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(payWayLabel.mas_top);
        make.left.equalTo(yellowView.mas_right);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    inputMoneyLabel.text = @"可投金额";
    inputMoneyLabel.textAlignment = NSTextAlignmentCenter;
    inputMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.inputMoneyLabel = [[UILabel alloc] init];
    [self addSubview:self.inputMoneyLabel];
    [self.inputMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputMoneyLabel.mas_bottom);
        make.left.equalTo(yellowView.mas_right);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@(25*HEIGHT_Rate));
    }];
    self.inputMoneyLabel.text = @"0";
    self.inputMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.inputMoneyLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    self.inputMoneyLabel.textColor = [UIColor whiteColor];

}

- (void)buttonClick:(UIButton *)button {
    self.sendButtonBlock(button);
}

@end
