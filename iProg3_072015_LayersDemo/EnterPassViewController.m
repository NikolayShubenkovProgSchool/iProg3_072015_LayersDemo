//
//  EnterPassViewController.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "EnterPassViewController.h"

#import <pop/Pop.h>

@interface EnterPassViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelToTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonCenterConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldConstraint;

@end

@implementation EnterPassViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.labelToTopConstraint.constant = -40;
    self.buttonCenterConstraint.constant = CGRectGetWidth(self.view.frame);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.labelToTopConstraint.constant = 40;
        
    
    [UIView animateWithDuration:0.25
                          delay:0.25
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         POPSpringAnimation *buttonAppear = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
                         buttonAppear.toValue = @(0);
                         buttonAppear.springSpeed = 15;
                         buttonAppear.springBounciness = 10;
                         [self.buttonCenterConstraint pop_addAnimation:buttonAppear forKey:@"aapear"];
                         [buttonAppear setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
                            
                         }];
                     }];
}

- (IBAction)checkPasPressed:(id)sender
{
    POPBasicAnimation *toRight = [POPBasicAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
    toRight.toValue = @50;
    toRight.duration = 0.1;
    [toRight setCompletionBlock:^(POPAnimation *compeltedAnimation, BOOL finished) {

        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
        animation.toValue = @0;
        animation.springSpeed = 16;
        animation.springBounciness = 15;
        [self.textFieldConstraint pop_addAnimation:animation forKey:@"bounce"];
    }];
    [self.textFieldConstraint pop_addAnimation:toRight forKey:@"right"];
}


@end
