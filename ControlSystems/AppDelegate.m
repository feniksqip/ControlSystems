//
//  AppDelegate.m
//  ControlSystems
//
//  Created by Andrey on 19.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "AppDelegate.h"
#import "CSPersonsLibrary.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    // нажали кнопку home
    
    // обновляем данные в отдельном потоке
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CSPersonsLibrary *personsLibrary = [CSPersonsLibrary sharedInstance];
        NSArray *persons = [personsLibrary persons];
        
        uint randIndex = arc4random_uniform([persons count]);
        CSPerson *person = [[CSPerson alloc] initWithID:[[persons objectAtIndex:randIndex] personID] Name:@"NewName" Country:@"NewCountry"];
        [personsLibrary deletePersonAtIndex:randIndex];
        [personsLibrary addPerson:person atIndex:randIndex];
    });
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    // переключаемся снова на наше приложение
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    // переключение на наше приложение произошло
    
    // обновляем интерфейс, посылаем для этого уведомление
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadTableFromAppDelegate" object:nil];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
