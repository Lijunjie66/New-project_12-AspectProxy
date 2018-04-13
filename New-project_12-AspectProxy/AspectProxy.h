//
//  AspectProxy.h
//  New-project_12-AspectProxy
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Invoker.h"

// 创建的是代理类。它是NSproxy类的子类，会实现消息转发方法
@interface AspectProxy : NSProxy

@property (strong) id proxyTarget; // proxyTarget属性是通过NSproxy实例转发消息的真正对象
@property (strong) id<Invoker> invoker; // invoker该属性是一个能够实现横切功能的类（遵守Invoker协议）的实例
@property (readonly) NSMutableArray *selectors; //selectors属性是一个选择器集合，它定义了哪些消息会调用横切功能

// 这两个是AspectProxy类实例的初始化方法
- (id) initWithbject:(id)object andInvoker:(id<Invoker>)invoker;
- (id) initWithbject:(id)object selectors:(NSArray *)selectors
          andInvoker:(id<Invoker>)invoker;
// 该方法用于向当前的选择器列表中添加选择器
- (void) registerSelector:(SEL)selector;


@end
