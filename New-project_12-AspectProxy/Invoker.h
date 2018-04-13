//
//  Invoker.h
//  New-project_12-AspectProxy
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Invoker <NSObject>

// 必要方法（必须实现）:所有遵守该协议的类都必须实现这个方法，
// 该方法能够在调用对象中的方法 前 执行对功能的横切
@required
- (void) preInvoke:(NSInvocation *)inv withTarget:(id) target;
// 可选方法
// 该方法能够在调用对象中的方法 后 执行对功能的横切
@optional
- (void) postInvoke:(NSInvocation *)inv withTarget:(id) target;

@end
