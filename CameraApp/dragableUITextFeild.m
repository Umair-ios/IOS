//
//  dragableUITextFeild.m
//  CameraApp
//
//  Created by iOS Dev on 12/2/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "dragableUITextFeild.h" 

@implementation dragableUITextFeild

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
  
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longPress];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        [self.delegate currentTextClicked:self];
        
    }
}
@end
