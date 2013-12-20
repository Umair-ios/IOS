//
//  appstatesave.m
//  CameraApp
//
//  Created by iOS Dev on 12/17/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "appstatesave.h"

@implementation appstatesave
@synthesize copyimage,Panel,_firstX,_firstY,_lastRotation,_lastScale,delegate,marque,startLocation;

  appstatesave *returnstate=nil;

int counting=0;
-(id)init {
    if ( self = [super init] ) {
   
       

    }
    return self;
}

- (void)dealloc {
    
    
}

+(id)getappstate


{
    if (returnstate==Nil) {
        returnstate = [[super allocWithZone:NULL]init];
        return returnstate;
    }
  
   //    returnstate.sss = @"def";
    //    returnstate.copyimage = [[UIImageView alloc]init];
        //returnstate.currentPanel = [[PanalView alloc]init];
   
  
    return returnstate;
}



@end
