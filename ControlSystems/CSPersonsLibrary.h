//
//  CSPersonsLibrary.h
//  ControlSystems
//
//  Created by Andrey on 23.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

// Создаем синглтон объекта PersonsLibrary

#import <Foundation/Foundation.h>
#import "CSPerson.h"

@interface CSPersonsLibrary : NSObject

+(CSPersonsLibrary *)sharedInstance;

-(NSArray *)persons;
-(void)addPerson:(CSPerson *) person atIndex:(int) index;
-(void)deletePersonAtIndex:(int) index;

@end
