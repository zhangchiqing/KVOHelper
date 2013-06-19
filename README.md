KVOHelper
=========

Make iOS Key-Value Observing programming easier

##Usage

```
pod 'KVOHelper'
```

``` objective-c
#import "KVOHelper.h"

- (id)init {
    if (self = [super init]) {
        [KVOHelper mixinHandlerToKVOContextForClass:self.class];

        [self.account addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:@selector(onAccountNameChanged:)];

        self.account.name = @"My Account"; // this will trigger onAccountNameChanged:
    }
    return self;
}

- (void)onAccountNameChanged:(NSDictionary)change {
    NSString *accountName = [change objectForKey:@"new"];
    self.accountNameLabel.text = [NSString stringWithFormat:@"%@", accountName];
}
```
