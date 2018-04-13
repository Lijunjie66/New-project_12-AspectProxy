//
//  Calculator.m
//  New-project_5-Calculator
//
//  Created by Geraint on 2018/4/4.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Calculator.h"
#import <objc/runtime.h> //运行时系统库的导入命令

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
}
@implementation Calculator

// 每个方法都会返回两个参数之和，这两个方法还会在控制台中记录（接收器）对象中类的名称和选择器的文本字符串。
// NSStringFromSelector(_cmd)中，这个函数输入参数是一个类型为SEL的变量，其中 _cmd 是一个隐式参数，含有被发送消息中的选择器。因此，语句NSStringFromSelector(_cmd)会返回被调用方法的选择器文本字符串。
- (NSNumber *) sumAddend1:(NSNumber *)adder1 addend2:(NSNumber *)adder2 {
    NSLog(@"Invoking method on %@ object with selector %@",[self className],NSStringFromSelector(_cmd));
    return [NSNumber numberWithInteger:([adder1 integerValue] + [adder2 integerValue])];
}

- (NSNumber *) sumAddend1:(NSNumber *)adder1 :(NSNumber *)adder2 {
    NSLog(@"Invoking method on %@ object with selector %@",[self className],NSStringFromSelector(_cmd));
    return [NSNumber numberWithInteger:([adder1 integerValue] + [adder2 integerValue])];
}

/*
- (id) absoluteValue((id) self,(SEL) _cmd,id value) {
    NSInteger intVal = [value integerValue];
    if (intVal < 0) {
        return [NSNumber numberWithInteger:(intVal * -1)];
    }
}

// 动态方式实现方法
+ (BOOL) resolveInstanceMethod:(SEL)sel {
    NSString *methed = NSStringFromSelector(sel);
    
    if ([methed hasPrefix:@"absoluteValue"]) {
        class_addMethod([self class], sel, (IMP)absoluteValue , "@@:@");
        NSLog(@"Dynamically added instance methed %@ to class %@",methed,NSStringFromSelector(sel));
        return YES;

    }
 */
    /*
    if ([methed hasPrefix:@"absoluteValue"]) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
     */
//



@end
