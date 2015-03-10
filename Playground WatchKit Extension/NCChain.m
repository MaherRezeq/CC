
#import "NCChain.h"

@implementation NCChain {
  NSMutableArray *_cookies;
}

- (void)addCookie:(NCCookie *)cookie {
  if (_cookies == nil) {
    _cookies = [NSMutableArray array];
  }
  [_cookies addObject:cookie];
}

- (NSArray *)cookies {
  return _cookies;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"type:%ld cookies:%@", (long)self.chainType, self.cookies];
}

@end
