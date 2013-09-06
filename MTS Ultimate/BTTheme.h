//
//  BTTheme.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 9/3/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BTTheme

- (UIColor*)backgroundColor;

//For the navigation bar
- (UIImage*)imageForNavigationBar;
- (UIImage*)imageForNavigationBarLandscape;
- (NSDictionary*)navBarTextDictionary;

//Test
- (UIImage*) imageForToolBar;

@end

@interface BTThemeManager : NSObject

+ (id<BTTheme>)sharedTheme;
+ (void)setSharedTheme:(id<BTTheme>)inTheme;
+ (void)applyTheme;
+ (void)customizeView:(UIView *)view;

@end
