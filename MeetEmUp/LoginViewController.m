//
//  LoginViewController.m
//  MeetEmUp
//
//  Created by Student on 4/2/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "LoginViewController.h"
#import "MatchViewController.h"
#import "Database.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    Database* db;
    //NSDictionary* userResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.errorLabel setHidden:YES];
    
    db = [[Database alloc] init];
    
    [db GetData:@"fetchusers.php" completion:^(NSDictionary* userResults){
        NSArray* allUsers = userResults[@"results"];
        self.users = [NSMutableArray array];

        for(NSDictionary* dic in allUsers)
        {
            User* user = [[User alloc] initWithDictionary:dic];
            [self.users addObject:user];
        }
        
        //make some manual users to test the code
        User* newUser1 = [[User alloc] initNew];
        newUser1.username = @"nick";
        newUser1.password = @"54321";
        [self.users addObject:newUser1];
        
        User* newUser2 = [[User alloc] initNew];
        newUser2.username = @"dylan";
        newUser2.password = @"password";
        [self.users addObject:newUser2];
        
        
        
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
        if([u.username isEqualToString:self.UsernameText.text])
        {
            self.loginUsername = u.username;
            self.loginPassword = u.password;
            break;
        }
    }
    
    
    //check the text fields vs which profile the user is tring to access
    if([self.loginUsername isEqualToString:self.UsernameText.text])
    {
            if([self.loginPassword isEqualToString:self.PasswordText.text])
            {
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

- (IBAction)GoToAccount:(id)sender {
    [self performSegueWithIdentifier:@"Account" sender:self];
}
@end
