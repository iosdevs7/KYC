//
//  AppDelegate.m
//  SampleApp
//
//  Created by Prachi on 3/10/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import "AppDelegate.h"
#import <facebookSDK/FacebookSDK.h>
#import <GooglePlus/GooglePlus.h>
#import <IMFCore/IMFCore.h>
#import <IMFPush/IMFPush.h>
#import <IMFFacebookAuthenticationHandler.h>
#import <IMFGoogleAuthenticationHandler.h>
#import <CloudantToolkit/CloudantToolkit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    NSString *configurationPath = [[NSBundle mainBundle]pathForResource:@"sampleapp" ofType:@"plist"];
    NSDictionary *configuration = [NSDictionary dictionaryWithContentsOfFile:configurationPath];
    NSString *applicationId = configuration[@"applicationId"];
    NSString *applicationRoute = configuration[@"applicationRoute"];
    [[IMFClient sharedInstance] initializeWithBackendRoute:applicationRoute backendGUID:applicationId];
    
    
    /*Authentication is required to connect to backend services,
     For this sample App all 3 handlers are registered locally but only 1 will be use
     depending how the client was register in AMS (Advanced Mobile Access)
     */
    [[IMFFacebookAuthenticationHandler sharedInstance] registerWithDefaultDelegate];
    [[IMFGoogleAuthenticationHandler sharedInstance] registerWithDefaultDelegate];

    return YES;
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
    
    // Logs 'install' and 'app activate' App Events.
    [FBAppEvents activateApp];
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}

@end
