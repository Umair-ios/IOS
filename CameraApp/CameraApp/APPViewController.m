//
//  APPViewController.m
//  CameraApp
//
//  Created by Rafael Garcia Leiva on 10/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MenuViewController.h"
@interface APPViewController ()

@end

@implementation APPViewController

- (void)viewDidLoad {
       [super viewDidLoad];
          scroller.contentSize = CGSizeMake(320 , 500);
      	// Do any additional setup after loading the view, typically from a nib.
       [imageView.layer setBorderWidth: 2.0];
    topCaptionText.hidden=YES;
    bottomCaptionText.hidden=YES;
    topLbl.hidden=YES;
    bottomLbl.hidden=YES;
    topLbl.font = [UIFont fontWithName:@"Impact" size:26];
    bottomLbl.font = [UIFont fontWithName:@"Impact" size:15];

    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
    
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"message:@"Device has no camera"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [myAlertView show];
    }
    topCaptionText.delegate = self;
    bottomCaptionText.delegate = self;
       [imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
 
}

-(IBAction)saveImage:(id)sender
{
    
    

    UIGraphicsBeginImageContext(backgroundView.bounds.size);
    [backgroundView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    // Request to save the image to camera roll
    [library writeImageToSavedPhotosAlbum:[image CGImage] orientation:(ALAssetOrientation)[image imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error)
    {
        if (error)
        {
            NSLog(@"error");
        } else
        {
            NSLog(@"url %@", assetURL);
        }
    }];  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    if (textField == topCaptionText)
    {
		[textField resignFirstResponder];
        topLbl.text=topCaptionText.text;
        topCaptionText.hidden=YES;
        topLbl.hidden=NO;
        [bottomCaptionText becomeFirstResponder];
	}
    else
    {
        [textField resignFirstResponder];
        bottomLbl.text=bottomCaptionText.text;
        bottomCaptionText.hidden=YES;
        bottomLbl.hidden=NO;
    }
    return YES;
}
- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField==topCaptionText)
    {
        textField.returnKeyType = UIReturnKeyNext;
    }
    else
    {
        textField.returnKeyType = UIReturnKeyDone;
    }
    
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    topLbl.hidden=YES;
    bottomLbl.hidden=YES;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

    
}


#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    topCaptionText.hidden=NO;
    bottomCaptionText.hidden=NO;
    topLbl.hidden=YES;
    bottomLbl.hidden=YES;
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
   }

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
-(IBAction)menu:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
 
}
@end
