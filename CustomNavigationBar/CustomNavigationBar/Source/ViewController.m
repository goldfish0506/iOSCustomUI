//
//  ViewController.m
//  CustomNavigationBar
//
//  Created by Alvin on 12/18/13.
//  Copyright (c) 2013 Alvin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configSubViews];
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)configSubViews
{
  UILabel *myLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 21)];
  [myLable setText:@"My Test Label"];
  [self.view addSubview:myLable];
  
  // User Image as title
  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_title"]];
  
  // Add buttons on Navigation bar
  UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
  UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
  
  NSArray *actionButtonItems = @[shareItem, cameraItem];
  self.navigationItem.rightBarButtonItems = actionButtonItems;
}


/*
 * uncomment to hidden statusBar in iOS7
 *
- (BOOL)prefersStatusBarHidden
{
  return YES;
}
*/


@end
