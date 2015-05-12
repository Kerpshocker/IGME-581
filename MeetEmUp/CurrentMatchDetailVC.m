//
//  CurrentMatchDetailVC.m
//  MeetEmUp
//
//  Created by Student on 5/7/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "CurrentMatchDetailVC.h"
#import "Profile.h"

@interface CurrentMatchDetailVC (){
    Database* db;
}

@end

@implementation CurrentMatchDetailVC

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
                self.contactLabel.text = prof.phone;
                
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
