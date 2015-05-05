//
//  LoginViewController.h
//  MeetEmUp
//
//  Created by Student on 4/2/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *UsernameText;
@property (weak, nonatomic) IBOutlet UITextField *PasswordText;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property NSMutableArray* users;
@property (strong, nonatomic) IBOutlet UIView *loginView;

@property NSString* loginUsername;
@property NSString* loginPassword;

- (IBAction)LoginPressed:(id)sender;
- (IBAction)GoToAccount:(id)sender;

/*
 Going to need a create account button that directs the user to 
 a new view and allows them to be added to the database.
 Use the same techniques we did when we added the login button.
 ie.
    Create a new view in storyboard and a new class that connects to it.
    Create a new button that segues to that view when tapped "up inside" (same way we 
    add the LoginPressed method)
    After submitting new account, **going to need to verify account and pw eventually**
    add the user to the database, segue to the profile page with the prepopulate fields
*/
@end
