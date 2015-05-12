//
//  MatchDetailViewController.m
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "MatchDetailViewController.h"
#import "Profile.h"

@interface MatchDetailViewController (){
    Database* db;
}
@end

@implementation MatchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    db = [[Database alloc] init];
    
    NSString* url = [NSString stringWithFormat:@"fetchprofile.php?ID=%i", self.id];
    
    [db GetData:url completion:^(NSDictionary* profileResults){
        dispatch_async(dispatch_get_main_queue(), ^(void){
            for(NSDictionary* dic in profileResults[@"results"]){
                Profile* prof = [[Profile alloc] initWithDictionary:dic];
                self.matchName = prof.name;
                self.town= prof.location;
                self.interests = prof.interests;
                self.name.text = self.matchName;
                self.townLabel.text = self.town;
                
                //explode interests into array
                self.interestsArray = [self.interests componentsSeparatedByString: @","];
                self.interestsArrayM = [NSMutableArray array];
                
                for(NSString* s in self.interestsArray)
                {
                    [self.interestsArrayM addObject:s];
                }
                //Run UI Updates
                [self.interestTable reloadData];
            }
        
        });
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
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.interestsArrayM count];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.interestTable insertRowsAtIndexPaths:nil withRowAnimation:(UITableViewRowAnimationNone)];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"Interest";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.interestsArrayM objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)MatchButton:(id)sender {
    //add this user to an array of users that you have hit match to, but not to the actual match list. We must first check to see if they matched you too before they are added to the mutual match list
    [self performSegueWithIdentifier:@"AddMatch" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddMatch"]) {
        TabBarController *destViewController = segue.destinationViewController;
        destViewController.name = self.tabBar.name;
        destViewController.username = self.tabBar.username;
        destViewController.password = self.tabBar.password;
        destViewController.id = self.tabBar.id;
        destViewController.town = self.tabBar.town;
        destViewController.phone = self.tabBar.phone;
        destViewController.peopleYouMatched = self.tabBar.peopleYouMatched;
        destViewController.mutualMatches= self.tabBar.mutualMatches;
        
        destViewController.interests = self.tabBar.interests;
        
        NSMutableArray* profileData = [[NSMutableArray alloc] init];
        [profileData addObject:[NSString stringWithFormat:@"Name=%@", destViewController.name]];
        [profileData addObject:[NSString stringWithFormat:@"Interests=%@", destViewController.interests]];
        [profileData addObject:[NSString stringWithFormat:@"Location=%@", destViewController.town]];
        [profileData addObject:[NSString stringWithFormat:@"Phone=%@", destViewController.phone]];
        [profileData addObject:[NSString stringWithFormat:@"ID=%@",  [NSNumber numberWithInt:destViewController.id]]];
        
        [db UpdateProfile:@"editprofile.php?" postParams:profileData];
    }
}
@end
