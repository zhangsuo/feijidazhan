//
//  MyView.h
//  飞机大战
//
//  Created by peijz on 15/9/25.
//  Copyright (c) 2015年 peijz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJZYingXiong.h"
@interface MyView : UIView
@property (nonatomic,strong) NSMutableArray * jingLingArr; // 精灵
@property (nonatomic,strong) PJZYingXiong * yingXiong; // 英雄
@end
