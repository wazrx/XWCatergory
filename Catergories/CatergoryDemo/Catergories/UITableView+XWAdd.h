//
//  UITableView+XWAdd.h
//  CatergoryDemo
//
//  Created by wazrx on 16/5/17.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (XWAdd)

- (void)xwAdd_updateWithBlock:(void (^)(UITableView *tableView))block;

@end
