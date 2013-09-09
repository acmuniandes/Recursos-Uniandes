//
//  DetailHomeControllerViewController.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/30/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sala.h"
#import "Recurso.h"

@interface DetailHomeControllerViewController : UITableViewController

@property (strong, nonatomic) id detailItem;
@property (nonatomic, strong) Recurso *recurso;
@property (nonatomic, strong) NSArray *salas;

- (void)asignarRecurso: (Recurso *)rec;
- (id)initWithStyle:(UITableViewStyle)style;
- (void)setDetailItem:(id)newDetailItem;

@end
