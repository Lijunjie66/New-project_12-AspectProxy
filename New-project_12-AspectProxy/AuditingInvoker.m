//
//  AuditingInvoker.m
//  New-project_12-AspectProxy
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "AuditingInvoker.h"

@implementation AuditingInvoker

// 实现横切
// 必写
- (void)preInvoke:(NSInvocation *)inv withTarget:(id)target {
    NSLog(@"Creating audit log before sending message with selector %@ to %@ object",NSStringFromSelector([inv selector]), self);
}
// 可选
- (void) postInvoke:(NSInvocation *)inv withTarget:(id)target {
    NSLog(@"Creating audit log after sending message with selector %@ to %@ object",NSStringFromSelector([inv selector]), self);
}

@end
