//
//  TableHeader.m
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/28/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "TableHeader.h"

@implementation TableHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

-(IBAction)goBack:(id)sender
{
   // [self removeFromSuperview];
    NSLog(@"BACK");
}

- (void) buttonTouchDownRepeat:(id)sender event:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if(touch.tapCount == 2)
    {
        NSLog(@"Twice");
    }
    else
    {
        NSLog(@"otherwise");
    }
    
}



@end
