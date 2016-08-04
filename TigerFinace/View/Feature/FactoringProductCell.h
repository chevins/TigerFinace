//
//  FactoringProductCell.h
//  TigerFinace
//
//  Created by mooner on 16/7/25.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactoringProductCell : UITableViewCell

@property (strong , nonatomic , nonnull) UILabel *titleLabel;
@property (strong , nonatomic , nonnull) UILabel *peopleLabel;
@property (strong , nonatomic , nonnull) UILabel *contentLabel;

- (void)fillCellWithTitle:(NSString *_Nonnull)title content:(NSString *_Nonnull)content row:(NSInteger)row;

@end
