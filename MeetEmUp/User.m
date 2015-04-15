//
//  User.m
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.username = dictionary[@"Username"] ? dictionary[@"Username"] : @"";
        self.password = dictionary[@"Password"] ? dictionary[@"Password"] : @"";
    }
    return self;
}

- (instancetype)initNew
{
    self = [super init];
    self.username = @"newUser";
    self.password = @"12345";
    
    return self;
}

@end
