//
//  FactoringProductModel.h
//  TigerFinace
//
//  Created by mooner on 16/7/30.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactoringProductModel : NSObject

@property (assign , nonatomic)          CGFloat startMoney;//起头金额
@property (assign , nonatomic)          NSInteger limite;//期限(月)
@property (strong , nonatomic, nonnull) NSString *payWay;//还本息方式
@property (assign , nonatomic)          CGFloat invenstMoney;//可投金额
@property (assign , nonatomic)          CGFloat progress;//年化收益,取值范围为0-1

@end
