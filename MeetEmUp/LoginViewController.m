//
//  LoginViewController.m
//  MeetEmUp
//
//  Created by Student on 4/2/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

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
    [self performSegueWithIdentifier:@"ShowTabs" sender:self];
}
@end
