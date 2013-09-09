//
//  DetailViewController.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/29/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
