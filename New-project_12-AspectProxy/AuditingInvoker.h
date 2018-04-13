//
//  AuditingInvoker.h
//  New-project_12-AspectProxy
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Invoker.h"

// 遵守协议的类，实现横切功能
@interface AuditingInvoker : NSObject <Invoker>

@end
