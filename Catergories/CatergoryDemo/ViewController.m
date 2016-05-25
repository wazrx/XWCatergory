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
#import "UIImage+XWAdd.h"
#import "UIAlertView+XWAdd.h"
#import "NSObject+YYAddForKVO.h"
#import "UIView+XWAddForFrame.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <objc/runtime.h>

@interface ViewController ()<ABPeoplePickerNavigationControllerDelegate>
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
@property (nonatomic, weak) UITextField *field;
@property (nonatomic, strong) ABPeoplePickerNavigationController *sbController;
@end

@implementation ViewController

static id test(){
    return @"123";
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    _vc = [ViewController new];
//    UIView *test = [UIView new];
//    _testView = test;
//    test.backgroundColor = [UIColor redColor];
//    test.center = self.view.center;
//    test.bounds = CGRectMake(0, 0, 100, 100);
//    [self.view addSubview:test];
//    UITextField *field = [UITextField new];
//    field.frame = CGRectMake(0, 0, 320, 100);
//    _field = field;
//    [self.view addSubview:field];
//    [self testString];
//    [self testTimer];
//    [self testAB];
//    [self testAlert];
//    [self testRuntime];
//    [self testKVO];
    [self testFrame];
    
}

- (void)testFrame{
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    v1.frame = CGRectMake(10, 10, 100, 100);
//    v1.width = 100;
    v1.centerX = 50;
//    v1.y = 100;
//    v1.height = 50;
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor greenColor];
    v2.centerX = v1.centerX;
    v2.width = v1.width / 2.0f;
    v2.y = v1.bottom + 50;
    v2.height = v1.height * 2.0f;
    [self.view addSubview:v2];
}

- (void)xwp_setAbsolutelyFrame{
    
}

- (void)xwp_setRelativeFrame{
    
}

- (void)testAlert{
    [UIAlertView xwAdd_showAlertViewWith:@"1" message:@"2" leftButtonTitle:@"1" leftButtonClickedConfig:^{
        NSLog(@"1");
    } rightButtonTitle:@"2" rightButtonClickedConfig:^{
        NSLog(@"2");
    }];
}

- (void)testAB{
    self.sbController = [[ABPeoplePickerNavigationController alloc] init];
    _sbController.peoplePickerDelegate = self;
    [self presentViewController:_sbController animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", [ABPeoplePickerNavigationController xwAdd_getAllIvarNames]);
        [[ABPeoplePickerNavigationController xwAdd_getAllIvarNames] enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isEqualToString:@"_addressBook"]) {
                NSLog(@"%@", [_sbController valueForKey:obj]);
                return ;
            }
        }];
    });
}

- (void)testKVO{
    [NSTimer xwAdd_scheduledCommonModesTimerWithTimeInterval:1 target:self selector:@selector(xwp_timerEvent) repeats:YES];
    [self addObserverBlockForKeyPath:@"s1" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
        NSLog(@"KVO = %@, %@, %@", obj, oldVal, newVal);
    }];
//    return;
//    [_field addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
//    [self xwAdd_addObserverBlockForKeyPath:@"s1" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
//        NSLog(@"KVO = %@, %@, %@", obj, oldVal, newVal);
//    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"kvo");
}

- (void)testRuntime{
    NSLog(@"%@", [UITextField xwAdd_getAllPropertyNames]);
    [self xwAdd_setAllNSStringPropertyWithString:@"--"];
    [_vc xwAdd_setAllNSStringPropertyWithString:@"1"];
}

- (void)testScaledImage{
    NSString *name = [@"wazrx" xwAdd_scaledNameWithType:@"jpg"];
    UIImageView *imgView = [UIImageView new];
    UIImage *img = [[UIImage imageNamed:name] xwAdd_imageByRoundCornerRadius:100];
    imgView.image = img;
    [self.view addSubview:imgView];
    imgView.center = self.view.center;
    imgView.bounds = CGRectMake(0, 0, 200, 200);
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
    self.s1 = [NSString stringWithFormat:@"%zd", _i];
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
