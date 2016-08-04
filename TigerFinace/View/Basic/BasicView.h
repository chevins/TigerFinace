//
//  BasicView.h
//  TigerFinace
//
//  Created by mooner on 16/7/22.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^sendUIViewBlock)(id);

@interface BasicView : UIView

@property (copy, nonatomic) sendUIViewBlock sendButtonBlock;

@end
