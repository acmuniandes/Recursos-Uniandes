//
//  BTForestTheme.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 9/3/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "BTForestTheme.h"
#import "BTTheme.h" 
#import "BTDefaultTheme.h" 

//Constants are not declared in the class extension? Interesting...

    NSString *const imagen1 = @"surf_gradient_textured_44 copy.png";
    NSString *const imagen2 = @"g1.png";
    NSString *const imagen3 = @"g2.png";
    NSString *const fondo = @"fondo.jpg";


@implementation BTForestTheme

- (UIColor*)backgroundColor
{
    //For using an image as a background patterned-color
    return [UIColor colorWithPatternImage:
            [UIImage imageNamed:fondo]];
    
}

//Navigation below

//The image for this theme of the navigation bar in portrait
- (UIImage*)imageForNavigationBar
{
    return [[UIImage imageNamed:imagen3]
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
    return [[UIImage imageNamed:imagen3]
            resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 100.0, 0.0, 100.0)];
}

//Test for the cell background color, may use the trick
- (UIColor*)colorForTableBackground
{
    return [UIColor colorWithPatternImage:[UIImage imageNamed:fondo]];
}

//This dictorionary sets the font, color and size
- (NSDictionary*)navBarTextDictionary
{ return @{

                                                 UITextAttributeFont:[UIFont fontWithName:@"Helvetica" size:20.0], UITextAttributeTextColor:
                                                     [UIColor colorWithRed:0.910 green:0.914 blue:0.824
                                                                     alpha:1.000], UITextAttributeTextShadowColor:
                                                     [UIColor colorWithRed:0.224 green:0.173 blue:0.114
                                                                     alpha:1.000], UITextAttributeTextShadowOffset:
                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, -1)]
         };
}

@end
