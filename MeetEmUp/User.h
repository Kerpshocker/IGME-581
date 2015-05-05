//
//  User.h
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString* username;
@property NSString* password;

- (instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end
