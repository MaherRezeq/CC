
@import WatchKit;

@class NCCookie;

typedef NS_ENUM(NSUInteger, ChainType) {
  ChainTypeHorizontal,
  ChainTypeVertical,

  // Note: add any other shapes you want to detect to this list.
  //ChainTypeL,
  //ChainTypeT,
};

@interface NCChain : NSObject

// The RWTCookies that are part of this chain.
@property (strong, nonatomic, readonly) NSArray *cookies;

// Whether this chain is horizontal or vertical.
@property (assign, nonatomic) ChainType chainType;

// How many points this chain is worth.
@property (assign, nonatomic) NSUInteger score;

- (void)addCookie:(NCCookie *)cookie;

@end
