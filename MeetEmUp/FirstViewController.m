//
//  FirstViewController.m
//  MeetEmUp
//
//  Created by Student on 3/15/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "FirstViewController.h"

//constants
NSString *MEETEMUP_URL = @"http://people.rit.edu/njk3054/database/fetchusers.php";

@interface FirstViewController ()

@end

@implementation FirstViewController{
    //properties
    NSMutableArray *_data;
    NSMutableArray *_temp;
    NSURLSession *_session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _data = [NSMutableArray array];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{
    //NSURLSession is a class used to downlaod data via HTTP
    //ephemeralSessionConfig means we don't need to cache anything
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    //create a new NSURLSession
    _session = [NSURLSession sessionWithConfiguration:config];
    
    //show the activity indicator in upper left of screen
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //dynamically built url
    NSMutableString *searchString = [NSMutableString string];
    [searchString appendString:MEETEMUP_URL];
    //replace spaces with %20
    NSLog(@"%@", searchString);
    
    NSURL *url = [NSURL URLWithString:searchString];
    
    //this is a data task where we request a resource
    NSURLSessionDataTask *dataTask =
    [_session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error){
                NSLog(@"data=%@", [[NSString alloc] initWithData:data
                                                        encoding:NSUTF8StringEncoding]);
                if(!error){
                    NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*)response;
                    //HTTP status code 200 is ok
                    if(httpResp.statusCode == 200){
                        NSError *jsonError;
                        //conver loaded string to JSON
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
                        
                        //finally start parsing it
                        if(!jsonError){
                            //change this
                            NSArray *allUsers = json[@"events"][@"event"];
                            NSMutableArray *tempUser = [NSMutableArray array];
                            
                            if(tempUser.count == 0){
                                User *user = [[User alloc] initWithDictionary:@{@"name" : @"No results found"}];
                                [tempUser addObject:user];
                            }
                            
                            //loop it
                            for(NSDictionary *d in allUsers){
                                User *user = [[User alloc] initWithDictionary:d];
                                [tempUser addObject:user];
                            }
                            
                            //update table
                            //why dispatch_async()?
                            //whenever you're dealing with asynchronous network calls, you have to make sure to update UIKit classes on main thread
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                _data = tempUser;
                                NSLog(@"_data: %@", _data);
                                //[self.tableView reloadData];
                            });
                        }
                    }
                }
            }];
    //starts or resumes the data task
    [dataTask resume];

}
@end
