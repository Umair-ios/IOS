//
//  LoLifyViewController.m
//  CameraApp
//
//  Created by iOS Dev on 10/29/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "LoLifyViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface LoLifyViewController ()

@end

@implementation LoLifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    scrollar.contentSize = CGSizeMake(320 , 520);
    // Do any additional setup after loading the view, typically from a nib.
    topCaptionText.hidden=YES;
    middleCaptionText.hidden=YES;
    bottomCaptionText.hidden=YES;
    topLbl.hidden=YES;
    middleLbl.hidden=YES;
    bottomLbl.hidden=YES;
    topLbl.font = [UIFont fontWithName:@"Impact" size:26];
    middleLbl.font=[UIFont fontWithName:@"Impact" size:26];
    bottomLbl.font = [UIFont fontWithName:@"Impact" size:26];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"message:@"Device has no camera"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [myAlertView show];
    }
    topCaptionText.delegate = self;
    middleCaptionText.delegate=self;
    bottomCaptionText.delegate = self;


}

- (IBAction)align:(id)sender
{
    UIButton *instanceButton = (UIButton*)sender;
    if (instanceButton.tag==0)
    {
        topLbl.textAlignment = NSTextAlignmentLeft;
    }
    else if (instanceButton.tag==1)
    {
        topLbl.textAlignment = NSTextAlignmentCenter;

    }
    else if (instanceButton.tag==2)
    {
        topLbl.textAlignment = NSTextAlignmentRight;
        
    }
    if (instanceButton.tag==3)
    {
        middleLbl.textAlignment = NSTextAlignmentLeft;
    }
    else if (instanceButton.tag==4)
    {
        middleLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    else if (instanceButton.tag==5)
    {
        middleLbl.textAlignment = NSTextAlignmentRight;
        
    }
    if (instanceButton.tag==6)
    {
        bottomLbl.textAlignment = NSTextAlignmentLeft;
    }
    else if (instanceButton.tag==7)
    {
        bottomLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    else if (instanceButton.tag==8)
    {
        bottomLbl.textAlignment = NSTextAlignmentRight;
        
    }
}

-(IBAction)saveImage:(id)sender
{
    [imageView addSubview:topLbl];
    [imageView addSubview:middleLbl];
    [imageView addSubview:bottomLbl];
    UIGraphicsBeginImageContext(imageView.bounds.size);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
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


- (IBAction)takePhoto:  (UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    topLbl.hidden=YES;
    middleLbl.hidden=YES;
    bottomLbl.hidden=YES;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    topCaptionText.hidden=NO;
    middleCaptionText.hidden=NO;
    bottomCaptionText.hidden=NO;
    
    topLbl.hidden=YES;
    middleLbl.hidden=YES;
    bottomLbl.hidden=YES;
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    if (textField == topCaptionText)
    {
		[textField resignFirstResponder];
        topLbl.text=topCaptionText.text;
        topCaptionText.hidden=YES;
        topLbl.hidden=NO;
        [middleCaptionText becomeFirstResponder];
	}
    else if(textField == middleCaptionText )
    {
        [textField resignFirstResponder];
        middleLbl.text=middleCaptionText.text;
        middleCaptionText.hidden=YES;
        middleLbl.hidden=NO;
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
       else if(textField==middleCaptionText)
    {
        textField.returnKeyType = UIReturnKeyNext;
    }
       else
    {
        textField.returnKeyType = UIReturnKeyDone;
    }


    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)menu:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
