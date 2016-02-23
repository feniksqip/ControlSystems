//
//  CSPerson.h
//  ControlSystems
//
//  Created by Andrey on 19.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPerson : NSObject

@property (nonatomic) uint personID;
@property (strong, nonatomic) NSString *personName;
@property (strong, nonatomic) NSString *personCountry;

-(id)initWithID:(uint) personID
             Name:(NSString *) personName
           Country:(NSString *) personCountry;

@end
