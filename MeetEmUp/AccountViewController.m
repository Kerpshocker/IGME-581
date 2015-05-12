//
//  AccountViewController.m
//  MeetEmUp
//
//  Created by Student on 4/3/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "AccountViewController.h"
#import "TabBarController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController{
    Database* db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    db = [[Database alloc] init];
    
    [self.ErrorLabel setHidden:YES];
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
}
*/

- (IBAction)GoToLogin:(id)sender {
    //valid username and password fields
    if([self.usernameText.text length] > 0)
    {
        if([self.passwordText.text length] > 0)
        {
            //make a user and put into the database before going back to Login
            User* newUser = [[User alloc] init];
            newUser.username = self.usernameText.text;
            newUser.password = self.passwordText.text;
            
            NSMutableArray* queryParams = [NSMutableArray array];
            [queryParams addObject:[NSString stringWithFormat:@"Username=%@", newUser.username]];
            [queryParams addObject:[NSString stringWithFormat:@"Password=%@", newUser.password]];
            
            //put into the database...
            NSMutableString* query = [NSMutableString string];
            [query appendString:@"saveuser.php?"];
            
            [db SaveData:query queryParams:queryParams];
            
            [self performSegueWithIdentifier:@"Login" sender:self];
        }
        else
        {
            [self.ErrorLabel setHidden:NO];
        }
    }
    else
    {
        [self.ErrorLabel setHidden:NO];
    }
}
@end
