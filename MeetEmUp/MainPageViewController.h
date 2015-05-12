//
//  MainPageViewController.h
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface MainPageViewController : UIViewController

@property (nonatomic, strong) NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property NSMutableArray *interests;
@property NSString *interestsString;
@property NSString* town;
@property NSString* phone;
@property NSInteger* age;
@property NSString* username;
@property NSString* password;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@property NSMutableArray* peopleYouMatched;
@property NSMutableArray* mutualMatches;
@end
