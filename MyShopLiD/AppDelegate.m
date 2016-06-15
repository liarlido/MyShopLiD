//
//  AppDelegate.m
//  MyShopLiD
//
//  Created by LiaRLido on 16/5/30.
//  Copyright © 2016年 LiaRLido. All rights reserved.
//

#import "AppDelegate.h"
#import "LiDLaunchView.h"
#import "WeiboSDK.h"

@interface AppDelegate ()<WeiboSDKDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor blackColor]];
    LiDLaunchView *launch=[[LiDLaunchView alloc]init];
    [self.window setRootViewController:launch];
    [self.window makeKeyAndVisible];
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:WBAppKey];
    
    
    return YES;
}


//当收到微博客户端的响应时的回调函数
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{

    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        
        NSString *accessToken=[(WBAuthorizeResponse *)response accessToken];
        NSString *userID=[(WBAuthorizeResponse *)response userID];
        [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:kAccessTokenKey];
        [[NSUserDefaults standardUserDefaults] setObject:userID forKey:kUserIDKey];
    }else if([response isKindOfClass:WBSendMessageToWeiboResponse.class]){
        
        if (response.statusCode==0) {
            [SVProgressHUD showSuccessWithStatus:@"分享成功!"];
        }else{
        
            [SVProgressHUD showErrorWithStatus:@"抱歉,分享失败~"];
        }
        
        
    }
}

-(void)didReceiveWeiboRequest:(WBBaseRequest *)request{

    
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{

    return [WeiboSDK handleOpenURL:url delegate:self];
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{

    return [WeiboSDK handleOpenURL:url delegate:self];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
