//
//  PJZDiren.m
//  飞机大战
//
//  Created by peijz on 15/9/25.
//  Copyright (c) 2015年 peijz. All rights reserved.
//

#import "PJZDiren.h"
#import "MyView.h"
#define Y 5;
@implementation PJZDiren

-(instancetype)initWithRect:(CGRect)rect andWithImage:(UIImage *)image
{
    self = [super initWithRect:rect andWithImage:image];
    if (self)
    {
        self.x = arc4random()%(int)(rect.size.width-self.image.size.width); //敌机的横坐标是随机的
        self.y = -self.image.size.height;  // 敌机的纵坐标是负的当前图片的高度，以至于一开始的时候 敌机是在view的外边
    }
    return self;
}
-(void)update
{
    self.y += Y;
    if (self.y > self.rect.size.height)
    {
        self.isNotUse = YES;
    }
}


@end
