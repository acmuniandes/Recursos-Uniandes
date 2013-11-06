//
//  HomeViewController.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/12/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatosViewController.h"

@interface HomeViewController : UIViewController

@property (assign, nonatomic) NSInteger *index;

-(IBAction)instantiateMl:(id)sender;
-(IBAction)instantiateSD:(id)sender;
-(IBAction)instantiateCPM:(id)sender;
-(IBAction)instantiateF:(id)sender;

//Testing

@end
