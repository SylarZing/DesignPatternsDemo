//
//  CalFactory.h
//  DesignPatternsDemo
//
//  Created by 崔宗寅 on 2017/9/4.
//  Copyright © 2017年 崔宗寅. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SFAdd.h"
#import "SFSub.h"

@interface CalFactory : NSObject

+ (SFAdd *) initAddClass;
+ (SFSub *) initSubClass;

@end
