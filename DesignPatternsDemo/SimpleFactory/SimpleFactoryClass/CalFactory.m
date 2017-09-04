//
//  CalFactory.m
//  DesignPatternsDemo
//
//  Created by 崔宗寅 on 2017/9/4.
//  Copyright © 2017年 崔宗寅. All rights reserved.
//

#import "CalFactory.h"

@implementation CalFactory

+ (SFAdd *)initAddClass {
    SFAdd *add = [[SFAdd alloc] init];
    add.calType = AddType;
    return add;
}

+ (SFSub *)initSubClass {
    SFSub *sub = [[SFSub alloc] init];
    sub.calType = SubType;
    return sub;
}

@end
