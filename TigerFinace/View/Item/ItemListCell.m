//
//  ItemListCell.m
//  TigerFinace
//
//  Created by mooner on 16/7/27.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "ItemListCell.h"

@implementation ItemListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)fillCellWithModel:(ItemModel *_Nonnull)model {
    if (model.type == 1) {
        self.colorView.backgroundColor = COLOR_Green;
    } else if (model.type == 2) {
        self.colorView.backgroundColor = COLOR_Blue;
    } else {
        self.colorView.backgroundColor = COLOR_Purple;
    }
    
    self.typeLabl.text = model.typeName;
    self.itemLabel.text = model.item;
    self.yearReturnLabel.text = [NSString stringWithFormat:@"%.0f%%",model.yearProgress];
    self.startMoneyLabel.text = [NSString stringWithFormat:@"%.0f",model.startMoney];
    self.limitLabel.text = [NSString stringWithFormat:@"%.0f",model.limite];
    self.progressView.progress = model.progress;
}


- (void)createUI {
    __weak UIView *_view = self.contentView;
    
    UIView *whiteView = [[UIView alloc] init];
    [self.contentView addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.mas_top).with.offset(10);
        make.left.equalTo(_view);
        make.right.equalTo(_view);
        make.bottom.equalTo(_view);
    }];
    whiteView.backgroundColor = [UIColor whiteColor];
    
    UIView *topLineView = [[UIView alloc] init];
    [whiteView addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(whiteView.mas_top);
        make.left.equalTo(whiteView.mas_left);
        make.right.equalTo(whiteView.mas_right);
        make.height.mas_equalTo(@1);
    }];
    topLineView.backgroundColor = COLOR_SeparatorLine;
    
    self.colorView = [[UIView alloc] init];
    [self.contentView addSubview:self.colorView];
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view.mas_left);
        make.top.equalTo(whiteView.mas_top);
        make.bottom.equalTo(_view.mas_bottom);
        make.width.mas_equalTo(@(6*WIDTH_Rate));
    }];
    
    UIImageView *typeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"itemType"]];
    [self.contentView addSubview:typeImageView];
    [typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.colorView.mas_right).with.offset(7*WIDTH_Rate);
        make.top.equalTo(_view.mas_top).with.offset(7*HEIGHT_Rate);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 25*HEIGHT_Rate));
    }];
    
    self.typeLabl = [[UILabel alloc] init];
    [typeImageView addSubview:self.typeLabl];
    [self.typeLabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(typeImageView);
        make.size.mas_equalTo(CGSizeMake(80, 25));
    }];
    self.typeLabl.textAlignment = NSTextAlignmentCenter;
    self.typeLabl.textColor = [UIColor whiteColor];
    self.typeLabl.font = [UIFont systemFontOfSize:13*WIDTH_Rate];
    
    self.itemLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.itemLabel];
    [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(typeImageView.mas_bottom).with.offset(2);
        make.left.equalTo(self.colorView.mas_right).with.offset(20*WIDTH_Rate);
        make.right.equalTo(_view.mas_right);
        make.height.mas_equalTo(@24);
    }];
    self.itemLabel.textColor = [UIColor blackColor];
    self.itemLabel.font = [UIFont systemFontOfSize:12*WIDTH_Rate];
    
    UIView *lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.colorView.mas_right).with.offset(10);
        make.right.equalTo(_view.mas_right);
        make.top.equalTo(self.itemLabel.mas_bottom).with.offset(4);
        make.height.mas_equalTo(@1);
    }];
    lineView.backgroundColor = COLOR_SeparatorLine;
    
    self.yearReturnLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.yearReturnLabel];
    [self.yearReturnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(12*HEIGHT_Rate);
        make.left.equalTo(self.colorView.mas_right).with.offset(15*WIDTH_Rate);
        make.size.mas_equalTo(CGSizeMake(90*WIDTH_Rate, 30*HEIGHT_Rate));
    }];
    self.yearReturnLabel.textAlignment = NSTextAlignmentCenter;
    self.yearReturnLabel.textColor = [UIColor redColor];
    self.yearReturnLabel.font = [UIFont systemFontOfSize:25*WIDTH_Rate];
    
    UILabel *yearReturnLabel = [[UILabel alloc] init];
    [self.contentView addSubview:yearReturnLabel];
    [yearReturnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearReturnLabel.mas_bottom);
        make.centerX.equalTo(self.yearReturnLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 20*HEIGHT_Rate));
    }];
    yearReturnLabel.text = @"年化收益";
    yearReturnLabel.textAlignment = NSTextAlignmentCenter;
    yearReturnLabel.textColor = [UIColor grayColor];
    yearReturnLabel.font = [UIFont systemFontOfSize:11*WIDTH_Rate];
    
    UIView *columnLineView = [[UIView alloc] init];
    [self.contentView addSubview:columnLineView];
    [columnLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearReturnLabel.mas_top).with.offset(5);
        make.left.equalTo(self.yearReturnLabel.mas_right);
        make.bottom.equalTo(yearReturnLabel.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@0.6);
    }];
    columnLineView.backgroundColor = [UIColor lightGrayColor];

//起投金额
    self.startMoneyLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.startMoneyLabel];
    [self.startMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15*HEIGHT_Rate);
        make.left.equalTo(columnLineView.mas_right);
        make.size.mas_equalTo(CGSizeMake(85*WIDTH_Rate, 25*HEIGHT_Rate));
    }];
    self.startMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.startMoneyLabel.textColor = [UIColor blackColor];
    self.startMoneyLabel.font = [UIFont systemFontOfSize:13*WIDTH_Rate];
    
    UILabel *startMoneyLabel = [[UILabel alloc] init];
    [self.contentView addSubview:startMoneyLabel];
    [startMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.startMoneyLabel.mas_bottom);
        make.centerX.equalTo(self.startMoneyLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 20*HEIGHT_Rate));
    }];
    startMoneyLabel.text = @"起投金额";
    startMoneyLabel.textAlignment = NSTextAlignmentCenter;
    startMoneyLabel.textColor = [UIColor grayColor];
    startMoneyLabel.font = [UIFont systemFontOfSize:11*WIDTH_Rate];
    
    UIView *columnLineView2 = [[UIView alloc] init];
    [self.contentView addSubview:columnLineView2];
    [columnLineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearReturnLabel.mas_top).with.offset(5);
        make.left.equalTo(self.startMoneyLabel.mas_right).with.offset(1);
        make.bottom.equalTo(yearReturnLabel.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@0.6);
    }];
    columnLineView2.backgroundColor = [UIColor lightGrayColor];
    
//期限
    self.limitLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.limitLabel];
    [self.limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15*HEIGHT_Rate);
        make.left.equalTo(columnLineView2.mas_right).with.offset(1);
        make.size.mas_equalTo(CGSizeMake(85*WIDTH_Rate, 25*HEIGHT_Rate));
    }];
    self.limitLabel.textAlignment = NSTextAlignmentCenter;
    self.limitLabel.textColor = [UIColor blackColor];
    self.limitLabel.font = [UIFont systemFontOfSize:13*WIDTH_Rate];
    
    UILabel *limitLabel = [[UILabel alloc] init];
    [self.contentView addSubview:limitLabel];
    [limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.limitLabel.mas_bottom);
        make.centerX.equalTo(self.limitLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70*WIDTH_Rate, 20*HEIGHT_Rate));
    }];
    limitLabel.text = @"期限（月）";
    limitLabel.textAlignment = NSTextAlignmentCenter;
    limitLabel.textColor = [UIColor grayColor];
    limitLabel.font = [UIFont systemFontOfSize:11*WIDTH_Rate];
    
    self.progressView = [[PieProgressView alloc] init];
    [self.contentView addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.right.equalTo(_view.mas_right).with.offset(-15*WIDTH_Rate);
        make.size.mas_equalTo(CGSizeMake(75*HEIGHT_Rate, 75*HEIGHT_Rate));
    }];
    
    UIView *bottomLineView = [[UIView alloc] init];
    [whiteView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(whiteView.mas_bottom);
        make.left.equalTo(whiteView.mas_left);
        make.right.equalTo(whiteView.mas_right);
        make.height.mas_equalTo(@1);
    }];
    bottomLineView.backgroundColor = COLOR_SeparatorLine;
    
}

@end
