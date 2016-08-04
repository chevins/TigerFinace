//
//  FeatureView.h
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "BasicView.h"
#import "PieWithLineProgressView.h"
#import "SDCycleScrollView.h"
#import "FeatrueModel.h"

@interface FeatureView : BasicView

@property (strong , nonatomic , nonnull) UIScrollView *containView;
@property (strong , nonatomic , nonnull) SDCycleScrollView *bannerSwipeView;//轮播图
@property (strong , nonatomic , nonnull) UIScrollView *speakerView;//广告轮播
@property (strong , nonatomic , nonnull) PieWithLineProgressView *progressView;//年化收益
@property (strong , nonatomic , nonnull) UILabel *payToLabel;//汇付公告
@property (strong , nonatomic , nonnull) UILabel *repayLabel;//还款公告
@property (strong , nonatomic , nonnull) UILabel *limitLabel;//项目期限
@property (strong , nonatomic , nonnull) UILabel *allMoneyLabel;//项目总额
@property (strong , nonatomic , nonnull) UILabel *buyPeopleLabel;//购买人数
@property (strong , nonatomic , nonnull) UILabel *inventAllMoney;//投资总金额
@property (assign , nonatomic) NSInteger time;
@property (assign , nonatomic) NSInteger duration;//公告自动轮播的时间
- (void)fillViewWithModel:(FeatrueModel *_Nonnull)model;

@end
