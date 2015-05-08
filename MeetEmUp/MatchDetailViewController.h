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
@property (weak, nonatomic) IBOutlet UILabel *name;
- (IBAction)MatchButton:(id)sender;
@property TabBarController *tabBar;

@end
