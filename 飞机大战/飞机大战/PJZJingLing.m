//
//  PJZJingLing.m
//  飞机大战
//
//  Created by peijz on 15/9/25.
//  Copyright (c) 2015年 peijz. All rights reserved.
//

#import "PJZJingLing.h"

@implementation PJZJingLing
-(instancetype)initWithRect:(CGRect)rect andWithImage:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        self.rect = rect;
        self.x = rect.origin.x;
        self.y = rect.origin.y;
        self.image = image;
    }
    return self;
}

-(void)draw
{
    [self.image drawAtPoint:CGPointMake(self.x, self.y)]; // 绘制敌机
}

-(CGRect)juxing
{
    return CGRectMake(self.x, self.y, self.image.size.width, self.image.size.height);
}

-(BOOL)xiangyu:(PJZJingLing *)jingling
{
    CGRect me = self.juxing;
    CGRect jl = jingling.juxing;
    return CGRectIntersectsRect(me, jl);
}

-(void)update
{
}
@end
