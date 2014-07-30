//
//  TBViewController.h
//  TestTableView
//
//  Created by longfei on 14-7-30.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBViewController : UIViewController  <UIApplicationDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
