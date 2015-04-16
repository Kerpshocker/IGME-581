//
//  MatchesViewController.m
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "MatchListViewController.h"
#import "MatchDetailViewController.h"

@implementation MatchListViewController{
    Database* db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    db = [[Database alloc] init];
    self.users = [NSMutableArray array];
    
    [db GetData:@"fetchusers.php" tableView:self.tableView completion:^(NSDictionary* userResults){
        NSArray* allUsers = userResults[@"results"];
        
        for(NSDictionary* dic in allUsers)
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.users count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Match";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    User* temp = [self.users objectAtIndex:indexPath.row];
    cell.textLabel.text = temp.username;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MatchDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MatchDetailViewController *destViewController = segue.destinationViewController;
        User* temp = [self.users objectAtIndex:indexPath.row];
        destViewController.matchName = temp.username;
    }
}


@end