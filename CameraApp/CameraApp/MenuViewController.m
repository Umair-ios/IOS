//
//  MenuViewController.m
//  CameraApp
//
//  Created by iOS Dev on 10/29/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MenuViewController.h"
#import "APPViewController.h"
#import "LoLifyViewController.h"
#import "TypeViewController.h"
#import "CaptionViewController.h"
#import "RageComicsViewController.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

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
        self.navigationItem.title = @"InstaGaG";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)motivationalPosters:(id)sender
{
    
    APPViewController* motivational = [[APPViewController alloc] initWithNibName:@"APPViewController" bundle:nil];
    [self.navigationController pushViewController:motivational animated:YES ];
}

- (IBAction)lolify:(id)sender {
    LoLifyViewController* lolify = [[LoLifyViewController alloc] initWithNibName:@"LoLifyViewController" bundle:nil];
     [self.navigationController pushViewController:lolify animated:YES ];

}

- (IBAction)memes:(id)sender
{
    /*
    MemeViewController* Meme = [[MemeViewController alloc] initWithNibName:@"MemeViewController" bundle:nil];
    [self.navigationController pushViewController:Meme animated:YES ];
*/
}

- (IBAction)caption:(id)sender
{
    
    CaptionViewController* Menu = [[CaptionViewController alloc] initWithNibName:@"CaptionViewController" bundle:nil];
    [self.navigationController pushViewController:Menu animated:YES ];

}

- (IBAction)rageComics:(id)sender
{
    RageComicsViewController* Rage = [[RageComicsViewController alloc] initWithNibName:@"RageComicsViewController" bundle:nil];
    [self.navigationController pushViewController:Rage animated:YES ];

    
}

- (IBAction)type:(id)sender
{
    TypeViewController* type = [[TypeViewController alloc] initWithNibName:@"TypeViewController" bundle:nil];
    [self.navigationController pushViewController:type animated:YES ];
    
}

- (IBAction)mixPix:(id)sender
{
    
}

- (IBAction)fakeMessage:(id)sender
{
    
}

- (IBAction)photoBomb:(id)sender
{
    
}

- (IBAction)faceInHole:(id)sender
{
    
}

@end
