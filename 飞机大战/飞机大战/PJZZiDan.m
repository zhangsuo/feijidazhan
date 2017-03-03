//
//  PJZZiDan.m
//  飞机大战
//
//  Created by peijz on 15/9/26.
//  Copyright © 2015年 张锁. All rights reserved.
//

#import "PJZZiDan.h"
#import "PJZYingXiong.h"
#define ZDY 5;
@implementation PJZZiDan
- (instancetype)initWithRect:(CGRect)rect andWithImage:(UIImage *)image andWithYingXiong:(PJZJingLing *)jingL
{
    self = [super initWithRect:rect andWithImage:image];
    if (self)
    {
        self.x = jingL.x +(jingL.image.size.width-self.image.size.width)/2;
        self.y = jingL.y-self.image.size.height;
    }
    return self;
}
-(void)update
{
    self.y -= ZDY;
    if (self.y < 5)
    {
        self.isNotUse = YES;
    }
}


@end
