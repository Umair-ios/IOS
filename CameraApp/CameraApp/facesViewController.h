//
//  facesViewController.h
//  CameraApp
//
//  Created by iOS Dev on 11/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RageComicsViewController.h"

@interface facesViewController : UIViewController{}
@property (nonatomic,strong) RageComicsViewController *rageClassObject;


- (IBAction)faceStyles:(id)sender;
- (IBAction)cencle:(id)sender;

@end
