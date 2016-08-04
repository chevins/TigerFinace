//
//  MineModel.h
//  TigerFinace
//
//  Created by mooner on 16/7/30.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModel : NSObject

@property (strong , nonatomic , nonnull) NSString *assetsMoney;//总资产
@property (strong , nonatomic , nonnull) NSString *earnMoney;//累计收益
@property (strong , nonatomic , nonnull) NSString *balance;//可用余额
@property (strong , nonatomic , nonnull) NSString *interes;//待收本息
@property (strong , nonatomic , nonnull) NSString *freezonMoney;//冻结金额

@end
