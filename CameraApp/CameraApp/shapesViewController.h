//
//  shapesViewController.h
//  CameraApp
//
//  Created by iOS Dev on 11/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RageComicsViewController.h"

@interface shapesViewController : UIViewController
{

}
@property (nonatomic,strong) RageComicsViewController *rageClassObject;

- (IBAction)shapeStyles:(id)sender;
- (IBAction)cancle:(id)sender;

@end
