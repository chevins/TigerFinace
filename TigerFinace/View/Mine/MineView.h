//
//  MineView.h
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "BasicView.h"
#import "MineHeader.h"
#import "MineModel.h"

@interface MineView : BasicView

@property (strong , nonatomic , nonnull) UIScrollView *scrollContainer;
@property (strong , nonatomic , nonnull) MineHeader *mineHeader;
@property (strong , nonatomic , nonnull) UICollectionView *funcCollectionView;
@property (strong , nonatomic , nonnull) UICollectionViewFlowLayout *funcFlowLayout;

- (void)fillViewWithModel:(MineModel *_Nonnull)model;

@end
