//
//  KVOHelper.m
//
//  Created by Leo on 12/16/12.
//
//

#import "KVOHelper.h"
#import <objc/runtime.h>

@implementation KVOHelper

+ (void)mixinHandlerToKVOContextForClass:(Class)cls {
    SEL method = @selector(observeValueForKeyPath:ofObject:change:context:);
    IMP imp = class_getMethodImplementation(self, method);
    Method m = class_getInstanceMethod(cls, method);
    method_setImplementation(m, imp);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    // Start executing the requested task
    SEL handler = context;
    [self performSelector:handler withObject:change];
#pragma clang diagnostic pop
}
@end
