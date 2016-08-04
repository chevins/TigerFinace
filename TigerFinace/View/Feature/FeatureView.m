//
//  FeatureView.m
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FeatureView.h"

@implementation FeatureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         self.duration = 4;
        [self createUI];
        self.time = 0;
       
    }
    return self;
}

- (void)fillViewWithModel:(FeatrueModel *)model {
    self.payToLabel.text = model.payToString;//汇付公告
    //付款公告
    self.repayLabel.text = model.repayString;
    //投资总金额
    self.inventAllMoney.text = [NSString stringWithFormat:@"平台投资总额(元):%@",model.inventAllMoney];
    //年化收益，取值范围在0-1之间
    self.progressView.progress = model.progress;
    //项目期限
    self.limitLabel.text = [NSString stringWithFormat:@"%ld天",model.limite];
    NSMutableAttributedString *limitString = [[NSMutableAttributedString alloc] initWithString:self.limitLabel.text];
    long stringLenght = self.limitLabel.text.length-1;
    [limitString addAttribute:NSForegroundColorAttributeName value:COLOR_Orange range:NSMakeRange(0,stringLenght)];
    [limitString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14*HEIGHT_Rate] range:NSMakeRange(0,stringLenght)];
    self.limitLabel.attributedText = limitString;
   
    //项目总额
    self.allMoneyLabel.text = [NSString stringWithFormat:@"%@元",model.itemAllMoney];
    NSMutableAttributedString *allMoneyString = [[NSMutableAttributedString alloc] initWithString:self.allMoneyLabel.text];
    long stringLenght2 = self.allMoneyLabel.text.length-1;
    [allMoneyString addAttribute:NSForegroundColorAttributeName value:COLOR_Orange range:NSMakeRange(0,stringLenght2)];
    [allMoneyString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14*HEIGHT_Rate] range:NSMakeRange(0,stringLenght2)];
    self.allMoneyLabel.attributedText = allMoneyString;
    
    //购买人数
    self.buyPeopleLabel.text = [NSString stringWithFormat:@"%ld人",model.buyPeople];
    NSMutableAttributedString *buyPeopleString = [[NSMutableAttributedString alloc] initWithString:self.buyPeopleLabel.text];
    long stringLenght3 = self.buyPeopleLabel.text.length-1;
    [buyPeopleString addAttribute:NSForegroundColorAttributeName value:COLOR_Orange range:NSMakeRange(0,stringLenght3)];
    [buyPeopleString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14*HEIGHT_Rate] range:NSMakeRange(0,stringLenght3)];
    self.buyPeopleLabel.attributedText = buyPeopleString;
}


- (void)createUI {
    
    __weak UIView  *_view =  self;
    
    
    self.containView = [[UIScrollView alloc] init];
    [self addSubview:self.containView];
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.mas_top);
        make.left.equalTo(_view.mas_left);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT-64-49));
    }];
    self.containView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-64-48);
    self.containView.backgroundColor = COLOR_Background;
    
    
    self.bannerSwipeView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 170*HEIGHT_Rate)];
    [self.containView addSubview:self.bannerSwipeView];
    
    self.speakerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 170*HEIGHT_Rate, SCREENWIDTH, 42*HEIGHT_Rate)];
    self.speakerView.contentSize = CGSizeMake( SCREENWIDTH, 42*3*HEIGHT_Rate);
    self.speakerView.contentOffset = CGPointMake(0, 42*HEIGHT_Rate);
    [self.containView addSubview:self.speakerView];
    
    
    UIView *grayViews = [[UIView alloc] init];
    grayViews.backgroundColor = COLOR_Background_LightGray;
    [self.speakerView addSubview:grayViews];
    [grayViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speakerView.mas_top);
        make.left.equalTo(self.speakerView);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 42*HEIGHT_Rate));
    }];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"invenst"]];
    [grayViews addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view.mas_left).with.offset(15);
        make.centerY.equalTo(grayViews.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20*WIDTH_Rate, 15*HEIGHT_Rate));
    }];
    
    self.inventAllMoney = [[UILabel alloc] init];
    [grayViews addSubview:self.inventAllMoney];
    [self.inventAllMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).with.offset(8);
        make.centerY.equalTo(grayViews.mas_centerY);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@30);
    }];
    
    self.inventAllMoney.textColor = [UIColor grayColor];
    self.inventAllMoney.font = [UIFont systemFontOfSize:14*WIDTH_Rate];
    
    
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = COLOR_Background_LightGray;
    [self.speakerView addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayViews.mas_bottom);
        make.left.equalTo(self.speakerView);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 42*HEIGHT_Rate));
    }];
    
    
    UIView *grayView3 = [[UIView alloc] init];
    grayView3.backgroundColor = COLOR_Background_LightGray;
    [self.speakerView addSubview:grayView3];
    [grayView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayView.mas_bottom);
        make.left.equalTo(self.speakerView);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 42*HEIGHT_Rate));
    }];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"invenst"]];
    [grayView3 addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view.mas_left).with.offset(15);
        make.centerY.equalTo(grayView3.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20*WIDTH_Rate, 15*HEIGHT_Rate));
    }];
    
    self.inventAllMoney = [[UILabel alloc] init];
    [grayView3 addSubview:self.inventAllMoney];
    [self.inventAllMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView3.mas_right).with.offset(8);
        make.centerY.equalTo(grayView3.mas_centerY);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@30);
    }];
    self.inventAllMoney.textColor = [UIColor grayColor];
    self.inventAllMoney.font = [UIFont systemFontOfSize:14*WIDTH_Rate];

    
    
//老虎公告
    UIImageView *announceImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tigerAnnounce"]];
    [grayView addSubview:announceImg];
    [announceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayView).with.offset(5*HEIGHT_Rate);
        make.left.equalTo(grayView).with.offset(20*WIDTH_Rate);
        make.bottom.equalTo(grayView).with.offset(-5*HEIGHT_Rate);
        make.width.mas_equalTo(@(55*WIDTH_Rate));
    }];
    
//汇付公告
    UILabel *payToLabel = [[UILabel alloc] init];
    [grayView addSubview:payToLabel];
    [payToLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayView.mas_top).offset(5*HEIGHT_Rate);
        make.left.equalTo(announceImg.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(50*WIDTH_Rate, 14*HEIGHT_Rate));
    }];
    payToLabel.text = @"汇付公告";
    payToLabel.font = [UIFont systemFontOfSize:10*HEIGHT_Rate];
    payToLabel.textColor = [UIColor redColor];
    payToLabel.textAlignment = NSTextAlignmentCenter;
    payToLabel.layer.borderWidth = 0.7;
    payToLabel.layer.borderColor = [UIColor redColor].CGColor;
    payToLabel.layer.cornerRadius = 3;
    
    self.payToLabel = [[UILabel alloc] init];
    [grayView addSubview:self.payToLabel];
    [self.payToLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(payToLabel.mas_centerY);
        make.left.equalTo(payToLabel.mas_right).with.offset(8);
        make.right.equalTo(grayView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@13);
    }];
    self.payToLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
    
//还款公告
    UILabel *repayLabel = [[UILabel alloc] init];
    [grayView addSubview:repayLabel];
    [repayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(grayView.mas_bottom).offset(-5*HEIGHT_Rate);
        make.left.equalTo(announceImg.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(50*WIDTH_Rate, 14*HEIGHT_Rate));
    }];
    repayLabel.text = @"还款公告";
    repayLabel.font = [UIFont systemFontOfSize:10*HEIGHT_Rate];
    repayLabel.textColor = [UIColor redColor];
    repayLabel.textAlignment = NSTextAlignmentCenter;
    repayLabel.layer.borderWidth = 0.7;
    repayLabel.layer.borderColor = [UIColor redColor].CGColor;
    repayLabel.layer.cornerRadius = 3;
    
    self.repayLabel = [[UILabel alloc] init];
    [grayView addSubview:self.repayLabel];
    [self.repayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(repayLabel.mas_centerY);
        make.left.equalTo(repayLabel.mas_right).with.offset(8);
        make.right.equalTo(grayView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@13);
    }];
    self.repayLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];

    UILabel *newLabel = [[UILabel alloc] init];
    [self.containView addSubview:newLabel];
    [newLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speakerView.mas_bottom).with.offset(15);
        make.left.equalTo(_view.mas_left).with.offset(25);
        make.size.mas_equalTo(CGSizeMake(65*WIDTH_Rate, 23*HEIGHT_Rate));
    }];
    newLabel.text = @"新手标";
    newLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    newLabel.textColor = [UIColor whiteColor];
    newLabel.textAlignment = NSTextAlignmentCenter;
    newLabel.layer.cornerRadius = 3;
    newLabel.layer.masksToBounds = YES;
    newLabel.backgroundColor = COLOR_Orange;
    
    
    self.progressView = [[PieWithLineProgressView alloc] init];
    [self.containView addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.top.equalTo(newLabel.mas_bottom).with.offset(-25*HEIGHT_Rate);
        make.size.mas_equalTo(CGSizeMake(245*HEIGHT_Rate, 245*HEIGHT_Rate));
    }];
    self.progressView.progress = 1;
    self.progressView.backgroundColor = [UIColor clearColor];
    
    UIButton *investButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.containView addSubview:investButton];
    [investButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view.mas_left).with.offset(40*HEIGHT_Rate);
        make.right.equalTo(_view.mas_right).with.offset(-40*HEIGHT_Rate);
        make.bottom.equalTo(self.containView.mas_top).with.offset(SCREENHEIGHT-64-49-15*HEIGHT_Rate);
        make.height.mas_equalTo(@(35*HEIGHT_Rate));
    }];
    investButton.backgroundColor = COLOR_Orange;
    [investButton setTitle:@"立即投资" forState:UIControlStateNormal];
    investButton.titleLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    investButton.titleLabel.textColor = [UIColor whiteColor];
    [investButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
//项目期限
    self.limitLabel = [[UILabel alloc] init];
    [self.containView addSubview:self.limitLabel];
    [self.limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(investButton.mas_top).with.offset(-25*HEIGHT_Rate);
        make.left.equalTo(_view.mas_left).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/3.0-30, 20*HEIGHT_Rate));
    }];
    self.limitLabel.textAlignment = NSTextAlignmentCenter;
    self.limitLabel.textColor = [UIColor blackColor];
    self.limitLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
    
    UILabel *limitLabel = [[UILabel alloc] init];
    [self.containView addSubview:limitLabel];
    [limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.limitLabel.mas_bottom);
        make.centerX.equalTo(self.limitLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 15*HEIGHT_Rate));
    }];
    limitLabel.text = @"项目期限";
    limitLabel.textAlignment = NSTextAlignmentCenter;
    limitLabel.textColor = [UIColor blackColor];
    limitLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
    
    UIView *columnLineView = [[UIView alloc] init];
    [self.containView addSubview:columnLineView];
    [columnLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.limitLabel.mas_top).with.offset(3);
        make.left.equalTo(self.limitLabel.mas_right);
        make.bottom.equalTo(limitLabel.mas_bottom).with.offset(-3);
        make.width.mas_equalTo(@0.8);
    }];
    columnLineView.backgroundColor = [UIColor lightGrayColor];
    
//项目总额
    self.allMoneyLabel = [[UILabel alloc] init];
    [self.containView addSubview:self.allMoneyLabel];
    [self.allMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.limitLabel.mas_top);
        make.left.equalTo(columnLineView.mas_right);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/3.0, 20*HEIGHT_Rate));
    }];
    self.allMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.allMoneyLabel.textColor = [UIColor blackColor];
    self.allMoneyLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
    
    UILabel *allMoneyLabel = [[UILabel alloc] init];
    [self.containView addSubview:allMoneyLabel];
    [allMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allMoneyLabel.mas_bottom);
        make.centerX.equalTo(self.allMoneyLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 15*HEIGHT_Rate));
    }];
    allMoneyLabel.text = @"项目总额";
    allMoneyLabel.textAlignment = NSTextAlignmentCenter;
    allMoneyLabel.textColor = [UIColor blackColor];
    allMoneyLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
    
    UIView *columnLineView2 = [[UIView alloc] init];
    [self.containView addSubview:columnLineView2];
    [columnLineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allMoneyLabel.mas_top).with.offset(3);
        make.left.equalTo(self.allMoneyLabel.mas_right);
        make.bottom.equalTo(allMoneyLabel.mas_bottom).with.offset(-3);
        make.width.mas_equalTo(@0.8);
    }];
    columnLineView2.backgroundColor = [UIColor lightGrayColor];
    
//购买人数
    self.buyPeopleLabel = [[UILabel alloc] init];
    [self.containView addSubview:self.buyPeopleLabel];
    [self.buyPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.limitLabel.mas_top);
        make.left.equalTo(columnLineView2.mas_right).with.offset(1);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/3.0-30, 20*HEIGHT_Rate));
    }];
    self.buyPeopleLabel.textAlignment = NSTextAlignmentCenter;
    self.buyPeopleLabel.textColor = [UIColor blackColor];
    self.buyPeopleLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
    
    UILabel *buyPeopleLabel = [[UILabel alloc] init];
    [self.containView addSubview:buyPeopleLabel];
    [buyPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buyPeopleLabel.mas_bottom);
        make.centerX.equalTo(self.buyPeopleLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 15*HEIGHT_Rate));
    }];
    buyPeopleLabel.text = @"购买人数";
    buyPeopleLabel.textAlignment = NSTextAlignmentCenter;
    buyPeopleLabel.textColor = [UIColor blackColor];
    buyPeopleLabel.font = [UIFont systemFontOfSize:12*HEIGHT_Rate];
   
    
    [[NSRunLoop currentRunLoop] addTimer:[NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(autoPlaySpeaker) userInfo:nil repeats:YES] forMode:NSDefaultRunLoopMode];
    
}

-(void)autoPlaySpeaker {
    if (self.time%2 ==1) {
        [self.speakerView setContentOffset:CGPointMake(0, 0)];
    }
    self.time ++;
     [self.speakerView setContentOffset:CGPointMake(0, 42*HEIGHT_Rate*(self.time%2+1)) animated:YES];
    if (self.time == 3) {
        self.time = 1;
    }
    
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
