//
//  IteamView.h
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "BasicView.h"


@interface ItemListView : BasicView

@property (strong , nonatomic , nonnull) UITableView *itemListTabelView;

@property (copy , nonatomic , nonnull) sendUIViewBlock sendSegmentBlock;



@end
