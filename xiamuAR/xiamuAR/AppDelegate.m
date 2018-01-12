//
//  AppDelegate.m
//  xiamuAR
//
//  Created by guopenglai on 2017/12/28.
//  Copyright © 2017年 guopenglai. All rights reserved.
//

#import "AppDelegate.h"
#import "YFTabBarViewController.h"
#import "YFNavigationViewController.h"
/*
 SFSafariViewController ：通过SFSafariViewController，你几乎可以使用所有Safari的一些便利特性，而无需让用户离开你的应用。
 */
#import <SafariServices/SafariServices.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[YFTabBarViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    [self setUpFixiOS11]; //适配IOS 11
    
    [self getPasteboard];
    return YES;
}
#pragma mark - 适配
- (void)setUpFixiOS11
{
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}
#pragma mark - 获取剪切板
- (void)getPasteboard
{
    //剪切板
    UIPasteboard* pasteboard= [UIPasteboard generalPasteboard];
    NSLog(@"pasteboard.string1==============%@",pasteboard.string);
    if(pasteboard.string == nil) {
        //剪切板内容不存在时返回
        return;
    }
    NSString* pasteUserDefaultStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"pasteboardString"];
    //过滤掉某些剪切板内容
    if(([pasteboard.string rangeOfString:@"设定的标识符"].location!=NSNotFound))
    {
        return;
    }
    
    if(pasteUserDefaultStr ==nil|| [pasteUserDefaultStr isEqualToString:@""] || ![pasteUserDefaultStr isEqualToString:pasteboard.string]) {
        //弹出添加
        NSLog(@"pasteboard.string=====2=========%@",pasteboard.string);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:pasteboard.string preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSURL *url = [NSURL URLWithString:pasteboard.string];
            SFSafariViewController *safariVc = [[SFSafariViewController alloc] initWithURL:url];
            
            // 官方推荐我们用modal的形式
            [self.window.rootViewController presentViewController:safariVc animated:YES completion:nil];
            
        }];
        [alert addAction:action];
        [self.window.rootViewController showDetailViewController:alert sender:nil];
        [[NSUserDefaults standardUserDefaults]setObject:pasteboard.string forKey:@"pasteboardString"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
//        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        if ([appdelegate.window.rootViewController isKindOfClass:[YFNavigationViewController class]] == YES) {
//            // 为所欲为
//
//        }else
//        {
////            YFTabBarViewController *tabBarVC = (YFTabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
////
////            YFNavigationViewController *nav = (YFNavigationViewController *)tabBarVC.selectedViewController;
//
//        }

        }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self getPasteboard];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
