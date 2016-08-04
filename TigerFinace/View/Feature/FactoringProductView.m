//
//  FactoringProductView.m
//  TigerFinace
//
//  Created by mooner on 16/7/23.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FactoringProductView.h"

@implementation FactoringProductView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)fillViewWithModel:(FactoringProductModel *)model {
    self.FPHeader.startMoneyLabel.text = [NSString stringWithFormat:@"%.0f",model.startMoney];
    self.FPHeader.limitLabel.text = [NSString stringWithFormat:@"%ld",model.limite];
    self.FPHeader.payWayLabel.text = model.payWay;
    self.FPHeader.inputMoneyLabel.text = [NSString stringWithFormat:@"%.0f",model.invenstMoney];
     self.FPHeader.percentLabel.text = [NSString stringWithFormat:@"%.0f%%",model.progress];
}


- (void)createUI {
    
    __weak UIView  *_view =  self;
    
    self.scrollContainer = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49)];
    self.scrollContainer.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-48);
    [self addSubview:self.scrollContainer];
    
    self.FPHeader = [[FactoringProducHeader alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 270*HEIGHT_Rate)];
    [self.scrollContainer addSubview:self.FPHeader];
    [self.FPHeader.backButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.factoringTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 285*HEIGHT_Rate, SCREENWIDTH, 220*HEIGHT_Rate)];
    [self.scrollContainer addSubview:self.factoringTableView];
    self.factoringTableView.backgroundColor = COLOR_Background;
    self.factoringTableView.scrollEnabled = NO;
    
    UIView *buttonContainer = [[UIView alloc] init];
    [self.scrollContainer addSubview:buttonContainer];
    [buttonContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.scrollContainer.mas_top).with.offset(SCREENHEIGHT-49);
        make.left.equalTo(_view.mas_left);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 55*HEIGHT_Rate));
    }];
    buttonContainer.backgroundColor = [UIColor whiteColor];
    buttonContainer.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    buttonContainer.layer.shadowOpacity = 0.4;
    
    UIButton *inventButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonContainer addSubview:inventButton];
    [inventButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonContainer.mas_left).with.offset(12);
        make.centerY.equalTo(buttonContainer.mas_centerY);
        make.right.equalTo(buttonContainer.mas_right).with.offset(-12);
        make.height.mas_equalTo(@(43*HEIGHT_Rate));
    }];
    inventButton.backgroundColor = COLOR_Red;
    [inventButton setTitle:@"立即投资" forState:UIControlStateNormal];
    [inventButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [inventButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    inventButton.titleLabel.font = [UIFont systemFontOfSize:16*HEIGHT_Rate];
    inventButton.tag = 1002;
    
}

- (void)buttonClick:(UIButton *)button {
    self.sendButtonBlock(button);
}

@end
