//
//  SFCalculation.h
//  DesignPatternsDemo
//
//  Created by 崔宗寅 on 2017/9/4.
//  Copyright © 2017年 崔宗寅. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CalculationType) {
    NonType,
    AddType,
    SubType,
};

@interface SFCalculation : NSObject

@property (nonatomic, assign) CalculationType calType;

- (float) operationWithA:(float)a andB:(float)b;

@end

