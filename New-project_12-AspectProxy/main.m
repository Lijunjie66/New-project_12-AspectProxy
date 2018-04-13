//
//  main.m
//  New-project_12-AspectProxy
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AspectProxy.h"
#import "AuditingInvoker.h"
#import "Calculator.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 创建Calculator对象
        id calculator = [[Calculator alloc] init];
        NSNumber *addend1 = [NSNumber numberWithInteger:-25];
        NSNumber *addend2 = [NSNumber numberWithInteger:10];
        NSNumber *addend3 = [NSNumber numberWithInteger:15];
        
        
        // 为该对象创建代理 (指定选择器  sumAddend1:addend2:)
        NSValue *selValue1 = [NSValue valueWithPointer:@selector(sumAddend1:addend2:)];
        NSArray *selValues = @[selValue1]; // 创建数组常量
        AuditingInvoker *invoker = [[AuditingInvoker alloc] init];
        id calculatorProxy = [[AspectProxy alloc] initWithbject:calculator selectors:selValues andInvoker:invoker];
        
        // 使用指定的选择器向该代理发送消息
        [calculatorProxy sumAddend1:addend1 addend2:addend2];
        
        // 使用没有特殊处理要求的其他选择器，向这个代理发送消息!
        [calculatorProxy sumAddend1:addend2 :addend3];
        
        // 为这个代理注册另一个选择器并再次向其发送消息
        [calculatorProxy respondsToSelector:@selector(sumAddend1::)];
        [calculatorProxy sumAddend1:addend1 :addend3];
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
