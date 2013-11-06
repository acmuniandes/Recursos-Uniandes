//
//  DatosViewController.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/16/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sala.h"
#import "Reachability.h"

@interface DatosViewController : UITableViewController

@property (nonatomic, strong) NSString *resourcePath;
@property (nonatomic, strong) NSString *extensionPath;

//TODO erase
@property (assign, nonatomic) NSInteger *index;

@end
