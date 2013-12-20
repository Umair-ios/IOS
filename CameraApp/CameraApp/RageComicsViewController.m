//
//  RageComicsViewController.m
//  CameraApp
//
//  Created by iOS Dev on 10/31/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RageComicsViewController.h"
#import "MenuViewController.h"
#import "panalViewController.h"
#import "facesViewController.h"
#import "shapesViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
#import "dragableUITextFeild.h"
#import "appstatesave.h"


@interface RageComicsViewController ()

@end
int count=0;
appstatesave *state ;
 PanalView *currentPanel;

int panalNumber=0;
@implementation RageComicsViewController
@synthesize panal;
@synthesize shape;
@synthesize face;
@synthesize opacityControll;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;

}
- (void)viewDidLoad
{
    state = [appstatesave getappstate];
    currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];
    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"Custom Action"
                                                      action:@selector(customAction:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:menuItem]];

    [super viewDidLoad];
    images=[[NSMutableArray alloc]init];
    count=0;
    panalcount=[[NSMutableArray alloc]init];
    [scrollView setContentSize:CGSizeMake(63,500)];
    [scrollView setContentOffset:CGPointMake(0,-50) animated:YES];
    [scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    opacityControll.hidden=YES;
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    UIBarButtonItem *Panal = [[UIBarButtonItem alloc] initWithTitle:@"Panal" style:UIButtonTypeRoundedRect target:self action:@selector(addPanal:)];
    UIBarButtonItem *Faces = [[UIBarButtonItem alloc] initWithTitle:@"Face" style:UIButtonTypeRoundedRect target:self action:@selector(addFaces:)];
    UIBarButtonItem *Text = [[UIBarButtonItem alloc] initWithTitle:@"Text" style:UIButtonTypeRoundedRect target:self action:@selector(addText)];
    UIBarButtonItem *Shapes = [[UIBarButtonItem alloc] initWithTitle:@"Shape" style:UIButtonTypeRoundedRect target:self action:@selector(addShapes:)];
    UIBarButtonItem *save= [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIButtonTypeRoundedRect target:self action:@selector(saveDrawing:)];
    UIBarButtonItem *image= [[UIBarButtonItem alloc] initWithTitle:@"Image" style:UIButtonTypeRoundedRect target:self action:@selector(addImages:)];
    NSArray *myButtonArray = [[NSArray alloc] initWithObjects:save,image,Shapes,Text,Faces, Panal, nil];
    self.navigationItem.rightBarButtonItems = myButtonArray;
}
#pragma mark - UIMenuController required methods
- (BOOL)canBecomeFirstResponder {
    // NOTE: The menu item will on iOS 6.0 without YES (May be optional on iOS 7.0)
    return YES;
}
/*
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
   // NSLog(@"canPerformAction");
    // The selector(s) should match your UIMenuItem selector
    if (action == @selector(customAction:)) {
        return YES;
    }
    return NO;
}
*/
#pragma mark - Custom Action(s)
- (void)customAction:(id)sender {
    NSLog(@"custom action! %@", sender);
}
#pragma mark - PresentViews
-(void)addPanal:(id)sender
{
    panalViewController* Menu = [[panalViewController alloc] initWithNibName:@"panalViewController" bundle:nil];
    Menu.rageClassObject = self;
    [self.navigationController presentViewController:Menu animated:YES completion:nil];
}
-(void)addFaces:(id)sender
{
    facesViewController* Faces = [[facesViewController alloc] initWithNibName:@"facesViewController" bundle:nil];
    Faces.rageClassObject = self;
    [self.navigationController presentViewController:Faces animated:YES completion:nil];
}
-(void)addShapes:(id)sender
{
    [self finalImage];

    shapesViewController* Shapes = [[shapesViewController alloc] initWithNibName:@"shapesViewController" bundle:nil];
    Shapes.rageClassObject = self;
    [self.navigationController presentViewController:Shapes animated:YES completion:nil];
}

-(void)addImages:(id)sender
{
    opacityControll.hidden=YES;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    }
#pragma mark - DelegateMethods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    opacityControll.hidden=YES;
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    pictureImageView=[[dragable alloc]initWithFrame:CGRectMake(self.view.center.x,self.view.center.y, 100, 100)];
    pictureImageView.delegate=self;
    pictureImageView.image = chosenImage;
    [pictureImageView setUserInteractionEnabled:YES];

    currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];

    [currentPanel addSubview:pictureImageView];


    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    opacityControll.hidden=YES;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)alertView:(UIAlertView *)message clickedButtonAtIndex:(NSInteger)buttonIndex
{
    opacityControll.hidden=YES;
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

-(void) currentTextClicked:(UITextField* )object
{
    currentLongPressed = (dragableUITextFeild*)object;
    opacityControll.hidden=NO;
    opacityControll.frame=CGRectMake(currentLongPressed.frame.origin.x, currentLongPressed.frame.origin.y+currentLongPressed.frame.size.height+4, opacityControll.frame.size.width, opacityControll.frame.size.height);
    
}

-(void)currentObjectClicked:(UIImageView *)object{
    currentLongPressed = (dragable*)object;
    opacityControll.hidden=NO;
    opacityControll.frame=CGRectMake(currentLongPressed.frame.origin.x, currentLongPressed.frame.origin.y+currentLongPressed.frame.size.height*3, opacityControll.frame.size.width, opacityControll.frame.size.height);
}
#pragma mark - Adding objects to panal
-(void)addText
{
    opacityControll.hidden=YES;
    textField = [[dragableUITextFeild alloc] initWithFrame:CGRectMake(self.view.center.x-75,self.view.center.y-20, 150, 40)];
    textField.delegate=self;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"enter text";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];
    UIPanGestureRecognizer *gesturetext = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(textDragged:)] ;
    [textField addGestureRecognizer:gesturetext];
    [currentPanel addSubview:textField];
}

-(void)addingshapes
{
    opacityControll.hidden=YES;
    [self drawRect];
}

-(void)addingFaces
{
    opacityControll.hidden=YES;
    NSLog(@"Face value is %d", face);
    if (face==0)
    {
        faceImgView = [[dragable alloc] initWithFrame:CGRectMake(self.view.center.x,self.view.center.y,70,70)];
        faceImgView.image =[UIImage imageNamed:@"Default.png"];
        faceImgView.delegate = self;
        [faceImgView setUserInteractionEnabled:YES];
        currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];
        [currentPanel addSubview:faceImgView];
        state.Panel = currentPanel;
    }
    else if (face==1)
    {
        faceImgView = [[dragable alloc] initWithFrame:CGRectMake(self.view.center.x,self.view.center.y,70,70)];
        faceImgView.image =[UIImage imageNamed:@"Default.png"];
        faceImgView.delegate = self;
        [faceImgView setUserInteractionEnabled:YES];
        currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];
        [currentPanel addSubview:faceImgView];
        state.Panel = currentPanel;
    }
    
}


-(void)addingPanal
{
    
    opacityControll.hidden=YES;
    if (panal==0)
    {
        panalViewobj=[[PanalView alloc]initWithFrame:CGRectMake(70, 88, 245, 372)];
        panalViewobj.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:panalViewobj];
        [panalcount insertObject:panalViewobj atIndex:count];
        UIImage * avatar=[UIImage imageNamed:@"white.jpg"];
        [images addObject:avatar];
        state.Panel = panalViewobj;
        panalNumber=count;
        count++;
        [self.view bringSubviewToFront:opacityControll];
        [self panalAavatar];
        NSLog(@"this is the current panal %d ", panalNumber);
        
        
    }
    else if (panal==1)
    {
        panalViewobj=[[PanalView alloc]init];
        panalViewobj.backgroundColor=[UIColor whiteColor];
        panalViewobj.frame=CGRectMake(panalViewobj.frame.origin.x,panalViewobj.frame.origin.y,panalViewobj.frame.size.width,panalViewobj.frame.size.height-200);
        state.Panel = panalViewobj;
        [panalcount insertObject:panalViewobj atIndex:count];
        count++;
        [self panalAavatar];
        NSLog(@"this is the current panal %d ", panalNumber);
        
    }
}
- (void)finalImage
{
    UIView *finalimage=[[UIView alloc]initWithFrame:CGRectMake(0, 0,panalViewobj.frame.size.width , panalViewobj.frame.size.height*count)];
    for (int i = 0; i < images.count; i++)
    {
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[images objectAtIndex:i];
        CGRect frame;
        frame.size.height = panalViewobj.frame.size.height;
        frame.size.width = panalViewobj.frame.size.width;
        
        frame.origin.x = 0;
        frame.origin.y = panalViewobj.frame.size.height*i;
        img.frame=frame;
        [finalimage addSubview:img];

                }
    UIGraphicsBeginImageContext(finalimage.frame.size);
    [[finalimage layer] renderInContext:UIGraphicsGetCurrentContext()];
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
    

    finalimage.hidden=YES;
}
#pragma mark - Misc
- (void)panalAavatar
{
    
    
    for (int i = 0; i < images.count; i++)
    {
        CGRect frame;
        frame.size.height = 50;
        frame.size.width = 50;
        
        frame.origin.x = 6;
        frame.origin.y = 4+scrollView.frame.size.height/6 * i;
        
        UIButton *subview = [[UIButton alloc] initWithFrame:frame];
        subview.tag=i;
        [subview addTarget:self action:@selector(avatarButtonAction:) forControlEvents:UIControlEventTouchDown];
        [subview setBackgroundImage:[images objectAtIndex:i] forState:normal];
        [scrollView addSubview:subview];
        
    }
    
}
-(void)avatarButtonAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSInteger buttonTag = button.tag;
    panalNumber=buttonTag;
    panalViewobj=[panalcount objectAtIndex:buttonTag];
    state.Panel = panalViewobj;
    
    [self.view addSubview:panalViewobj];
    NSLog(@"this is the current panal %d ", panalNumber);
}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    //  CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    opacityControll.hidden=YES;
    
}
- (IBAction)opacity:(id)sender {
    UIButton *instanceButton = (UIButton*)sender;
    currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];
    if (instanceButton.tag==0) {
        [currentPanel bringSubviewToFront:currentLongPressed];
    }
    else
        [currentPanel sendSubviewToBack: currentLongPressed];
}

-(void)saveDrawing:(id)sender
{
    
    opacityControll.hidden=YES;
    currentPanel = (PanalView*)[panalcount objectAtIndex:panalNumber];
      UIGraphicsBeginImageContext(currentPanel.frame.size);
    [[currentPanel layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  /*
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
   */
    
    [images replaceObjectAtIndex:panalNumber withObject:image];
    [panalcount replaceObjectAtIndex:panalNumber withObject: currentPanel];
    state.Panel = panalViewobj;

    [self panalAavatar];

}

-(void)drawRect
{
    opacityControll.hidden=YES;
    int aSize = 100.0;
    float color[4] = { 0.0, 0.0, 1.0, 1.0 }; // Blue
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = 100.0;
    CGFloat yCenter = 100.0;
    
    float  w = 100.0;
    double r = w / 2.0;
    float flip = -1.0;
    
    for (NSUInteger i=0; i<1; i++)
    {
        CGContextSetFillColorWithColor(context, aColor);
        CGContextSetStrokeColorWithColor(context, aColor);
        
        double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
        
        CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
        
        for (NSUInteger k=1; k<5; k++)
        {
            float x = r * sin(k * theta);
            float y = r * cos(k * theta);
            CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
        }
        xCenter += 150.0;
    }
    CGContextClosePath(context);
    CGContextFillPath(context);
}
#pragma mark - Draging text
- (void)labelDragged:(UIPanGestureRecognizer *)gesture
{
    opacityControll.hidden=YES;
    UILabel *label = (UILabel *)gesture.view;
	CGPoint translation = [gesture translationInView:label];
    
	// move label
	label.center = CGPointMake(label.center.x + translation.x,
                               label.center.y + translation.y);
    
	// reset translation
	[gesture setTranslation:CGPointZero inView:label];
}

- (void)textDragged:(UIPanGestureRecognizer *)gesture
{
    opacityControll.hidden=YES;
    UITextField *label = (UITextField *)gesture.view;
	CGPoint translation = [gesture translationInView:label];
	// move label
	label.center = CGPointMake(label.center.x + translation.x,label.center.y + translation.y);
	// reset translation
	[gesture setTranslation:CGPointZero inView:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
