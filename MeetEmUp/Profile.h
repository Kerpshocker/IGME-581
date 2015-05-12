//
//  Profile.h
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarController.h"

@interface Profile : NSObject

@property NSString* name;
@property NSString* interests;
@property NSString* location;
@property NSString* phone;
@property NSString* currentMatches;

- (instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end
