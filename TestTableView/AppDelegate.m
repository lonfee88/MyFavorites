//
//  AppDelegate.m
//  TestTableView
//
//  Created by junzhan on 14-6-29.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemCell.h"
#import "SVPullToRefresh.h"
#import "ItemModel.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height-20) style:UITableViewStylePlain];
    [self.window addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataArray = [[NSMutableArray alloc] init];
    [self addData:10];

    //PullToRefresh
    __weak AppDelegate *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf.dataArray removeAllObjects];
        [weakSelf addData:10];
        
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    }];
    
    //InfiniteScroll
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"addInfiniteScrollingWithActionHandler");
        
        [weakSelf addData:10];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    }];
    
    // 添加底部工具栏
    
    // self.tableView.editing = YES;
//    UINavigationController *navController = [[UINavigationController alloc] init];
//    self.window.rootViewController = nav
    
    return YES;
}

- (void)addData:(NSInteger)num{
    for(int i = 0; i < num; ++i){
        ItemModel *itemModel = [[ItemModel alloc] init];
        itemModel.imageName = @"hezi11.jpg";
        itemModel.hotImageName = @"hot.png";
        itemModel.title = @"天猫魔盒TMB200F 高清电视网络机顶盒 wifi硬盘播放器 智能盒子1s";
        itemModel.price = [NSString stringWithFormat:@"29%d.00", i];
        [self.dataArray addObject:itemModel];
    }
}

#pragma mark action

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
//    cell = nil;
//    ItemCell *cell = nil;
    if(!cell){
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemCell"];
    }
    ItemModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell updateCellWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//进入编辑模式
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

@end
