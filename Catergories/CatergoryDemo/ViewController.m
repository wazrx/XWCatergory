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

@interface ViewController ()
@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, copy) dispatch_block_t test;
@property (nonatomic, weak) UIView *testView;
@end

@implementation ViewController

static id test(){
    return @"123";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *test = [UIView new];
    _testView = test;
    test.backgroundColor = [UIColor redColor];
    test.center = self.view.center;
    test.bounds = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:test];
    [self testString];
    
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%@", [_dict xwAdd_weakObjectForKey:@"test"]);
    [_testView.layer xwAdd_anchorPointChangedTotopLeft];
    [_testView.layer xwAdd_rotationInZWithAngle:M_PI * 2 repeatCount:NSIntegerMax duration:2];
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
