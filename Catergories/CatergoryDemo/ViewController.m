//
//  ViewController.m
//  CatergoryDemo
//
//  Created by wazrx on 16/5/4.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableDictionary+XWAdd.h"
#import "CALayer+XWAdd.h"
#import "NSString+XWAdd.h"
#import "NSTimer+XWAdd.h"
#import "NSObject+XWAdd.h"
#import "NSObject+YYAddForKVO.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, copy) dispatch_block_t test;
@property (nonatomic, weak) UIView *testView;
@property (nonatomic, copy) NSString *s1;
@property (nonatomic, copy) NSString *s2;
@property (nonatomic, strong) NSString *s3;
@property (nonatomic, copy) NSString *s4;
@property (nonatomic, strong) ViewController *vc;
@property (nonatomic, copy) NSString *s5;
@property (nonatomic, strong) NSMutableString *s6;
@property (nonatomic, copy) NSAttributedString *s7;
@property (nonatomic, assign) int i;
@end

@implementation ViewController

static id test(){
    return @"123";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _vc = [ViewController new];
    UIView *test = [UIView new];
    _testView = test;
    test.backgroundColor = [UIColor redColor];
    test.center = self.view.center;
    test.bounds = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:test];
//    [self testString];
//    [self testTimer];
//    [self testScaledImage];
//    [self testRuntime];
    [self testKVO];
    
}

- (void)testKVO{
    [NSTimer xwAdd_scheduledCommonModesTimerWithTimeInterval:1 target:self selector:@selector(xwp_timerEvent) repeats:YES];
//    [self addObserverBlockForKeyPath:@"s1" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
//        NSLog(@"KVO = %@, %@, %@", obj, oldVal, newVal);
//    }];
//    return;
    [self xwAdd_addObserverBlockForKeyPath:@"s1" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
        NSLog(@"KVO = %@, %@, %@", obj, oldVal, newVal);
    }];
}

- (void)testRuntime{
    NSLog(@"%@", [UITextField xwAdd_getAllPropertyNames]);
    [self xwAdd_setAllNSStringPropertyWithString:@"--"];
    [_vc xwAdd_setAllNSStringPropertyWithString:@"1"];
}

- (void)testScaledImage{
    NSString *name = [@"wazrx" xwAdd_scaledNameWithType:@"jpg"];
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:name];
    [self.view addSubview:imgView];
    imgView.center = self.view.center;
    imgView.bounds = CGRectMake(0, 0, 100, 100);
}

- (void)testString{
    NSString *test = @" 1 2345 6789 我的 法\n师法";
    NSLog(@"%f", [UIScreen mainScreen].scale);
    NSLog(@"%@", [@"123456789" xwAdd_stringByAppendingNameScale:2]);
    NSLog(@"%c", @"123456789".shortValue);
    NSLog(@"%ld", @"123456789".longValue);
    NSLog(@"%@", [test xwAdd_stringByTrim]);
    NSLog(@"%zd", [@"\n" xwAdd_isNotBlank]);
    NSLog(@"%zd", [test xwAdd_containsCharacterSet:[NSCharacterSet newlineCharacterSet]]);
}

- (void)testTimer{
    [NSTimer xwAdd_scheduledCommonModesTimerWithTimeInterval:1 target:self selector:@selector(xwp_timerEvent) repeats:YES];
}

- (void)xwp_timerEvent{
//    NSLog(@"timer调用中");
    _i++;
    _s1 = [NSString stringWithFormat:@"%zd", _i];
    NSLog(@"%@", _s1);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSTimer xwAdd_removeTimeOnTarget:self];
    NSLog(@"timer结束");
    NSLog(@"%@", objc_getAssociatedObject(self, "xwAdd_timer"));
}

static id <NSObject,NSCopying> BKDispatchCancellableBlock(dispatch_queue_t queue,NSTimeInterval delay,void(^block)(void)) {
    dispatch_time_t time = 1;
    
#if DISPATCH_CANCELLATION_SUPPORTED
    if (BKSupportsDispatchCancellation()) {
        dispatch_block_t ret = dispatch_block_create(0,block);
        dispatch_after(time,queue,ret);
        return ret;
    }
#endif
    
    __block BOOL cancelled = NO;
    void (^wrapper)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block();
    };
    
    dispatch_after(time,queue,^{
        wrapper(NO);
    });
    
    return wrapper;
}

static NSString *tt = @"1";


@end
