//
//  DetailViewController.h
//  HockeyScores
//
//  Created by Jason Leyrer on 11/12/13.
//  Copyright (c) 2013 Jason Leyrer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
