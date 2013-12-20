//
//  MemeViewController.m
//  CameraApp
//
//  Created by iOS Dev on 10/30/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MemeViewController.h"

@interface MemeViewController ()

@end

@implementation MemeViewController

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

       UIBarButtonItem *myAddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(myAddAction)];
    
    UIBarButtonItem *myCoolButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(myCoolAction)];
    UIBarButtonItem *myCoolButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(myCoolAction1)];
    UIBarButtonItem *myCoolButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(myCoolAction2)];
    UIBarButtonItem *myCoolButton3 = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:self action:@selector(myCoolAction3)];
    


    
    NSArray *myButtonArray = [[NSArray alloc] initWithObjects:myCoolButton3,myCoolButton3,myCoolButton3,myCoolButton2,myCoolButton1,myCoolButton, myAddButton, nil];
    
    self.navigationItem.rightBarButtonItems = myButtonArray;
      scrollar.contentSize = CGSizeMake(320 , 570);
}


- (void)myCoolAction
{
    second.hidden=YES;
    third.hidden=YES;
    forth.hidden=NO;

    
}
- (void)myCoolAction1
{
    second.hidden=YES;
    third.hidden=NO;
    forth.hidden=YES;

    
}
- (void)myCoolAction2

{
    second.hidden=NO;
    third.hidden=YES;
    forth.hidden=YES;
    
}
- (void)myCoolAction3

{
    
}
- (void)myAddAction
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
