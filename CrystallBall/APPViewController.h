//
//  APPViewController.h
//  CrystallBall
//
//  Created by Lea Marolt on 8/25/13.
//  Copyright (c) 2013 hellosunschein.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) NSArray *predictionArray;
@property (strong, nonatomic) UIImageView *imageView;
/*- (IBAction)buttonPressed:(UIButton *)sender;*/
- (void) makePrediction;

@end
