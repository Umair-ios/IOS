//
//  RageComicsViewController.h
//  CameraApp
//
//  Created by iOS Dev on 10/31/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PanalView.h"
#import "dragable.h"
#import "dragableUITextFeild.h"


@interface RageComicsViewController:UIViewController<UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIGestureRecognizerDelegate, draggableDelegate,draggableTextDelegate>

{
    UITextField *textField;
    dragable *faceImgView;
    dragable * pictureImageView;
    NSMutableArray *images;
    NSMutableArray *panalcount;
    UIView *currentLongPressed;
    UIView *opacityControll;
    __weak IBOutlet UIScrollView *scrollView;
    PanalView *panalViewobj;
}
- (IBAction)opacity:(id)sender;


-(void)addingPanal;
-(void)addingFaces;
-(void)addingshapes;
// @property (nonatomic, retain) IBOutlet PanalView *panalView;

@property IBOutlet UIView *opacityControll;
@property int panal;
@property int shape;
@property int face;

@end
