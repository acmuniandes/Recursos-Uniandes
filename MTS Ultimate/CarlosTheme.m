//
//  CarlosTheme.m
//  MTS Ultimate
//
//  Created by Carlos Andres on 9/17/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "CarlosTheme.h"

@implementation CarlosTheme


- (UIColor*)backgroundColor
{
    //For using an image as a background patterned-color
    /*
    return [UIColor colorWithPatternImage:
            [UIImage imageNamed:@"nombre de la imagen"]];
     */
    
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"gimansio.png"]];
    
}

//Navigation below

//The image for this theme of the navigation bar in portrait
- (UIImage*)imageForNavigationBar
{
    return [[UIImage imageNamed:@"imagen aqui"]
            resizableImageWithCapInsets:UIEdgeInsetsMake( 0.0, 100.0, 0.0, 100.0)];
}

//Landscape
- (UIImage*)imageForNavigationBarLandscape
{
    return [[UIImage imageNamed:@"surf_gradient_textured_32 copy.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(
                                                         0.0, 100.0, 0.0, 100.0)];
}

//Test for the tool bar 
- (UIImage*) imageForToolBar
{
    return [[UIImage imageNamed:@"imagen aqui"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 100.0, 0.0, 100.0)];
}

//Test for the table background color, may use the trick for image
- (UIColor*)colorForTableBackground
{
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"imagen aqui"]];
}

//This dictorionary sets the font, color and size
- (NSDictionary*)navBarTextDictionary
{ return @{
           
           UITextAttributeFont:[UIFont fontWithName:@"Arial" size:20.0], UITextAttributeTextColor:
               [UIColor colorWithRed:0.910 green:0.914 blue:0.824
                               alpha:1.000], UITextAttributeTextShadowColor:
               [UIColor colorWithRed:0.224 green:0.173 blue:0.114
                               alpha:1.000], UITextAttributeTextShadowOffset:
               [NSValue valueWithUIOffset:UIOffsetMake(0, -1)]
           };
}

@end

