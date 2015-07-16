//
//  ViewController.m
//  colorLight
//
//  Created by luo plus on 15/6/20.
//  Copyright (c) 2015年 plusluo. All rights reserved.
//

#import "CLViewController.h"
#import "CLView.h"

@interface CLViewController ()

@end

@implementation CLViewController

- (void)loadView{
	[super loadView];
	self.view = [[CLView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}



@end
