//
//  MatchDetailViewController.h
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface MatchDetailViewController : UIViewController

@property (nonatomic, strong) NSString *matchName;
@property (nonatomic, strong) NSString *town;
@property (nonatomic, strong) NSString *distance;
@property NSMutableArray *interests;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *townLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
- (IBAction)MatchButton:(id)sender;
@property TabBarController *tabBar;

@end
