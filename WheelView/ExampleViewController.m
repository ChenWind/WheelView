//
//  ExampleViewController.m
//  WheelView
//
//  Created by Halid Ozsoy on 9/24/12.
//  Copyright (c) 2012 Halid Ozsoy. All rights reserved.
//

#import "ExampleViewController.h"
#import "WheelView.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    WheelView *v = [[WheelView alloc] initWithFrame:CGRectMake(60, 80, 200, 300)];

    [v setBackgroundColor:[UIColor blackColor]];
    
    UIView *sv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    [sv setBackgroundColor:[UIColor redColor]];
    [v addSubview:sv];
    
    WheelView *insider = [[WheelView alloc] initWithFrame:CGRectMake(10, 10, 100, 150)];
    
    [insider setBackgroundColor:[UIColor blueColor]];
    
    UIView *isv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    [isv setBackgroundColor:[UIColor greenColor]];
    [insider addSubview:isv];
    
    [v addSubview:insider];
    
    [self.view addSubview:v];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
