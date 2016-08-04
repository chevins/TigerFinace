//
//  FactoringProducHeader.h
//  TigerFinace
//
//  Created by mooner on 16/7/24.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "BasicView.h"

@interface FactoringProducHeader : BasicView

@property (strong , nonatomic , nonnull) UIButton *backButton;//返回按钮
@property (strong , nonatomic , nonnull) UILabel *startMoneyLabel;//起头金额
@property (strong , nonatomic , nonnull) UILabel *payWayLabel;//还本息方式
@property (strong , nonatomic , nonnull) UILabel *limitLabel;//期限
@property (strong , nonatomic , nonnull) UILabel *inputMoneyLabel;//可投金额
@property (strong , nonatomic , nonnull) UILabel *percentLabel;//年化收益

@end
