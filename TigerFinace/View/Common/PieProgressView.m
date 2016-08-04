//
//  PieProgressView.m
//  TigerFinace
//
//  Created by mooner on 16/7/23.
//  Copyright © 2016年 Chevins. All rights reserved.
//

#import "PieProgressView.h"

@implementation PieProgressView

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
    [COLOR_Red set];
    
    CGContextSetLineWidth(ctx, 2);
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - 10;
    CGContextAddArc(ctx, xCenter, yCenter, radius, 0, 2*M_PI, NO);
    CGContextStrokePath(ctx);
    
    
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    CGFloat xCenter2 = rect.size.width * 0.5;
    CGFloat yCenter2 = rect.size.height * 0.5;
    [[UIColor colorWithRed:213/255.0 green:214/255.0 blue:216/255.0 alpha:1.0] set];
    
    CGContextSetLineWidth(ctx2, 2);
    CGFloat radius2 = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - 10;
    CGContextAddArc(ctx2, xCenter2, yCenter2, radius2, -0.5*M_PI,-0.5*M_PI+(1-self.progress)*M_PI*2, 0);
    CGContextStrokePath(ctx2);
    
    
    // 进度数字
    NSString *progressStr = [NSString stringWithFormat:@"%.0f%s", self.progress * 100, "\%"];
    if (self.progress == 1) {
        progressStr = @"已满标";
    }
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15 * SDProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = COLOR_Red;
    [self setCenterProgressText:progressStr withAttributes:attributes];
}


@end
