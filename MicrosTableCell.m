//
//  MicrosTableCell.m
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 11/3/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "MicrosTableCell.h"

@implementation MicrosTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
