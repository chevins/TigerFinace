//
//  ItemListCell.h
//  TigerFinace
//
//  Created by mooner on 16/7/27.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieProgressView.h"
#import "ItemModel.h"

@interface ItemListCell : UITableViewCell

@property (strong , nonatomic , nonnull) UIView *colorView;//左边的颜色块
@property (strong , nonatomic , nonnull) UILabel *typeLabl;//产品类型
@property (strong , nonatomic , nonnull) UILabel *itemLabel;//项目
@property (strong , nonatomic , nonnull) UILabel *yearReturnLabel;//年化收益
@property (strong , nonatomic , nonnull) UILabel *startMoneyLabel;//起投金额
@property (strong , nonatomic , nonnull) UILabel *limitLabel;//期限
@property (strong , nonatomic , nonnull) PieProgressView *progressView;

- (void)fillCellWithModel:(ItemModel *_Nonnull)model;

@end
