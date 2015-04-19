//
//  EditProfileViewController.m
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TabBarController *tabBar = (TabBarController *)self.tabBarController;
    self.firstNameField.text = tabBar.name;
    self.lastNameField.text = tabBar.password;
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
}
*/

- (IBAction)SaveChanges:(id)sender {
    [self performSegueWithIdentifier:@"SaveChanges" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SaveChanges"]) {
        TabBarController *destViewController = segue.destinationViewController;
        destViewController.name = self.firstNameField.text;
    }
}
@end
