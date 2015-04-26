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
    
    [self.interestTable setEditing:YES];

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numCells;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.numCells++;
    [self.interestTable insertRowsAtIndexPaths:nil withRowAnimation:(UITableViewRowAnimationNone)];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"Interest";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    return cell;
}

- (IBAction)SaveChanges:(id)sender {
    [self performSegueWithIdentifier:@"SaveChanges" sender:self];
}

- (IBAction)AddInterest:(id)sender {
    //add the what is in the text field into the table of interests
    self.numCells++;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SaveChanges"]) {
        TabBarController *destViewController = segue.destinationViewController;
        destViewController.name = self.firstNameField.text;
    }
}
@end
