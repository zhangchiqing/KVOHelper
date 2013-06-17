//
//  KVOHelper.h
//
//  Created by Leo on 12/16/12.
//
//

#import <Foundation/Foundation.h>

@interface KVOHelper : NSObject
+ (void)mixinHandlerToKVOContextForClass:(Class)cls;
    
@end
