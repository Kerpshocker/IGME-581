//
//  SearchListTVC.h
//  MeetEmUp
//
//  Created by Student on 5/7/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface SearchListTVC : UITableViewController

@property(nonatomic, retain) UITableView *tableView;
@property (nonatomic, strong) NSString *name;
@property TabBarController *tabBar;

@end
