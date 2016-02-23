//
//  CSPerson.m
//  ControlSystems
//
//  Created by Andrey on 19.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "CSPerson.h"

@implementation CSPerson

-(id)initWithID:(uint)personID Name:(NSString *)personName Country:(NSString *)personCountry {
    self = [super init];
    if (self)
    {
        _personID = personID;
        _personName = personName;
        _personCountry = personCountry;
    }
    return self;
}

@end
