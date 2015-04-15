//
//  MatchesViewController.m
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "MatchListViewController.h"

@implementation MatchListViewController{
    Database* db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    db = [[Database alloc] init];
    
    self.users = [NSMutableArray array];
    
    //this isn't reading for some reason...
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [db GetData:@"fetchusers.php" completion:^(NSDictionary* userResults){
            NSArray* allUsers = userResults[@"results"];
            
            for(NSDictionary* dic in allUsers)
            {
                User* user = [[User alloc] initWithDictionary:dic];
                [self.users addObject:user];
            }
            
        }];
    });
    
    //make some manual users to test the code
    User* newUser1 = [[User alloc] initNew];
    newUser1.username = @"nick";
    newUser1.password = @"54321";
    [self.users addObject:newUser1];
    
    User* newUser2 = [[User alloc] initNew];
    newUser2.username = @"dylan";
    newUser2.password = @"password";
    [self.users addObject:newUser2];
    
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


@end