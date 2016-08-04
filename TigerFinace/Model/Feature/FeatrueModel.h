//
//  FeatrueModel.h
//  TigerFinace
//
//  Created by mooner on 16/7/30.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatrueModel : NSObject

@property (strong , nonatomic, nonnull) NSString *payToString;//汇付公告
@property (strong , nonatomic, nonnull) NSString *repayString;//还款公告
@property (assign , nonatomic)          NSInteger limite;//项目期限
@property (strong , nonatomic, nonnull) NSString *itemAllMoney;//项目总额
@property (assign , nonatomic)          NSInteger buyPeople;//购买人数
@property (assign , nonatomic)          CGFloat progress;//年化收益,取值范围为0-1
@property (strong , nonatomic, nonnull) NSString *inventAllMoney;//投资总额
@end
