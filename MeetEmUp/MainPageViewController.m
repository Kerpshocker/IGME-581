//
//  MainPageViewController.m
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TabBarController *tabBar = (TabBarController *)self.tabBarController;
    self.id = tabBar.id;
    self.name = tabBar.name;
    self.nameLabel.text = self.name;
    self.interests = tabBar.interests;
    [self.interests addObject:@"test"];
    self.town = tabBar.town;
    self.phone = tabBar.phone;
    
    //matches
    self.peopleYouMatched = tabBar.peopleYouMatched;
    self.mutualMatches = tabBar.mutualMatches;
    
    NSLog(@"%i", self.id);
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
