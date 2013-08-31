//
//  APPViewController.m
//  CrystallBall
//
//  Created by Lea Marolt on 8/25/13.
//  Copyright (c) 2013 hellosunschein.com. All rights reserved.
//

#import "APPViewController.h"

@interface APPViewController ()

@end

@implementation APPViewController
@synthesize predictionLabel;
@synthesize predictionArray;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"background.png"];
    imageView = [[UIImageView alloc] initWithImage:(image)];
    [self.view insertSubview:(imageView) atIndex:0];
    
    self.predictionArray = [[NSArray alloc] initWithObjects:@"It is certain", @"It is decidedly so",
       @"Yes", @"No", @"Maybe", @"BOOYA!", @"This will never happen.",
       @"I believe in a thing called love", @"My heart will go on!", nil];
    
    self.imageView.animationImages = [[NSArray alloc] initWithObjects:
                                      [UIImage imageNamed:@"cball00001"],
                                      [UIImage imageNamed:@"cball00002"],
                                      [UIImage imageNamed:@"cball00003"],
                                      [UIImage imageNamed:@"cball00004"],
                                      [UIImage imageNamed:@"cball00005"],
                                      [UIImage imageNamed:@"cball00006"],
                                      [UIImage imageNamed:@"cball00007"],
                                      [UIImage imageNamed:@"cball00008"],
                                      [UIImage imageNamed:@"cball00009"],
                                      [UIImage imageNamed:@"cball00010"],
                                      [UIImage imageNamed:@"cball00011"],
                                      [UIImage imageNamed:@"cball00012"],
                                      [UIImage imageNamed:@"cball00013"],
                                      [UIImage imageNamed:@"cball00014"],
                                      [UIImage imageNamed:@"cball00015"],
                                      [UIImage imageNamed:@"cball00016"],
                                      [UIImage imageNamed:@"cball00017"],
                                      [UIImage imageNamed:@"cball00018"],
                                      [UIImage imageNamed:@"cball00019"],
                                      [UIImage imageNamed:@"cball00020"],
                                      [UIImage imageNamed:@"cball00021"],
                                      [UIImage imageNamed:@"cball00022"],
                                      [UIImage imageNamed:@"cball00023"],
                                      [UIImage imageNamed:@"cball00024"],
                                      nil];
    
    self.imageView.animationDuration = 1.0;
    self.imageView.animationRepeatCount = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* button method
- (IBAction)buttonPressed:(UIButton *)sender {
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
} */

- (void) makePrediction {
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
    [self.imageView startAnimating];
    
    [UIView animateWithDuration:2.0 animations:^ {
        self.predictionLabel.alpha = 1.0;
    }];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion canceled");
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}
@end
