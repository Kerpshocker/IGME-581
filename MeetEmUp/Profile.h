//
//  Profile.h
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property NSString* username;
@property NSString* fullName;
@property NSInteger* age;
@property NSString* town;

- (instancetype) initWithDictionary:(NSDictionary*)dictionary;
- (instancetype) initNew;

@end
