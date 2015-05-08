//
//  MatchTableCell.h
//  MeetEmUp
//
//  Created by Student on 5/7/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentMatchTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *matchImage;
@property (weak, nonatomic) IBOutlet UILabel *matchName;
@property (weak, nonatomic) IBOutlet UILabel *matchTopCategory;

@end
