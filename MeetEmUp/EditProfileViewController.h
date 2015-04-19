//
//  EditProfileViewController.h
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface EditProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
- (IBAction)SaveChanges:(id)sender;

@end
