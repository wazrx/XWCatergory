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
@property (nonatomic, weak) UIView *v1;
@property (nonatomic, weak) UIView *v2;
@property (nonatomic, weak) UIView *v3;
@property (nonatomic, weak) UIView *v4;
@property (nonatomic, weak) UIView *v5;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _xw_initializeUI];
    [self _xw_setAbsoluteFrame];
    [self _xw_setRelativeFrame];
}

- (void)_xw_initializeUI{
    UIView *v1 = [UIView new];
    _v1 = v1;
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    UIView *v2 = [UIView new];
    _v2 = v2;
    v2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:v2];
    UIView *v3 = [UIView new];
    _v3 = v3;
    v3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:v3];
    UIView *v4 = [UIView new];
    _v4 = v4;
    v4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:v4];
    UIView *v5 = [UIView new];
    _v5 = v5;
    v5.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v5];
}

- (void)_xw_setAbsoluteFrame{
    _v1.frame = CGRectMake(10, 10, 100, 100);
}

- (void)_xw_setRelativeFrame{
    _v2.xw_bottom = _v1.xw_centerY - 5;
    _v2.xw_left = _v1.xw_right + 5;
    _v2.xw_size = CGSizeMake(100, 15);
    _v3.xw_left = _v2.xw_right + 5;
    _v3.xw_centerY = _v2.xw_centerY;
    _v3.xw_size = CGSizeMake(20, 20);
    _v4.xw_top = _v1.xw_centerY + 5;
    _v4.xw_left = _v2.xw_left;
    _v4.xw_size = CGSizeMake(50, 15);
    _v5.xw_top = _v4.xw_top;
    _v5.xw_left = _v4.xw_right + 5;
    _v5.xw_size = _v4.xw_size;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int i = 0;
    i ++;
    [UIView animateWithDuration:1 animations:^{
        CGFloat c = i % 2 ? 40 : 100;
        _v1.xw_size = CGSizeMake(c, c);
        [self _xw_setRelativeFrame];
    }];
}

@end
