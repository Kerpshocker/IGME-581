//
//  MatchDetailViewController.h
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "InterestTableCell.h"

@interface MatchDetailViewController : UIViewController

@property (nonatomic, strong) NSString *matchName;
@property NSInteger id;
@property NSString* contact;
@property (nonatomic, strong) NSString *town;
@property (nonatomic, strong) NSString *distance;
@property NSMutableArray *interestsArrayM;
@property NSArray *interestsArray;
@property NSString *interests;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *townLabel;
- (IBAction)MatchButton:(id)sender;
@property TabBarController *tabBar;

@property (weak, nonatomic) IBOutlet UITableView *interestTable;

@end
