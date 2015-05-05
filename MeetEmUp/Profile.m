//
//  Profile.m
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "Profile.h"

@implementation Profile

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.username = dictionary[@"Username"] ? dictionary[@"Username"] : @"";
        self.fullName = dictionary[@"FullName"] ? dictionary[@"FullName"] : @"";
        self.town = dictionary[@"Town"] ? dictionary[@"Town"] : @"";
    }
    return self;
}

@end
