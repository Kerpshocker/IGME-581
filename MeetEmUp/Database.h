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
- (void)GetData:(NSString*)tableName completion:(void (^)(NSDictionary*))completion;

@end
