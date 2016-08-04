//
//  MineView.m
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "MineView.h"

@implementation MineView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)fillViewWithModel:(MineModel *)model {
    self.mineHeader.assetsLabel.text = model.assetsMoney;
    self.mineHeader.earnMoneyLabel.text = model.earnMoney;
    self.mineHeader.balanceLabel.text = model.balance;
    self.mineHeader.interestLabel.text = model.interes;
    self.mineHeader.freezonMoneyLabel.text = model.freezonMoney;
}

- (void)createUI {
    
    __weak UIView  *_view =  self;
    
    self.scrollContainer = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49)];
    self.scrollContainer.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-48);
    [self addSubview:self.scrollContainer];
    
    self.mineHeader = [[MineHeader alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 270*HEIGHT_Rate)];
    [self.scrollContainer addSubview:self.mineHeader];
    [self.mineHeader.infoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.mineHeader.shareButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.mineHeader.invenstAgainButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.funcFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.funcFlowLayout.itemSize = CGSizeMake((SCREENWIDTH-1)/3.0, ((SCREENHEIGHT-270*HEIGHT_Rate-49-50*HEIGHT_Rate-1))/3.0);
    self.funcFlowLayout.minimumInteritemSpacing = 0.5;
    self.funcFlowLayout.minimumLineSpacing = 0.5;
    
    self.funcCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 270*HEIGHT_Rate, SCREENWIDTH, SCREENHEIGHT-270*HEIGHT_Rate-49-50) collectionViewLayout:self.funcFlowLayout];
    self.funcCollectionView.backgroundColor = COLOR_Background_LightGray;
    self.funcCollectionView.scrollEnabled = NO;
    [self.scrollContainer addSubview:self.funcCollectionView];
    
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
    
    UIButton *signOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonContainer addSubview:signOutButton];
    [signOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view.mas_left).with.offset(12);
        make.centerY.equalTo(buttonContainer.mas_centerY);
        make.right.equalTo(buttonContainer.mas_right).with.offset(-12);
        make.height.mas_equalTo(@(43*HEIGHT_Rate));
    }];
    signOutButton.backgroundColor = COLOR_Red;
    [signOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [signOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signOutButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    signOutButton.titleLabel.font = [UIFont systemFontOfSize:16*HEIGHT_Rate];
    signOutButton.tag = 1002;
    
}

- (void)buttonClick:(UIButton *)button {
    self.sendButtonBlock(button);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
