//
//  MicrosTableCell.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 11/3/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MicrosTableCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UIImageView *imagen;
@property (nonatomic,strong) IBOutlet UILabel *nombre;
@property (nonatomic,strong) IBOutlet UILabel *edificio;
@property (nonatomic,strong) IBOutlet UILabel *disponibilidad;

@end
