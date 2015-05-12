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
        self.name = dictionary[@"Name"] ? dictionary[@"Name"] : @"";
        self.interests = dictionary[@"Interests"] ? dictionary[@"Interests"] : @"";
        self.location = dictionary[@"Location"] ? dictionary[@"Location"] : @"";
        self.phone = dictionary[@"Phone"] ? dictionary[@"Phone"] : @"";
        self.currentMatches = dictionary[@"CurrentMatches"] ? dictionary[@"CurrentMatches"] : @"";
    }
    return self;
}

@end
