//
//  MatchDetailViewController.m
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "MatchDetailViewController.h"

@interface MatchDetailViewController ()

@end

@implementation MatchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name.text = self.matchName;
    self.tabBar = (TabBarController *)self.tabBarController;
    self.townLabel.text = self.town;
    self.distanceLabel.text = self.distance;
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
    // Return the number of rows in the section.
    return [self.interests count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"Interest";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.interests objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)MatchButton:(id)sender {
    //add this user to an array of users that you have hit match to, but not to the actual match list. We must first check to see if they matched you too before they are added to the mutual match list
    [self.tabBar.peopleYouMatched addObject:self.matchName];
    [self performSegueWithIdentifier:@"AddMatch" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddMatch"]) {
        TabBarController *destViewController = segue.destinationViewController;
        destViewController.peopleYouMatched = self.tabBar.peopleYouMatched;
        destViewController.mutualMatches= self.tabBar.mutualMatches;
        destViewController.name = self.tabBar.name;
        destViewController.username = self.tabBar.name;
        destViewController.password = self.tabBar.password;
        destViewController.interests = self.tabBar.interests;
        destViewController.town = self.tabBar.town;
        destViewController.phone = self.tabBar.phone;
    }
}
@end
