//
//  SimpleTableCell.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/30/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell

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
