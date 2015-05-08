//
//  EditProfileViewController.m
//  MeetEmUp
//
//  Created by Student on 4/19/15.
//  Copyright (c) 2015 Nathaniel Kierpiec Nick Greenquist Dylan Coats Max Peabody. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController (){
    Database* db;
}

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    db = [[Database alloc] init];
    
    self.tabBar = (TabBarController *)self.tabBarController;
    self.nameField.text = self.tabBar.name;
    self.townField.text = self.tabBar.town;
    self.phoneField.text = self.tabBar.phone;
    self.interests = self.tabBar.interests;
    // Do any additional setup after loading the view.
    
    
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
    return [self.interests count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"Interest";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.interests objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)SaveChanges:(id)sender {
    [self performSegueWithIdentifier:@"SaveChanges" sender:self];
    
    //add data to database
    NSMutableArray* changes = [[NSMutableArray alloc]init];
    [changes addObject:[NSString stringWithFormat:@"Interests=%@", [self.interests componentsJoinedByString:@","]]];
    //add the rest
}

- (IBAction)AddInterest:(id)sender {
    //add the what is in the text field into the table of interests
    self.numCells++;
    
    //make sure the interest doesn't already exist
    _alreadyExists = NO;
    for(NSString *i in self.interests)
    {
        if([i isEqualToString:self.interestText.text])
        {
            _alreadyExists = YES;
        }
    }
    //make sure the new interest is legit
    if([self.interestText.text length] > 0 && !_alreadyExists)
    {
        [self.interests addObject:self.interestText.text];
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
        destViewController.username = self.nameField.text;
        destViewController.password = self.tabBar.password;
        destViewController.interests = self.interests;
        destViewController.town = self.townField.text;
        destViewController.phone = self.phoneField.text;
        destViewController.peopleYouMatched = self.tabBar.peopleYouMatched;
        destViewController.mutualMatches= self.tabBar.mutualMatches;
    }
}
@end
