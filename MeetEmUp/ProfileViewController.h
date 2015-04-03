//
//  ProfileViewController.h
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ProfileFirstName;
@property (weak, nonatomic) IBOutlet UITextField *ProfileLastName;
@property (weak, nonatomic) IBOutlet UIDatePicker *ProfileBirthday;

@end

