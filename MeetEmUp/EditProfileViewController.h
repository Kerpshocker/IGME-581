//
//  EditProfileViewController.h
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "InterestTableCell.h"

@interface EditProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITableView *interestTable;
@property NSInteger numCells;
- (IBAction)SaveChanges:(id)sender;
- (IBAction)AddInterest:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *interestText;

@end
