//
//  PJZYingXiong.m
//  飞机大战
//
//  Created by peijz on 15/9/26.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import "PJZYingXiong.h"

@implementation PJZYingXiong
- (instancetype)initWithRect:(CGRect)rect andWithImage:(UIImage *)image
{
    self = [super initWithRect:rect andWithImage:image];
    if (self)
    {
        self.x = (rect.size.width-self.image.size.width)/2;
        self.y = rect.size.height - self.image.size.height;
    }
    return self;
}
@end
