//
//  BTTheme.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 9/3/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "BTTheme.h" 
#import "BTDefaultTheme.h"

@implementation BTThemeManager

static id<BTTheme> _theme = nil;

+ (id<BTTheme>)sharedTheme
{
    return _theme;
}

+ (void)setSharedTheme:(id<BTTheme>)inTheme
{
    _theme = inTheme;
    [self applyTheme];
}

+ (void)applyTheme
{
    id<BTTheme> theme = [self sharedTheme];
    UINavigationBar* NavBarAppearence = [UINavigationBar appearance];
    [NavBarAppearence setBackgroundImage:[theme imageForNavigationBar] forBarMetrics:UIBarMetricsDefault];
    [NavBarAppearence setBackgroundImage:[theme imageForNavigationBarLandscape] forBarMetrics:UIBarMetricsLandscapePhone];
    //Test----------------------------------
    UIToolbar* BarAppearance = [UIToolbar appearance];
   // [NavBarAppearence setBackgroundImage:[theme imageForToolBar] forBarMetrics:UIBarMetricsDefault];
    [BarAppearance setBackgroundImage:[theme imageForToolBar] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    //------------------------------------------
    [NavBarAppearence setTitleTextAttributes:[theme navBarTextDictionary]];
}

+ (void)customizeView:(UIView *)view
{
    id <BTTheme> theme = [self sharedTheme];
    UIColor *backgroundColor = [theme backgroundColor];
    [view setBackgroundColor:backgroundColor];
}

- (UIColor*)backgroundColor
{
    return [UIColor whiteColor];
}

@end