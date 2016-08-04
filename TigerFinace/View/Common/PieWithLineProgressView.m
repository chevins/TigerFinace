//
//  PieWithLineProgressView.m
//  TigerFinace
//
//  Created by mooner on 16/7/23.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "PieWithLineProgressView.h"

@implementation PieWithLineProgressView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
      
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [COLOR_Orange set];
    
    CGContextSetLineWidth(ctx, 4);
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - SDProgressViewItemMargin;
    CGContextAddArc(ctx, xCenter, yCenter, radius, 0, 2*M_PI, NO);
    CGContextStrokePath(ctx);
    
    
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    CGFloat xCenter2 = rect.size.width * 0.5;
    CGFloat yCenter2 = rect.size.height * 0.5;
    [[UIColor colorWithRed:213/255.0 green:214/255.0 blue:216/255.0 alpha:1.0] set];
   
    
    CGContextSetLineWidth(ctx2, 4);
    CGFloat radius2 = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDProgressViewItemMargin;
    CGContextAddArc(ctx2, xCenter2, yCenter2, radius2, -0.5*M_PI,-0.5*M_PI+self.progress*M_PI*2, 0);
    CGContextStrokePath(ctx2);
    
    
    CGContextRef ctx3 = UIGraphicsGetCurrentContext();
    CGFloat xCenter3 = (rect.size.width) * 0.5;
    CGFloat yCenter3 = (rect.size.height) * 0.5;
    [COLOR_Orange set];
    
    CGContextSetLineWidth(ctx3, 14);
    CGFloat radius3 = rect.size.width * 0.5 - SDProgressViewItemMargin;
    CGContextAddArc(ctx3, xCenter3, yCenter3, radius3, -0.5*M_PI+self.progress*M_PI*2,-0.5*M_PI+0.1/M_PI+self.progress*M_PI*2, 0);
    CGContextStrokePath(ctx3);
    // 加载时显示的文字
    NSString * const SDRotationLoopProgressViewWaitingText = [NSString stringWithFormat:@"%.0f%%",100-self.progress*100];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:12 * SDProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = COLOR_Orange;
    CGSize strSize = [SDRotationLoopProgressViewWaitingText sizeWithAttributes:attributes];
    CGFloat strX = xCenter - strSize.width * 0.5;
    CGFloat strY = yCenter - strSize.height * 0.92;
    [SDRotationLoopProgressViewWaitingText drawAtPoint:CGPointMake(strX, strY) withAttributes:attributes];
     CGSize str2Size = [@"年化收益" sizeWithAttributes:attributes];
    CGFloat str2X = xCenter - str2Size.width * 0.5;
    CGFloat str2Y = yCenter - str2Size.height * 0.08;
    [@"年化收益" drawAtPoint:CGPointMake(str2X, str2Y) withAttributes:attributes];
    
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.0f%%",self.progress*100] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor orangeColor]}];
    [attrStr2 drawAtPoint:CGPointMake(xCenter3-12+(radius3+21)*cos(-0.5*M_PI+self.progress*M_PI*2), yCenter3-7+(radius3+15)*sin(-0.5*M_PI+self.progress*M_PI*2))];
}
 


@end
