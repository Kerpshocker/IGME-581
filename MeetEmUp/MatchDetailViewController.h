//
//  MatchDetailViewController.h
//  MeetEmUp
//
//  Created by Student on 4/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *Name;
@property (nonatomic, strong) NSString *matchName;

@end
