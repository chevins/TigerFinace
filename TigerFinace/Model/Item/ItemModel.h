//
//  ItemModel.h
//  TigerFinace
//
//  Created by mooner on 16/7/30.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (assign , nonatomic) NSInteger type;//产品类型
@property (strong , nonatomic , nonnull) NSString *typeName;//产品名
@property (strong , nonatomic , nonnull) NSString *item;//项目
@property (assign , nonatomic) CGFloat yearProgress;//年化收益
@property (assign , nonatomic) CGFloat startMoney;//起投金额
@property (assign , nonatomic) CGFloat limite;//期限
@property (assign , nonatomic) CGFloat progress;

@end
