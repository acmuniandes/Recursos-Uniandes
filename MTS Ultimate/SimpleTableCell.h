//
//  SimpleTableCell.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/30/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
{
    
}

//Outlets

@property (nonatomic, weak)IBOutlet UILabel *nombre;
@property (nonatomic, weak)IBOutlet UILabel *capacidad;
@property (nonatomic, weak)IBOutlet UIImageView *imagenRecurso;

@end
