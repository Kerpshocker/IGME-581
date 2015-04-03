//
//  Database.m
//  MeetEmUp
//
//  Created by Student on 4/3/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "Database.h"

//constants
NSString *MEETEMUP_URL = @"http://people.rit.edu/njk3054/database/fetchusers.php";

@implementation Database{
    //properties
    NSDictionary *json;
    NSURLSession *_session;
}

- (NSDictionary*)Data{
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
    
    NSURL *url = [NSURL URLWithString:searchString];
    
    //this is a data task where we request a resource
    NSURLSessionDataTask *dataTask = [_session dataTaskWithURL:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
         NSLog(@"data=%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
         if(!error){
             NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*)response;
             //HTTP status code 200 is ok
             if(httpResp.statusCode == 200){
                 NSError *jsonError;
                 //conver loaded string to JSON
                 json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
             }
         }
     }];
    //starts or resumes the data task
    [dataTask resume];
    
    return json;
}

@end
