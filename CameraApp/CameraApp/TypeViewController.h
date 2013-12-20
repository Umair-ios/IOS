//
//  TypeViewController.h
//  CameraApp
//
//  Created by iOS Dev on 10/31/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypeViewController : UIViewController<UIScrollViewDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate,UINavigationControllerDelegate>
{
    
    __weak IBOutlet UIImageView *imageview;
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UILabel *topLbl;
    __weak IBOutlet UILabel *bottomLbl;
    __weak IBOutlet UITextField *topCaptionText;
    __weak IBOutlet UITextField *bottomCaptionText;
    __weak IBOutlet UIView *viewColors;
    __weak IBOutlet UIToolbar *toolBar;

    int imageCount ;
    NSArray *images;
  
}
- (IBAction)Save:(id)sender;
- (IBAction)upload:(id)sender;
- (IBAction)Colors:(id)sender;
- (IBAction)fontColors:(id)sender;

@end
