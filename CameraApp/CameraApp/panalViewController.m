//
//  panalViewController.m
//  CameraApp
//
//  Created by iOS Dev on 11/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "panalViewController.h"

@interface panalViewController ()

@end

@implementation panalViewController
@synthesize rageClassObject;
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

    }
-(void)mycancleButton:(id)sender
{

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)panalStyles:(id)sender {
    UIButton *instanceButton = (UIButton*)sender;
    rageClassObject.panal=instanceButton.tag; 
    [rageClassObject addingPanal];

   
}

- (IBAction)cencle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];

}
@end
