//
//  APPViewController.h
//  CameraApp
//
//  Created by Rafael Garcia Leiva on 10/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssetsLibrary/AssetsLibrary.h"
@interface APPViewController : UIViewController <UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
IBOutlet UIImageView *imageView;

    __weak IBOutlet UIScrollView *scroller;
NSString *toptext;
NSString *bottomtext;
    
    __weak IBOutlet UILabel *topLbl;
    __weak IBOutlet UILabel *bottomLbl;
    __weak IBOutlet UITextField *topCaptionText;
    __weak IBOutlet UITextField *bottomCaptionText;
    __weak IBOutlet UIView *backgroundView;
}
-(IBAction)menu:(id)sender;

-(IBAction)saveImage:(id)sender;


- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end
