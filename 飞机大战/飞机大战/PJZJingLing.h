//
//  PJZJingLing.h
//  飞机大战
//
//  Created by peijz on 15/9/25.
//  Copyright (c) 2015年 peijz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PJZJingLing : NSObject
@property (nonatomic,strong)UIImage * image;

// 精灵位置
@property (nonatomic,assign)float x;
@property (nonatomic,assign)float y;
@property (nonatomic,assign)CGRect rect;
@property (nonatomic,assign) BOOL isNotUse;

-(instancetype)initWithRect:(CGRect)rect andWithImage:(UIImage *)image;
-(void)update;  // 刷新页面
-(void)draw; // 绘制敌机

-(CGRect)juxing;  // 矩形
-(BOOL)xiangyu:(PJZJingLing *)jingling; // 相遇的方法
@end
