//
//  FactoringProductView.h
//  TigerFinace
//
//  Created by mooner on 16/7/23.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "BasicView.h"
#import "FactoringProducHeader.h"
#import "FactoringProductModel.h"

@interface FactoringProductView : BasicView

@property (strong , nonatomic ,nonnull) UIScrollView *scrollContainer;
@property (strong , nonatomic ,nonnull) UITableView *factoringTableView;
@property (strong , nonatomic ,nonnull) FactoringProducHeader *FPHeader;

- (void)fillViewWithModel:(FactoringProductModel *_Nonnull)model;

@end
