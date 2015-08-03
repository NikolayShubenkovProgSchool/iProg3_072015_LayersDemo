//
//  ViewController.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright (c) 2015 Nikolay Shubenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *customButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureActivityIndicator];
}

- (void)configureActivityIndicator
{
//    UITableViewCellStyle style;
    
    CALayer *activityCalyer = self.activityIndicator.layer;
    activityCalyer.shadowOpacity = 0.9;
    activityCalyer.shadowColor = [UIColor whiteColor].CGColor;
    activityCalyer.shadowRadius = 10;
    activityCalyer.shadowOffset = CGSizeZero;
    
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect: rect
                                                     cornerRadius: 5];
    activityCalyer.shadowPath = aPath.CGPath;
}

- (IBAction)removeShineFromButton:(UIButton *)button
{
    button.layer.shadowOpacity = 0;
}

- (IBAction)superButtonSelected:(id)sender
{
    NSLog(@"SuperButton did select");
}

- (IBAction)addShineToButton:(UIButton *)button
{
    CALayer *layer = button.layer;
    
    //Сделаем отсутпы по краям от текста
    [button setContentEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
    
    [button layoutIfNeeded];
    
    //Закруглим края
    CGRect frame = button.frame;
    
    //половина высоты кнопки -> получим овал;
    CGFloat radious = CGRectGetHeight(frame) / 2;
    layer.cornerRadius = radious;
    
    
    //Обведем кнопку
    layer.borderColor = [UIColor orangeColor].CGColor;
    layer.borderWidth = 3;
    
    
    layer.shadowColor   = [UIColor redColor].CGColor;
    layer.shadowOffset  = CGSizeMake(0, 0);
    layer.shadowRadius  = 8;
    layer.shadowOpacity = 0.4;
    
}




@end
