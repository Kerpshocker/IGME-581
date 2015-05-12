//
//  MainPageViewController.m
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "MainPageViewController.h"
#import "Profile.h"

@interface MainPageViewController (){
    Database* db;
}

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    db = [[Database alloc] init];
    self.peopleYouMatched = [NSMutableArray array];
    
    TabBarController *tabBar = (TabBarController *)self.tabBarController;
    [db GetData:[NSString stringWithFormat:@"fetchprofile.php?ID=%i", tabBar.id] completion:^(NSDictionary* dic){
        dispatch_async(dispatch_get_main_queue(), ^(void){
            for(NSDictionary* user in dic[@"results"])
            {
                Profile* prof = [[Profile alloc] initWithDictionary:user];

                self.name = prof.name;
                self.nameLabel.text = prof.name;
                self.interestsString = prof.interests;
                self.town = prof.location;
                self.phone = prof.phone;
                
                //matches
                NSArray* temp = [prof.currentMatches componentsSeparatedByString:@","];
                for(NSString* s in temp)
                {
                    [self.peopleYouMatched addObject:s];
                }
            }
            
            tabBar.name = self.name;
            self.nameLabel.text = self.name;
            tabBar.interests = self.interestsString;
            tabBar.town = self.town;
            tabBar.phone = self.phone;
            tabBar.peopleYouMatched = self.peopleYouMatched;
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

@end
