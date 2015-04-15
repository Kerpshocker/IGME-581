//
//  MatchesViewController.h
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "LoginViewController.h"
#import "MatchViewController.h"
#import "Database.h"

@interface MatchListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray* users;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end