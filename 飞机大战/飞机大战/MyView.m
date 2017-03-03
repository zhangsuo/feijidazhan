//
//  MyView.m
//  飞机大战
//
//  Created by peijz on 15/9/25.
//  Copyright (c) 2015年张锁. All rights reserved.
//

#import "MyView.h"
#import "PJZJingLing.h"
#import "PJZZiDan.h"
@implementation MyView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.jingLingArr = [[NSMutableArray alloc]init];
        UIImage * image = [UIImage imageNamed:@"nc"];
        self.yingXiong = [[PJZYingXiong alloc]initWithRect:[UIScreen mainScreen].bounds andWithImage:image]; // 构建英雄
        [self.jingLingArr addObject:self.yingXiong];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    //绘制
    for (PJZJingLing * jl in self.jingLingArr)
    {
        [jl draw];
    }
    // 清除无用精灵
    NSMutableArray * clear = [[NSMutableArray alloc]init];
    for (PJZJingLing * pjzjl in self.jingLingArr)
    {
        if (pjzjl.isNotUse)
        {
            [clear addObject:pjzjl];
        }
    }
    for (PJZZiDan * zidan in self.jingLingArr)
    {
        if (zidan.isNotUse) {
            [clear addObject:zidan];
        }
    }
    [self.jingLingArr removeObjectsInArray:clear];

}



@end
