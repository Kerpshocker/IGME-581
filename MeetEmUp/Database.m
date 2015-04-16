//
//  Database.m
//  MeetEmUp
//
//  Created by Student on 4/3/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "Database.h"

//constants
NSString *MEETEMUP_URL = @"http://people.rit.edu/njk3054/database/";

@implementation Database{
    //properties
    NSDictionary *json;
    NSURLSession *_session;
}

//wont return anything, when its done, invokes completion
- (void)GetData:(NSString*)fileName completion:(void (^)(NSDictionary*))completion{
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
    [searchString appendString:fileName];
    
    NSURL *url = [NSURL URLWithString:searchString];
    
    //this is a data task where we request a resource
    NSURLSessionDataTask *dataTask = [_session dataTaskWithURL:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
         if(!error){
             NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*)response;
             //HTTP status code 200 is ok
             if(httpResp.statusCode == 200){
                 NSError *jsonError;
                 //conver loaded string to JSON
                 json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
                 
                 completion(json);
             } else {
                 NSLog(@"Error reading file. Status Code = %lu", httpResp.statusCode);
             }
         } else {
             NSLog(@"Datatask failed. Research why this would fail - Love, Nate.");
         }
     }];
    //starts or resumes the data task
    [dataTask resume];
}

- (void)GetData:(NSString*)fileName tableView:(UITableView*)tableView completion:(void (^)(NSDictionary*))completion{
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
    [searchString appendString:fileName];
    
    NSURL *url = [NSURL URLWithString:searchString];
    
    //this is a data task where we request a resource
    NSURLSessionDataTask *dataTask = [_session dataTaskWithURL:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
         if(!error){
             NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*)response;
             //HTTP status code 200 is ok
             if(httpResp.statusCode == 200){
                 NSError *jsonError;
                 //conver loaded string to JSON
                 json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                     completion(json);
                     [tableView reloadData];
                 });
             } else {
                 NSLog(@"Error reading file. Status Code = %lu", httpResp.statusCode);
             }
         } else {
             NSLog(@"Datatask failed. Research why this would fail - Love, Nate.");
         }
     }];
    //starts or resumes the data task
    [dataTask resume];
}

//save data based on table passed in. some will have query params (THAT WE PASS IN) others wont. php file takes care of those
- (void)SaveData:(NSString *)fileName queryParams:(NSMutableArray *)queryParams{
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
    [searchString appendString:fileName];
    [searchString appendString:[queryParams componentsJoinedByString:@"&"]];
    
    NSURL *url = [NSURL URLWithString:searchString];
    
    //this is a data task where we request a resource
    NSURLSessionDataTask *dataTask = [_session dataTaskWithURL:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
         if(!error){
             NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*)response;
             
             //HTTP status code 200 is ok
             if(httpResp.statusCode == 200){
                 NSLog(@"User saved");
             } else {
                 NSLog(@"Error reading file. Status Code = %lu", httpResp.statusCode);
             }
         } else {
             NSLog(@"Datatask failed. Research why this would fail - Love, Nate.");
         }
     }];
    //starts or resumes the data task
    [dataTask resume];
}

@end
