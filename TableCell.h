//
//  TableCell.h
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/16/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nombre;
@property (nonatomic, strong) IBOutlet UILabel *tiempo;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
