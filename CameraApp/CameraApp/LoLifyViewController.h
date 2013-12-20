//
//  LoLifyViewController.h
//  CameraApp
//
//  Created by iOS Dev on 10/29/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoLifyViewController : UIViewController
 <UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    IBOutlet UIImageView *imageView;
    
     __weak IBOutlet UIScrollView *scrollar;
 
    __weak IBOutlet UILabel *topLbl;
      __weak IBOutlet UILabel *middleLbl;
    __weak IBOutlet UILabel *bottomLbl;
    __weak IBOutlet UITextField *topCaptionText;
    __weak IBOutlet UITextField *middleCaptionText;
    __weak IBOutlet UITextField *bottomCaptionText;
}
- (IBAction)align:(id)sender;

-(IBAction)saveImage:(id)sender;

-(IBAction)menu:(id)sender;
- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end


