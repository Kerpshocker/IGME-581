//
//  EditProfileViewController.m
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "EditProfileViewController.h"
#import "Profile.h"

@interface EditProfileViewController (){
    Database* db;
    NSMutableArray* userInterests;
}

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar = (TabBarController *)self.tabBarController;
    self.id = self.tabBar.id;
    self.peopleYouMatched = self.tabBar.peopleYouMatched;
    self.mutualMatches = self.tabBar.mutualMatches;
    
    db = [[Database alloc] init];
    
    NSString* url = [NSString stringWithFormat:@"fetchprofile.php?ID=%i", self.id];
    
    [db GetData:url completion:^(NSDictionary* profileResults){
        dispatch_async(dispatch_get_main_queue(), ^(void){
        for(NSDictionary* dic in profileResults[@"results"]){
            Profile* prof = [[Profile alloc] initWithDictionary:dic];
            self.nameField.text = prof.name;
            self.interests = prof.interests;
            self.townField.text = prof.location;
            self.phoneField.text = prof.phone;
            
            //explode interests into array
            self.interestsArray = [self.interests componentsSeparatedByString: @","];
            self.interestsArrayM = [NSMutableArray array];
            
            for(NSString* s in self.interestsArray)
            {
                [self.interestsArrayM addObject:s];
            }
        }
            //Run UI Updates
            [self.interestTable reloadData];
            });
        
    }];
    
    
    
    
    
    _editProfView.layer.borderWidth = 5.0f;
    _editProfView.layer.borderColor = [[UIColor grayColor]CGColor];
    _editProfView.layer.cornerRadius = 5;
    
    [self.interestTable setEditing:YES];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
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

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.numCells++;
    [self.interestTable insertRowsAtIndexPaths:nil withRowAnimation:(UITableViewRowAnimationNone)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.interestsArrayM count];
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

- (IBAction)SaveChanges:(id)sender {
    
    //add data to database
    NSMutableArray* changes = [[NSMutableArray alloc]init];
    //[changes addObject:[NSString stringWithFormat:@"Interests=%@", [self.interests componentsJoinedByString:@","]]];
    //add the rest
    
    [self performSegueWithIdentifier:@"SaveChanges" sender:self];
    
    
}

- (IBAction)AddInterest:(id)sender {
    //add the what is in the text field into the table of interests
    self.numCells++;
    
    //make sure the interest doesn't already exist
    _alreadyExists = NO;
    for(NSString *i in self.interestsArrayM)
    {
        if([i isEqualToString:self.interestText.text])
        {
            _alreadyExists = YES;
        }
    }
    //make sure the new interest is legit
    if([self.interestText.text length] > 0 && !_alreadyExists)
    {
        [self.interestsArrayM addObject:self.interestText.text];
    }
    [self.interestTable reloadData];
}

- (IBAction)takePhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SaveChanges"]) {
        TabBarController *destViewController = segue.destinationViewController;
        destViewController.name = self.nameField.text;
        destViewController.username = self.tabBar.username;
        destViewController.password = self.tabBar.password;
        destViewController.id = self.tabBar.id;
        destViewController.town = self.townField.text;
        destViewController.phone = self.phoneField.text;
        destViewController.peopleYouMatched = self.tabBar.peopleYouMatched;
        destViewController.mutualMatches= self.tabBar.mutualMatches;
        
        //put the interest array back into strings
        self.interests = [self.interestsArrayM componentsJoinedByString: @","];
        destViewController.interests = self.interests;
        
        NSMutableArray* profileData = [[NSMutableArray alloc] init];
        [profileData addObject:[NSString stringWithFormat:@"Name=%@", destViewController.name]];
        [profileData addObject:[NSString stringWithFormat:@"Interests=%@", destViewController.interests]];
        [profileData addObject:[NSString stringWithFormat:@"Location=%@", destViewController.town]];
        [profileData addObject:[NSString stringWithFormat:@"Phone=%@", destViewController.phone]];
        [profileData addObject:[NSString stringWithFormat:@"ID=%@",  [NSNumber numberWithInt:destViewController.id]]];
        
        [db UpdateProfile:@"editprofile.php?" postParams:profileData];
    }
}
@end
