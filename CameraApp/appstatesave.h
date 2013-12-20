//
//  appstatesave.h
//  CameraApp
//
//  Created by iOS Dev on 12/17/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanalView.h"

@protocol draggableDelegate <NSObject>

@optional
-(void) currentObjectClicked:(UIImageView* )object;

@end

@interface appstatesave : NSObject<UIGestureRecognizerDelegate>
{


    CGPoint startLocation;
    CGFloat _lastScale;
	CGFloat _lastRotation;
	CGFloat _firstX;
	CGFloat _firstY;
}
@property (nonatomic, assign) id<draggableDelegate> delegate;
@property (atomic,retain ) CAShapeLayer *marque;
@property (atomic,assign ) CGPoint startLocation;
@property (atomic,assign ) CGFloat _lastScale;
@property (atomic,assign ) CGFloat _lastRotation;
@property (atomic,assign ) CGFloat _firstX;
@property (atomic,assign ) CGFloat _firstY;



+(appstatesave *)getappstate;
@property(nonatomic,retain) UIImageView *copyimage;
@property(nonatomic,retain) PanalView *Panel;
@end
