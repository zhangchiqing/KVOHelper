KVOHelper
=========

Make iOS Key-Value Observing programming easier

##Usage

```
pod 'KVOHelper', '~> 1.0.0'
```

``` objective-c
#import "KVOHelper.h"

- (id)init {
    if (self = [super init]) {
        [KVOHelper mixinHandlerToKVOContextForClass:self.class];

        [self.account addObserver:self forKeyPath:@"name" options:0 context:@selector(onAccountNameChanged:)];

        self.account.name = @"My Account"; // this will trigger onAccountNameChanged:
    }
    return self;
}

- (void)onAccountNameChanged:(NSDictionary)change {
    NSString *accountName = [change objectForKey:@"new"];
    self.accountNameLabel.text = [NSString stringWithFormat:@"%@", accountName];
}
```
