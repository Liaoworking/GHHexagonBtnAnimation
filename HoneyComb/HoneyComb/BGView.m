//
//  BGView.m
//  HoneyComb
//
//  Created by Guanghui Liao on 8/15/16.
//  Copyright © 2016 Guanghui Liao. All rights reserved.
//

#import "BGView.h"

@implementation BGView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSLog(@"bjbdy");
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:40 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]set];
    [[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]setFill];
    CGContextDrawPath(ctx, kCGPathEOFillStroke);
    
    path.lineWidth = 10;
    
    CGContextStrokePath(ctx);
}


@end
