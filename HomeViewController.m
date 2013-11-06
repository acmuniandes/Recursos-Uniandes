//
//  HomeViewController.m
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/12/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

//Testing

//--------

@implementation HomeViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)instantiateMl:(id)sender
{
    DatosViewController *viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"DatosViewController"];
    
    viewController.resourcePath = @"mlTotal";
    
    [self.navigationController pushViewController:viewController animated:YES];
    
//    [self addChildViewController:viewController];
//    [self.view addSubviewWithZoomInAnimation:viewController.view duration:0.5 option:curveValues[selectedCurveIndex]];
//    [viewController didMoveToParentViewController:self];
}

-(IBAction)instantiateSD:(id)sender
{
    DatosViewController *viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"DatosViewController"];
    
    viewController.resourcePath = @"sdTotal";
    
//    [self addChildViewController:viewController];
//    [self.view addSubviewWithZoomInAnimation:viewController.view duration:0.5 option:curveValues[selectedCurveIndex]];
//    [viewController didMoveToParentViewController:self];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(IBAction)instantiateCPM:(id)sender
{
    DatosViewController *viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"DatosViewController"];
    
    viewController.resourcePath = @"cpmTotal";
    
//    [self addChildViewController:viewController];
//    [self.view addSubviewWithZoomInAnimation:viewController.view duration:0.5 option:curveValues[selectedCurveIndex]];
//    [viewController didMoveToParentViewController:self];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(IBAction)instantiateF:(id)sender
{
    DatosViewController *viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"DatosViewController"];
    
   viewController.resourcePath = @"fTotal";
    
//    [self presentViewController:viewController animated:YES completion:nil];

    
	// the animation will start in the middle of the button
	//[self.view addSubviewWithZoomInAnimation:viewController.view duration:1.0 option:curveValues[selectedCurveIndex]];
    
//    [self addChildViewController:viewController];
//    [self.view addSubviewWithZoomInAnimation:viewController.view duration:0.5 option:curveValues[selectedCurveIndex]];
//    [viewController didMoveToParentViewController:self];
    
    //[self.view addSubview:viewController.view];
    
    [self.navigationController pushViewController:viewController animated:YES];

    
}

@end
