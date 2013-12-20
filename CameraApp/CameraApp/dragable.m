//
//  dragable.m
//  CameraApp
//
//  Created by iOS Dev on 11/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "dragable.h"
#import <QuartzCore/QuartzCore.h>
#import "appstatesave.h"


@implementation dragable
{
    appstatesave *state;
}
@synthesize delegate,_firstX,_firstY,_lastRotation,_lastScale,startLocation;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        if (!_marque) {
            _marque = [CAShapeLayer layer];
            _marque.fillColor = [[UIColor clearColor] CGColor];
            _marque.strokeColor = [[UIColor grayColor] CGColor];
            _marque.lineWidth = 1.0f;
            _marque.lineJoin = kCALineJoinRound;
            _marque.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5], nil];
            _marque.bounds = CGRectMake(self.frame.origin.x, self.frame.origin.y, 0, 0);
            _marque.position = CGPointMake(self.frame.origin.x + self.frame.origin.x, self.frame.origin.y + self.frame.origin.y);
        }
        [[self layer] addSublayer:_marque];
        
        [self attachGestures];
   
      
    }
       return self;
}

-(void)attachGestures{
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
    [pinchRecognizer setDelegate:self];
    [self addGestureRecognizer:pinchRecognizer];
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)] ;
    [rotationRecognizer setDelegate:self];
    [self addGestureRecognizer:rotationRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)] ;
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    [self addGestureRecognizer:panRecognizer];
    
    UITapGestureRecognizer *tapProfileImageRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)] ;
    [tapProfileImageRecognizer setNumberOfTapsRequired:1];
    [tapProfileImageRecognizer setDelegate:self];
    [self addGestureRecognizer:tapProfileImageRecognizer];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
}

- (void) aRequiredDelegateFunction
{

    
}

#pragma mark Frame Boundry

-(void)showOverlayWithFrame:(CGRect)frame {
    
    if (![_marque actionForKey:@"linePhase"]) {
        CABasicAnimation *dashAnimation;
        dashAnimation = [CABasicAnimation animationWithKeyPath:@"lineDashPhase"];
        [dashAnimation setFromValue:[NSNumber numberWithFloat:0.0f]];
        [dashAnimation setToValue:[NSNumber numberWithFloat:15.0f]];
        [dashAnimation setDuration:0.5f];
        [dashAnimation setRepeatCount:HUGE_VALF];
        [_marque addAnimation:dashAnimation forKey:@"linePhase"];
    }
    _marque.frame=CGRectMake(self.frame.origin.x+1, self.frame.origin.y-1, self.frame.size.width+1, self.frame.size.height+1);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, frame);
    [_marque setPath:path];
    CGPathRelease(path);
    _marque.hidden = YES;
    
}
#pragma mark Manipulation

-(void)scale:(id)sender {
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    CGAffineTransform currentTransform = self.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    [self setTransform:newTransform];
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    [self showOverlayWithFrame:self.frame];
}


-(void)rotate:(id)sender {
    
    if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        _lastRotation = 0.0;
        return;
    }
    CGFloat rotation = 0.0 - (_lastRotation - [(UIRotationGestureRecognizer*)sender rotation]);
    CGAffineTransform currentTransform = self.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    [self setTransform:newTransform];
     _lastRotation = [(UIRotationGestureRecognizer*)sender rotation];
    [self showOverlayWithFrame:self.frame];
}
-(void)move:(id)sender {
   
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:[self superview]];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _firstX = [self center].x;
        _firstY = [self center].y;
    }
    translatedPoint = CGPointMake(_firstX+translatedPoint.x, _firstY+translatedPoint.y);
    
    [self setCenter:translatedPoint];
    [self showOverlayWithFrame:self.frame];
}
- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        [self.delegate currentObjectClicked:self];
        [self becomeFirstResponder];
        UIMenuController *sharedController = [UIMenuController sharedMenuController];
        [sharedController setTargetRect:self.frame inView:self.superview];
        [sharedController setMenuVisible:YES animated:YES];
        [sharedController setMenuItems:nil];
	}
}
- (id)copyWithZone:(NSZone *)zone {
 
    dragable *obj =[[[self class]allocWithZone:zone ] init];
    if (obj) {
        obj->startLocation=startLocation;
        obj->_firstX=_firstX;
        obj->_firstY=_firstY;
        obj->_lastRotation=_lastRotation;
        obj->_lastScale=_lastScale;
        obj.center=self.center;
        obj.frame=self.frame;
        obj.bounds=self.bounds;
        obj.backgroundColor = self.backgroundColor;
        obj.image=self.image;
        obj.transform = self.transform;
        obj.delegate=self.delegate;
    }
    return obj;
}
- (void)copy:(id)sender
{
    dragable *object2=[self copy];
    state = [appstatesave getappstate];
    state.copyimage = object2;
}
- (void)cut:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setImage:self.image];
    
}
- (void)delete:(id)sender
{

}
- (void)paste:(id)sender
{
    
}
-(BOOL)canBecomeFirstResponder
{
	return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    if (action == @selector(paste:) ||action == @selector(copy:)||action == @selector(delete:)||action == @selector(cut:))
    {
        return [super canPerformAction:action withSender:sender];
    }
    return NO;
}

-(void)tapped:(id)sender {
    _marque.hidden = YES;
}

#pragma mark UIGestureRegognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return ![gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && ![gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]];
}


@end
