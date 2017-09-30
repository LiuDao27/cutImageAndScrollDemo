//
//  ViewController.m
//  cutImageViewDemo
//
//  Created by lvshasha on 2017/9/29.
//  Copyright © 2017年 com.GlassStore. All rights reserved.
//

#import "ViewController.h"
#import "CutImageViewViewController.h"
#import "ScrollImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    UIButton *cutImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cutImageButton.frame = CGRectMake(100, 100, 100, 100);
    cutImageButton.backgroundColor = [UIColor blueColor];
    [cutImageButton addTarget:self action:@selector(cutImageButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cutImageButton];
    
    //
    UIButton *scrollImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scrollImageButton.frame = CGRectMake(100, 200, 100, 100);
    scrollImageButton.backgroundColor = [UIColor blueColor];
    [scrollImageButton addTarget:self action:@selector(scrollImageButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scrollImageButton];
    
    
    
    
}

- (void)cutImageButton
{
    CutImageViewViewController *imageCtrl = [[CutImageViewViewController alloc] init];
    [self.navigationController pushViewController:imageCtrl animated:YES];
}

- (void)scrollImageButton
{
    ScrollImageViewController *scrollCtrl = [[ScrollImageViewController alloc] init];
    [self.navigationController pushViewController:scrollCtrl animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
