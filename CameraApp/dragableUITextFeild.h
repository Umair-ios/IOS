//
//  dragableUITextFeild.h
//  CameraApp
//
//  Created by iOS Dev on 12/2/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol draggableTextDelegate <NSObject>

@optional
-(void) currentTextClicked:(UITextField* )object;

@end
@interface dragableUITextFeild : UITextField

{
}



@property (nonatomic, assign) id<draggableTextDelegate,UITextFieldDelegate> delegate;

@end