//
//  FuncCell.h
//  TigerFinace
//
//  Created by mooner on 16/7/26.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FuncCell : UICollectionViewCell

@property (strong , nonatomic , nonnull) UIImageView *funcImageView;
@property (strong , nonatomic , nonnull) UILabel *funcTitleLabel;

- (void)fillCellWithTitle:(NSString *_Nonnull)title image:(NSString *_Nonnull)image;

@end
