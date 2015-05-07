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

- (IBAction)MatchButton:(id)sender {
    //add this user to an array of users that you have hit match to, but not to the actual match list. We must first check to see if they matched you too before they are added to the mutual match list
    
}
@end
