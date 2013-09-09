//
//  HomeController.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/29/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Recurso.h"
#import "Sala.h"

//Forward declaration classes here
@class SimpleTableCell;
@class DetailHomeControllerViewController;

@interface HomeController : UITableViewController
{
    BOOL *primeraVez;
}

//Properties
@property (nonatomic, strong)NSArray *recursos;

@property (strong, nonatomic) DetailHomeControllerViewController *detailViewController;
@property (strong, nonatomic) UIButton *boton1;

//Actions
-(IBAction)notificarMe:(id)sender;

//Outlets

@end
