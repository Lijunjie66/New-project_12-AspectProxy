//
//  Calculator.h
//  New-project_5-Calculator
//
//  Created by Geraint on 2018/4/4.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic,retain) NSString *className;

// 第二个实例方法使用了 空参数
- (NSNumber *) sumAddend1:(NSNumber *)adder1 addend2:(NSNumber *)adder2;
- (NSNumber *) sumAddend1:(NSNumber *)adder1 :(NSNumber *)adder2;

@end
