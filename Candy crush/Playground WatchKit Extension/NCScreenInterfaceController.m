//
//  NCMatrixInterfaceController.m
//  TicTacToe
//
//  Created by Maher Rezeq on 1/24/15.
//  Copyright (c) 2015 Maher Rezeq. All rights reserved.
//

#import "NCScreenInterfaceController.h"
#import "NCScene.h"

NSInteger const kScreenSizeX = 9;
NSInteger const kScreenSizeY = 9;

@interface NCScreenInterfaceController() <MainScreenDelegate>

@property (nonatomic, weak) IBOutlet WKInterfaceButton *a0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *a12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *b0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *b12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *c0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *c12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *d0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *d12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *e0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *e12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *f0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *f12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *g0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *g12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *h0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *h12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *i0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *i12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *j0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *j12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *k0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *k12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *l0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *l12;

@property (nonatomic, weak) IBOutlet WKInterfaceButton *m0;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m1;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m2;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m3;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m4;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m5;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m6;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m7;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m8;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m9;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m10;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m11;
@property (nonatomic, weak) IBOutlet WKInterfaceButton *m12;

@property (nonatomic, strong) NSMutableArray *pointsMatrix;
// Hold on the main scene
@property (nonatomic, weak) id <MainSceneInterfaceControllerDelegate> mainSceneDelegate;

@property (nonatomic, strong) NCScene *mainScene;

// Remove
@property (nonatomic,assign) int value;
@end

@implementation NCScreenInterfaceController

#pragma Life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        _mainScene = [[NCScene alloc] init];
    }
    return self;
}

- (void)awakeWithContext:(id)context {
    
    [super awakeWithContext:context];
    // Main scene delegate
    self.mainSceneDelegate = (id<MainSceneInterfaceControllerDelegate>)self.mainScene;
    // Main screen delegate
    self.mainScene.mainScreenDelegate = self;
    // Setup the main screen
    [self screenSetup];

    // Call the main scene
    if ([self.mainSceneDelegate respondsToSelector:@selector(awakeWithContext:)]) {
        [self.mainSceneDelegate awakeWithContext:context];
    }
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    if ([self.mainSceneDelegate respondsToSelector:@selector(willActivate)]) {
        [self.mainSceneDelegate willActivate];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    if ([self.mainSceneDelegate respondsToSelector:@selector(didDeactivate)]) {
        [self.mainSceneDelegate didDeactivate];
    }
    
}

#pragma MainScreenDelegate

- (void)clearScreen{
    
    __weak NCScreenInterfaceController *weakSelf = self;
    
    [self.pointsMatrix enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL *stop) {
        
        __weak NCScreenInterfaceController *strongSelf = weakSelf;
        
        for (iPoint *sP in obj) {
            WKInterfaceButton * interfaceObj = [strongSelf interfaceButtonFromSelectorString:sP.location];
            [interfaceObj setColor:sP.color];
            [interfaceObj setBackgroundImage:nil];
        }
    }];
}

- (void)drawPoints:(NSArray *)points {
    __weak NCScreenInterfaceController *weakSelf = self;
    
    [points enumerateObjectsUsingBlock:^(iPoint *obj, NSUInteger idx, BOOL *stop) {
        __weak NCScreenInterfaceController *strongSelf = weakSelf;
        [strongSelf drawPoint:obj];
    }];
}

- (void)drawPoint:(iPoint *)point {
    // Get point location
    WKInterfaceButton * interfaceObj = [self interfaceButtonFromSelectorString:point.location];
    // Draw color
    if (point.color) {
        [interfaceObj setColor:point.color];
    } else if (point.image) {
        [interfaceObj setBackgroundImageNamed:point.image];
    }
}

#pragma Public methods

- (void)screenSetup {
    
    //char to int ASCII-code
    char c = 'a';
    int asciiCode = (int)c;
    
    self.pointsMatrix = [NSMutableArray array];
    
    int sectionCount = kScreenSizeX+1;
    int rowsCount = kScreenSizeY+1;
    
    for (int i = 0; i < sectionCount; i++) {
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        
        for (int j = 0; j < rowsCount; j++) {
            iPoint *point = [[iPoint alloc] init];
            point.color = [UIColor clearColor];
            point.location = [NSString stringWithFormat:@"%c%d", asciiCode, j];
            [rows addObject:point];
        }
        [self.pointsMatrix addObject:rows];
        asciiCode++;
    }
}

#pragma Private methods

- (WKInterfaceButton *)interfaceButtonFromSelectorString:(NSString *)selectorString {
    
    WKInterfaceButton *interfaceObj;
    SEL selector = NSSelectorFromString(selectorString);
    IMP imp = [self methodForSelector:selector];
    WKInterfaceButton * (*func)(id, SEL) = (void *)imp;
    interfaceObj = func(self, selector);
    
    return interfaceObj;
}

#pragma Action handlers
// A Group
- (IBAction)actionHandlerA0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:0];
}
- (IBAction)actionHandlerA1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:1];
}
- (IBAction)actionHandlerA2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:2];
}
- (IBAction)actionHandlerA3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:3];
}
- (IBAction)actionHandlerA4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:4];
}
- (IBAction)actionHandlerA5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:5];
}
- (IBAction)actionHandlerA6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:6];
}
- (IBAction)actionHandlerA7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:7];
}
- (IBAction)actionHandlerA8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:8 column:8];
}

// B Group
- (IBAction)actionHandlerB0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:0];
}
- (IBAction)actionHandlerB1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:1];
}
- (IBAction)actionHandlerB2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:2];
}
- (IBAction)actionHandlerB3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:3];
}
- (IBAction)actionHandlerB4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:4];
}
- (IBAction)actionHandlerB5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:5];
}
- (IBAction)actionHandlerB6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:6];
}
- (IBAction)actionHandlerB7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:7];
}
- (IBAction)actionHandlerB8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:7 column:8];
}

// C Group
- (IBAction)actionHandlerC0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:0];
}
- (IBAction)actionHandlerC1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:1];
}
- (IBAction)actionHandlerC2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:2];
}
- (IBAction)actionHandlerC3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:3];
}
- (IBAction)actionHandlerC4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:4];
}
- (IBAction)actionHandlerC5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:5];
}
- (IBAction)actionHandlerC6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:6];
}
- (IBAction)actionHandlerC7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:7];
}
- (IBAction)actionHandlerC8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:6 column:8];
}

// D Group
- (IBAction)actionHandlerD0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:0];
}
- (IBAction)actionHandlerD1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:1];
}
- (IBAction)actionHandlerD2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:2];
}
- (IBAction)actionHandlerD3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:3];
}
- (IBAction)actionHandlerD4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:4];
}
- (IBAction)actionHandlerD5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:5];
}
- (IBAction)actionHandlerD6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:6];
}
- (IBAction)actionHandlerD7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:7];
}
- (IBAction)actionHandlerD8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:5 column:8];
}

// E Group
- (IBAction)actionHandlerE0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:0];
}
- (IBAction)actionHandlerE1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:1];
}
- (IBAction)actionHandlerE2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:2];
}
- (IBAction)actionHandlerE3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:3];
}
- (IBAction)actionHandlerE4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:4];
}
- (IBAction)actionHandlerE5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:5];
}
- (IBAction)actionHandlerE6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:6];
}
- (IBAction)actionHandlerE7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:7];
}
- (IBAction)actionHandlerE8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:4 column:8];
}

// F Group
- (IBAction)actionHandlerF0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:0];
}
- (IBAction)actionHandlerF1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:1];
}
- (IBAction)actionHandlerF2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:2];
}
- (IBAction)actionHandlerF3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:3];
}
- (IBAction)actionHandlerF4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:4];
}
- (IBAction)actionHandlerF5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:5];
}
- (IBAction)actionHandlerF6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:6];
}
- (IBAction)actionHandlerF7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:7];
}
- (IBAction)actionHandlerF8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:3 column:8];
}

// G Group

- (IBAction)actionHandlerG0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:0];
}
- (IBAction)actionHandlerG1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:1];
}
- (IBAction)actionHandlerG2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:2];
}
- (IBAction)actionHandlerG3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:3];
}
- (IBAction)actionHandlerG4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:4];
}
- (IBAction)actionHandlerG5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:5];
}
- (IBAction)actionHandlerG6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:6];
}
- (IBAction)actionHandlerG7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:7];
}
- (IBAction)actionHandlerG8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:2 column:8];
}
// H Group
- (IBAction)actionHandlerH0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:0];
}
- (IBAction)actionHandlerH1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:1];
}
- (IBAction)actionHandlerH2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:2];
}
- (IBAction)actionHandlerH3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:3];
}
- (IBAction)actionHandlerH4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:4];
}
- (IBAction)actionHandlerH5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:5];
}
- (IBAction)actionHandlerH6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:6];
}
- (IBAction)actionHandlerH7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:7];
}
- (IBAction)actionHandlerH8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:1 column:8];
}

// I Group
- (IBAction)actionHandlerI0:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:0];
}
- (IBAction)actionHandlerI1:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:1];
}
- (IBAction)actionHandlerI2:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:2];
}
- (IBAction)actionHandlerI3:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:3];
}
- (IBAction)actionHandlerI4:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:4];
}
- (IBAction)actionHandlerI5:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:5];
}
- (IBAction)actionHandlerI6:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:6];
}
- (IBAction)actionHandlerI7:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:7];
}
- (IBAction)actionHandlerI8:(id)sender {
    [self.mainSceneDelegate selectedPointAtRow:0 column:8];
}

@end
