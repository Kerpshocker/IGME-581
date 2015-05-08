//
//  Database.h
//  MeetEmUp
//
//  Created by Student on 4/3/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Database : NSObject

//will have php file for each table
//tableName must end with a .php ext
//ex. fetchUsers.php
- (void)GetData:(NSString*)fileName completion:(void (^)(NSDictionary*))completion;

//save data to a specific table in the db
- (void)SaveData:(NSString*)fileName queryParams:(NSMutableArray*)queryParams;

- (void)UpdateProfile:(NSString*)fileName postParams:(NSMutableArray*)postParams;

@end
