//
//  TabBarController.h
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "User.h"

@interface TabBarController : UITabBarController

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* password;
@property NSString* town;
@property NSString* phone;
@property NSInteger* age;
@property NSMutableArray *interests;

@property NSMutableArray* users;


@end
