//
//  TypeViewController.m
//  CameraApp
//
//  Created by iOS Dev on 10/31/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "TypeViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface TypeViewController ()

@end

@implementation TypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)labelDragged:(UIPanGestureRecognizer *)gesture
{
    UILabel *label = (UILabel *)gesture.view;
	CGPoint translation = [gesture translationInView:label];
    
	// move label
	label.center = CGPointMake(label.center.x + translation.x,
                               label.center.y + translation.y);
    
	// reset translation
	[gesture setTranslation:CGPointZero inView:label];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    topLbl.font = [UIFont fontWithName:@"Impact" size:26];
    bottomLbl.font = [UIFont fontWithName:@"Impact" size:26];
    [scrollView setContentSize:CGSizeMake(1000,63)];
    topCaptionText.delegate = self;
    bottomCaptionText.delegate = self;
    UIPanGestureRecognizer *gestureTop = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(labelDragged:)] ;
    UIPanGestureRecognizer *gestureBottum = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(labelDragged:)] ;
    [topLbl addGestureRecognizer:gestureTop];
    [bottomLbl addGestureRecognizer:gestureBottum];
    
    viewColors.hidden=YES;

  
    images = [NSArray arrayWithObjects:[UIImage imageNamed:@"Default.png"], [UIImage imageNamed:@"Default.png"], [UIImage imageNamed:@"Default.png"],[UIImage imageNamed:@"Default.png"],[UIImage imageNamed:@"Default.png"], nil];
    
    for (int i = 0; i < images.count; i++)
    {
        CGRect frame;
        frame.size.height = 50;
        frame.size.width = 50;

        frame.origin.x = 4+scrollView.frame.size.width/6 * i;
        frame.origin.y = 6;
        
        UIButton *subview = [[UIButton alloc] initWithFrame:frame];
        [subview setBackgroundImage:[images objectAtIndex:i] forState:normal];
        [subview addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        subview.tag=i;
        [scrollView addSubview:subview];
    }

    topLbl.hidden=YES;
    bottomLbl.hidden=YES;
    
}


-(void)buttonAction:(id)sender
{
    UIButton *pressedButton = (UIButton *)sender;
    if (pressedButton.tag==0) {
        imageview.backgroundColor=[UIColor blackColor];
    }
    else if (pressedButton.tag==1) {
        imageview.backgroundColor=[UIColor brownColor];
    }
  else  if (pressedButton.tag==2) {
        imageview.backgroundColor=[UIColor blueColor];
    }
   else if (pressedButton.tag==3) {
        imageview.backgroundColor=[UIColor whiteColor];
    }
  else  if (pressedButton.tag==4) {
        imageview.backgroundColor=[UIColor yellowColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Save:(id)sender {
    [imageview addSubview:topLbl];
    [imageview addSubview:bottomLbl];
    topLbl.frame=CGRectMake(topLbl.frame.origin.x, topLbl.frame.origin.y-66, topLbl.frame.size.width, topLbl.frame.size.height);
    bottomLbl.frame=CGRectMake(bottomLbl.frame.origin.x, bottomLbl.frame.origin.y-66, bottomLbl.frame.size.width, bottomLbl.frame.size.height);

    UIGraphicsBeginImageContext(imageview.bounds.size);
    [imageview.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   
//    [topLbl removeFromSuperview];
//    [bottomLbl removeFromSuperview];
    [self.view addSubview:topLbl];
    [self.view addSubview:bottomLbl];

    topLbl.frame=CGRectMake(topLbl.frame.origin.x, topLbl.frame.origin.y+66, topLbl.frame.size.width, topLbl.frame.size.height);
    bottomLbl.frame=CGRectMake(bottomLbl.frame.origin.x, bottomLbl.frame.origin.y+66, bottomLbl.frame.size.width, bottomLbl.frame.size.height);
    

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

- (IBAction)upload:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Upload background!"
                                                      message:@""
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Upload", @"Take BG", nil];
    [message show];
}

- (IBAction)Colors:(id)sender
{

    UIButton *pressedButton = (UIButton *)sender;
    if (pressedButton.tag==0) {
        topLbl.textColor=[UIColor brownColor];
        bottomLbl.textColor=[UIColor brownColor];
            }
    else if (pressedButton.tag==1) {
        topLbl.textColor=[UIColor orangeColor];
        bottomLbl.textColor=[UIColor orangeColor];
    }
    else  if (pressedButton.tag==2) {
        topLbl.textColor=[UIColor purpleColor];
        bottomLbl.textColor=[UIColor purpleColor];
    }
    else if (pressedButton.tag==3) {
        topLbl.textColor=[UIColor magentaColor];
        bottomLbl.textColor=[UIColor magentaColor];
    }
    else  if (pressedButton.tag==4) {
        topLbl.textColor=[UIColor lightTextColor];
        bottomLbl.textColor=[UIColor lightTextColor];
    }

    else  if (pressedButton.tag==5) {
        topLbl.textColor=[UIColor blueColor];
        bottomLbl.textColor=[UIColor blueColor];
    }

    else  if (pressedButton.tag==6) {
        topLbl.textColor=[UIColor blackColor];
        bottomLbl.textColor=[UIColor blackColor];

       
    }

}

- (IBAction)fontColors:(id)sender
{
    if (viewColors.hidden) {
        viewColors.hidden=NO;
    }
    else
        viewColors.hidden=YES;

}
- (void)alertView:(UIAlertView *)message clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *title = [message buttonTitleAtIndex:buttonIndex];
	if([title isEqualToString:@"Upload"])
	{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];

    }
	else if([title isEqualToString:@"Take BG"])
	{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
	}
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    imageview.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
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


@end
