//
//  AspectProxy.m
//  New-project_12-AspectProxy
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "AspectProxy.h"

@implementation AspectProxy

// 这两个是AspectProxy类实例的初始化方法
// *******   注意：因为NSproxy是一个基类，所以这两个方法的开头没有调用[super init]
- (id) initWithbject:(id)object selectors:(NSArray *)selectors
          andInvoker:(id<Invoker>)invoker {
    _proxyTarget = object;
    _invoker = invoker;
    _selectors = [selectors mutableCopy];
    return self;
}

// 这两个是AspectProxy类实例的初始化方法
- (id) initWithbject:(id)object andInvoker:(id<Invoker>)invoker {
    return [self initWithbject:object selectors:nil andInvoker:invoker];
}

// 系统自带方法
// methodSignatureForSelector: 方法会为目标对象中被调用的方法返回一个NSMethodSignature实例
- (NSMethodSignature *) methodSignatureForSelector:(SEL)sel {
    return [self.proxyTarget methodSignatureForSelector:sel];
}
// 系统自带方法
// 当调用目标方法的选择器与在AspectProxy对象中注册的选择器匹配时，forwardInvocation:方法会调用目标对象中的方法，并根据条件语句的判断结果调用AOP功能
- (void) forwardInvocation:(NSInvocation *) invocation {
    
    // 在调用目标方法【前】执行横切功能
    if (self.selectors != nil) {
        SEL methodSel = [invocation selector];
        // 便利
        for (NSValue *selValue in self.selectors) {
            if (methodSel == [selValue pointerValue]) {
                [[self invoker] preInvoke:invocation withTarget:self.proxyTarget];
            }
        }
    } else {
        [[self invoker] preInvoke:invocation withTarget:self.proxyTarget];
    }
    
    // 调用目标方法
    [invocation invokeWithTarget:self.proxyTarget];
    
    // 在调用目标方法【后】执行横切功能
    if ([self.invoker respondsToSelector:@selector(postInvoke:withTarget:)]) {
        if (self.selectors != nil) {
            SEL methodSel = [invocation selector];
            // 便利
            for (NSValue *selValue in self.selectors) {
                if (methodSel == [selValue pointerValue]) {
                    [[self invoker] postInvoke:invocation withTarget:self.proxyTarget];
                    
                    //break用于完全结束一个循环,跳出循环体,不管是那种循环,
                    //一旦在循环体中遇到break,系统将完全结束该循环,开始执行循环后边的代码
                    break;
                }
            }
        }
    } else {
        [[self invoker] postInvoke:invocation withTarget:self.proxyTarget];
    }
}

// 该方法用于向当前的选择器列表中添加选择器
- (void) registerSelector:(SEL)selector {
    NSValue *selValue = [NSValue valueWithPointer:selector];
    [self.selectors addObject:selValue];
}

@end
