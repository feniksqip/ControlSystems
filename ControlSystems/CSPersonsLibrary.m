////
////  CSPersonsLibrary.m
////  ControlSystems
////
////  Created by Andrey on 23.02.16.
////  Copyright © 2016 Andrey. All rights reserved.
////
//
//#import "CSPersonsLibrary.h"
//
////@implementation CSPersonsLibrary
//
////
////#import "LibraryAPI.h"
////#import "PersistencyManager.h"
////#import "HTTPClient.h"
//
//@interface CSPersonsLibrary ()
//{
////    PersistencyManager * persistencyManager;
////    HTTPClient * httpClient;
//    
//    // должны ли изменения поступать на сервер
////    BOOL isOnline;
//}
//@end
//
//@implementation CSPersonsLibrary
//
//+(CSPersonsLibrary *)sharedInstance
//{
//    // 1
//    static CSPersonsLibrary *sharedInstance = nil;
//    
//    // 2
//    static dispatch_once_t oncePredicate;
//    
//    // 3
//    dispatch_once(&oncePredicate, ^{
//        sharedInstance = [[CSPersonsLibrary alloc] init];
//    });
//    return sharedInstance;
//}
//
//- (id)init
//{
//    self = [super init];
//    if (self)
//    {
////        persistencyManager = [[PersistencyManager alloc] init];
////        httpClient = [[HTTPClient alloc] init];
////        isOnline = NO;
//    }
//    return self;
//}
//
//- (NSArray *)albums
//{
//    return [persistencyManager albums];
//}
//
//- (void)addAlbum:(Album *)album atIndex:(int)index
//{
//    [persistencyManager addAlbum:album atIndex:index];
//    if (isOnline)
//    {
//        [httpClient postRequest:@"/api/addAlbum" body:[album description]];
//    }
//}
//
//- (void)deleteAlbumAtIndex:(int)index
//{
//    [persistencyManager deleteAlbumAtIndex:index];
//    if (isOnline)
//    {
//        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
//    }
//}
//
//@end

//
//  PersistencyManager.m
//  ObjCPatterns
//
//  Created by Andrey on 20.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "CSPersonsLibrary.h"

@interface CSPersonsLibrary ()
{
    NSMutableArray *persons; // Массив всех персон
}
@end

@implementation CSPersonsLibrary

+(CSPersonsLibrary *)sharedInstance
{
    static CSPersonsLibrary * sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[CSPersonsLibrary alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        persons = [NSMutableArray new];
        uint numberID = 10000;
        
        // добавим две одинаковые ячейки
        [persons addObject:[[CSPerson alloc] initWithID:numberID Name:@"George" Country:@"Jungle"]];
        [persons addObject:[[CSPerson alloc] initWithID:++numberID Name:@"George" Country:@"Jungle"]];
        
        for (int i = 0; i < 20; i++) {
            // генерируем ID персоны
            NSString *personName = [self randomStringWithLength:7];
            
            NSArray *countries = @[@"Russia", @"France", @"England", @"Italy", @"U.S.A.", @"Germany", @"Mexico"];
            NSString *personCountry = [countries objectAtIndex:arc4random_uniform([countries count])];

            [persons addObject:[[CSPerson alloc] initWithID:++numberID Name:personName Country:personCountry]];
            
            NSLog(@"Person: ID:%u Nae:%@ Country:%@", numberID, personName, personCountry);
            
        }
        
    }
    return self;
}

-(NSString *)randomStringWithLength:(int)length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];

    for (int i=0; i<length; i++) {
    [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }

    return randomString;
}


- (NSArray *)persons
{
    return persons;
}

- (void)addPerson:(CSPerson *) person atIndex:(int) index
{
    if (persons.count >= index)
        [persons insertObject:person atIndex:index];
    else
        [persons addObject:person];
}

- (void)deletePersonAtIndex:(int) index
{
    [persons removeObjectAtIndex:index];
}

@end

