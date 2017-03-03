//
//  ViewController.m
//  飞机大战
//
//  Created by peijz on 15/9/25.
//  Copyright (c) 2015年 peijz. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "PJZDiren.h"
#import "PJZZiDan.h"
#import "PJZYingXiong.h"
#import "PJZBaoZha.h"
@interface ViewController ()
{
    MyView * myView;
    UIImage * diRenImage;
    UIImage * ziDanImage;
    UIImage * baoZhaImage;
    BOOL isOver; // 是否在上边
    CGPoint prePoint; // 移动前的点
    PJZDiren * diRen;
    PJZZiDan * ziDan;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    baoZhaImage = [UIImage imageNamed:@"bz"];
    diRenImage = [UIImage imageNamed:@"dr"];
    ziDanImage = [UIImage imageNamed:@"zd"];
    myView = [[MyView alloc]init];
    self.view = myView;
    self.view.backgroundColor = [UIColor whiteColor];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}
-(void)timer:(id)sender
{
    //产生敌人 产生子弹
    static int count=0 ;
    count++;
    if (count%5 == 0) //每增加5的时候 增加一个对象  从而控制敌人产生的速度
    {
        diRen = [[PJZDiren alloc]initWithRect:self.view.bounds andWithImage:diRenImage];
        [myView.jingLingArr addObject:diRen];
        
        
        
        ziDan = [[PJZZiDan alloc]initWithRect:self.view.bounds andWithImage:ziDanImage andWithYingXiong:myView.yingXiong];
        [myView.jingLingArr addObject:ziDan];

    }
    
    NSMutableArray * direnarr = [[NSMutableArray alloc]init]; // 敌人数组
    NSMutableArray * zidanarr = [[NSMutableArray alloc]init]; // 子弹数组
    
    
    for (PJZJingLing * jingLIng in myView.jingLingArr)
    {
        // 提取子弹对象
        if ([jingLIng isMemberOfClass:[PJZZiDan class]])
        {
            [zidanarr addObject:jingLIng];
        }
        // 提取敌人对象
        if ([jingLIng isMemberOfClass:[PJZDiren class]])
        {
            [direnarr addObject:jingLIng];
        }
        [jingLIng update];
    }
    
    // 检测碰撞
    
    for (PJZDiren * dr in direnarr) // 遍历敌人
    {
        for (PJZZiDan *zd in zidanarr) // 遍历子弹
        {
            if ([zd xiangyu:dr])
            {
                dr.isNotUse = YES;
                zd.isNotUse = YES;
                PJZBaoZha * baoZha = [[PJZBaoZha alloc]initWithRect:dr.juxing andWithImage:baoZhaImage];
                baoZha.isNotUse = YES;
                [myView.jingLingArr addObject:baoZha];
            }
        }
    }
    
    [self.view setNeedsDisplay];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];  //触摸
    CGPoint point = [touch locationInView:self.view]; // 得到当前的触摸坐标
    // 判断是否在英雄上
    CGRect rect = CGRectMake(myView.yingXiong.x, myView.yingXiong.y, myView.yingXiong.image.size.width, myView.yingXiong.image.size.height);  // 获取英雄的rect
    isOver = CGRectContainsPoint(rect, point); //判断点是否在矩形内
    
    prePoint = point ; // 把当前点赋给移动前的点
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (isOver)
    {
        // 得到当前坐标
        UITouch * touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        
        // 计算两个点之间的距离
        float x = point.x - prePoint.x;
        float y = point.y - prePoint.y;
        myView.yingXiong.x +=x;
        myView.yingXiong.y +=y;
        prePoint = point;
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    isOver = NO;
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    isOver = NO;
}
@end
