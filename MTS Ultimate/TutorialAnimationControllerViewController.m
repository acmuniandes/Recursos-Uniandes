//
//  TutorialAnimationControllerViewController.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 9/6/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "TutorialAnimationControllerViewController.h"

@interface TutorialAnimationControllerViewController ()

@end

@implementation TutorialAnimationControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 
    [self.navigationController.toolbar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
         
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
