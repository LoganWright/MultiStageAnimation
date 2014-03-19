//
//  ViewController.m
//  MultiStageAnimation
//
//  Created by Logan Wright on 3/19/14.
//  Copyright (c) 2014 Logan Wright. All rights reserved.
//

#import "ViewController.h"

#import "MSAnimation.h"

@interface ViewController ()

{
    UIView * greenView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    greenView = [UIView new];
    greenView.frame = CGRectMake(0, 0, 100, 100);
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UITapGestureRecognizer * tap = [UITapGestureRecognizer new];
    tap.numberOfTapsRequired = 1;
    [tap addTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void) handleTap:(UITapGestureRecognizer *)tap {
    MSAnimation * newAnimation = [MSAnimation newAnimationWithDuration:0.35 andOptions:UIViewAnimationOptionCurveEaseInOut];
    [newAnimation addNewAnimationStage:^{
        greenView.center = CGPointMake(greenView.center.x, greenView.center.y + 100);
    }];
    [newAnimation addNewAnimationStage:^{
        greenView.center = CGPointMake(greenView.center.x + 100, greenView.center.y);
    }];
    [newAnimation addNewAnimationStage:^{
        greenView.center = CGPointMake(greenView.center.x, greenView.center.y + 100);
    }];
    [newAnimation addNewAnimationStage:^{
        greenView.center = CGPointMake(greenView.center.x - 50, greenView.center.y);
    }];
    [newAnimation addNewAnimationStage:^{
        greenView.frame = CGRectMake(0, 0, 100, 100);
    }];
    [newAnimation animateSequenceWithCompletion:^{
        NSLog(@"All finished!");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
