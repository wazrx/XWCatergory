//
//  UITableView+XWAdd.m
//  CatergoryDemo
//
//  Created by wazrx on 16/5/17.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UITableView+XWAdd.h"

@implementation UITableView (XWAdd)

- (void)xwAdd_updateWithBlock:(void (^)(UITableView *tableView))block {
    [self beginUpdates];
    block(self);
    [self endUpdates];
}
@end
