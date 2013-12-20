//
//  PanalView.m
//  CameraApp
//
//  Created by iOS Dev on 11/26/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PanalView.h"
#import "appstatesave.h"
@implementation PanalView
{
    appstatesave *state;
}
- (id)initWithFrame:(CGRect)frame
{
    
    
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];

    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
            }
    return self;
}
- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {

        [self becomeFirstResponder];

        UIMenuController *sharedController = [UIMenuController sharedMenuController];

        [sharedController setTargetRect:self.frame inView:self.superview];

        [sharedController setMenuVisible:YES animated:YES];

        [sharedController setMenuItems:nil];
  	}
}
-(void)paste:(id)sender
{
    state=[appstatesave getappstate];
    dragable *pastedObject = (dragable*)state.copyimage;
    [pastedObject attachGestures];
    [pastedObject setUserInteractionEnabled:YES];
    [state.Panel addSubview:pastedObject];
    
}
-(BOOL)canBecomeFirstResponder
{
	//simply return YES
	return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    if (action == @selector(paste:))
    {
        return [super canPerformAction:action withSender:sender];
    }
    
    
    
    return NO;
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
