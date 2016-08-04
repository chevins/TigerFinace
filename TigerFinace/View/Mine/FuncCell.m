//
//  FuncCell.m
//  TigerFinace
//
//  Created by mooner on 16/7/26.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FuncCell.h"

@implementation FuncCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)fillCellWithTitle:(NSString *)title image:(NSString *)image {
    self.funcTitleLabel.text = title;
    self.funcImageView.image = [UIImage imageNamed:image];
}

- (void)createUI {
    __weak UIView *_view = self;
    
    self.funcImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.funcImageView];
    [self.funcImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.centerY.equalTo(_view.mas_centerY).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(30*WIDTH_Rate, 25*WIDTH_Rate));
    }];
    self.funcImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.funcTitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.funcTitleLabel];
    [self.funcTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_view.mas_centerX);
        make.top.equalTo(self.funcImageView.mas_bottom).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 25));
    }];
    self.funcTitleLabel.font = [UIFont systemFontOfSize:12*WIDTH_Rate];
    self.funcTitleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
