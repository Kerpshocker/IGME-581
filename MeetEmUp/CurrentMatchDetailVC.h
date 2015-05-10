//
//  CurrentMatchDetailVC.h
//  MeetEmUp
//
//  Created by Student on 5/7/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface CurrentMatchDetailVC : UIViewController

@property (nonatomic, strong) NSString *matchName;
@property (nonatomic, strong) NSString *town;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *contact;
@property NSMutableArray *interests;


@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *townLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
- (IBAction)MatchButton:(id)sender;
@property TabBarController *tabBar;
@end
