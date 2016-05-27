//
//  ViewController.m
//  CatergoryDemo
//
//  Created by wazrx on 16/5/4.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "ViewController.h"
#import "XWCatergory.h"

@interface ViewController ()
@property (nonatomic, weak) UILabel *v0;
@property (nonatomic, weak) UIView *v1;
@property (nonatomic, weak) UIView *v2;
@property (nonatomic, weak) UIView *v3;
@property (nonatomic, weak) UIView *v4;
@property (nonatomic, weak) UIView *v5;
@property (nonatomic, strong) UIScrollView *view;
@end

@implementation ViewController

@dynamic view;

- (void)loadView{
    self.view = [UIScrollView new];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _xw_initializeUI];
    [self _xw_setAbsoluteFrame];
    [self _xw_setRelativeFrame];
    XWLog("%@", @"wazrx");
}


- (void)_xw_initializeUI{
    UIView *v1 = [UIView new];
    [v1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)]];
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
    _v2.xw_frame = CGRectMake(10, 150, 100, 50);
}

- (void)_xw_setRelativeFrame{
    _v1.xw_bottom = _v2.xw_top - 10;
    if (_v1.xw_top <= 0) {
        _v1.xw_top = 0;
        _v2.xw_top = _v1.xw_bottom + 10;
    }
    _v1.xw_left = _v2.xw_left;
    _v1.xw_size = CGSizeMake(50, 50);
    _v3.xw_left = _v2.xw_right + 5;
    _v3.xw_centerY = _v2.xw_centerY;
    _v3.xw_size = CGSizeMake(20, 20);
    _v4.xw_top = _v1.xw_centerY + 5;
    _v4.xw_left = _v2.xw_right;
    _v4.xw_size = CGSizeMake(50, 15);
    _v5.xw_top = _v2.xw_bottom + 10;
    _v5.xw_left = _v4.xw_right + 5;
    _v5.xw_size = _v2.xw_size;
    self.view.contentSize = CGSizeMake(kScreenWidth, _v5.xw_bottom);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}

- (void)test{
    [UIView animateWithDuration:0.25 animations:^{
        _v2.xw_height += 20;
        _v2.xw_top -= 10;
        [self _xw_setRelativeFrame];
    }];
}

@end
