//
//  FactoringProductCell.m
//  TigerFinace
//
//  Created by mooner on 16/7/25.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "FactoringProductCell.h"

@implementation FactoringProductCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)fillCellWithTitle:(NSString *)title content:(NSString *)content row:(NSInteger)row{
    self.titleLabel.text = title;
    if (row == 0) {
       self.contentLabel.text = [NSString stringWithFormat:@"%@人已购买",content];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.contentLabel.text];
        long stringLenght = content.length;
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(stringLenght,stringLenght-3)];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13*HEIGHT_Rate] range:NSMakeRange(stringLenght,stringLenght-3)];
        self.contentLabel.attributedText = str;
    }
   
}

- (void)createUI {
    __weak UIView *_view = self.contentView;
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_view.mas_centerY);
        make.left.equalTo(_view.mas_left).with.offset(12);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    self.titleLabel.font = [UIFont systemFontOfSize:15*HEIGHT_Rate];
    
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_view.mas_centerY);
        make.right.equalTo(_view.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(180, 30));
    }];
    self.contentLabel.font = [UIFont systemFontOfSize:14*HEIGHT_Rate];
    self.contentLabel.textColor = COLOR_Red;
    self.contentLabel.textAlignment = NSTextAlignmentRight;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
