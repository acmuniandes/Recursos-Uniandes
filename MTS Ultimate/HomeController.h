//
//  HomeController.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/29/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recurso.h"
#import "Sala.h"

@class SimpleTableCell;
@class DetailHomeControllerViewController;

@interface HomeController : UITableViewController
{
    
}

@property (nonatomic, strong)NSArray *recursos;

@property (strong, nonatomic) DetailHomeControllerViewController *detailViewController;
@property (strong, nonatomic) UIButton *boton1;

-(IBAction)notificarMe:(id)sender;

@end
