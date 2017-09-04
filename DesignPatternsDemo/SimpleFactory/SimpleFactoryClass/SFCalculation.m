//
//  SFCalculation.m
//  DesignPatternsDemo
//
//  Created by 崔宗寅 on 2017/9/4.
//  Copyright © 2017年 崔宗寅. All rights reserved.
//

#import "SFCalculation.h"

@implementation SFCalculation

- (float) operationWithA:(float)a andB:(float)b {
    float result = 0;
    
    switch (self.calType) {
        case AddType:
            result = a + b;
            break;
        case SubType:
            result = a - b;
            break;
        default:
            break;
    }
    
    return result;
}
@end
