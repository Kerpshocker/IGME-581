//
//  LoginViewController.m
//  MeetEmUp
//
//  Created by Student on 4/2/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "LoginViewController.h"
#import "Database.h"
#import "TabBarController.h"
#import "Profile.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    Database* db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.errorLabel setHidden:YES];
    
    db = [[Database alloc] init];
    self.users = [NSMutableArray array];
    
    [db GetData:@"fetchusers.php" completion:^(NSDictionary* userResults){
        for(NSDictionary* dic in userResults[@"results"])
        {
            User* user = [[User alloc] initWithDictionary:dic];
            [self.users addObject:user];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
 
    //Going to need this method to pass data between views.
    //Only Problem I see currently is that we need to switch the views currently so 
    //that the profile page is the first one the user gets segue'd to.
    //After that, pass the data from the database for the current logged in user 
    //to that page with prepopulated information and have them fill out the rest.
}
*/

- (IBAction)LoginPressed:(id)sender {
    //should validate the password at some point in the future
    //right now - check to see if the username/password match
    
    //loop database results for the correct UN and PW (bad idea)
    
    //loop through the usernames and see if the user is tring to access a valid account
    for(User* u in self.users)
    {
        //check the text fields vs which profile the user is tring to access
        if([u.username isEqualToString:self.UsernameText.text])
        {
            if([u.password isEqualToString:self.PasswordText.text])
            {
                self.loggedInUserID = u.id;
                self.loginUsername = u.username;
                self.loginPassword = u.password;
                
                [self performSegueWithIdentifier:@"ShowTabs" sender:self];
            }
            else
            {
                [self.errorLabel setHidden:NO];
            }
        }
        else
        {
            [self.errorLabel setHidden:NO];
        }
    }
}

- (IBAction)GoToAccount:(id)sender {
    [self performSegueWithIdentifier:@"Account" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowTabs"]) {
        TabBarController *destViewController = segue.destinationViewController;
        destViewController.id = self.loggedInUserID;
        destViewController.password = self.loginPassword;
        destViewController.username = self.loginUsername;
    }
}
@end
