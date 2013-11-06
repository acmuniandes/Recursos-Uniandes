//
//  ResourceViewController.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/16/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatosViewController.h"

@interface ResourceViewController : UIViewController

@property (assign, nonatomic) NSInteger *index;

-(IBAction)goLeft:(id)sender;
-(IBAction)goRight:(id)sender;

@end
