//
//  MineHeader.h
//  TigerFinace
//
//  Created by mooner on 16/7/25.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "BasicView.h"

@interface MineHeader : BasicView

@property (strong , nonatomic , nonnull) UIButton *infoButton;
@property (strong , nonatomic , nonnull) UIButton *shareButton;
@property (strong , nonatomic , nonnull) UIButton *invenstAgainButton;
@property (strong , nonatomic , nonnull) UILabel *assetsLabel;
@property (strong , nonatomic , nonnull) UILabel *earnMoneyLabel;
@property (strong , nonatomic , nonnull) UILabel *balanceLabel;
@property (strong , nonatomic , nonnull) UILabel *interestLabel;
@property (strong , nonatomic , nonnull) UILabel *freezonMoneyLabel;

@end
