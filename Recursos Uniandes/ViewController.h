//
//  ViewController.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/12/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "ResourceViewController.h"
#import "MicrosViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

-(IBAction)cargarTotal:(id)sender;


@end
