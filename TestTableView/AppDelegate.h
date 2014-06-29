//
//  AppDelegate.h
//  TestTableView
//
//  Created by junzhan on 14-6-29.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITableView *tableView;

@end
