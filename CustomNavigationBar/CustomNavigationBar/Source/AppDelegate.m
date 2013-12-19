//
//  AppDelegate.m
//  CustomNavigationBar
//
//  Created by Alvin on 12/18/13.
//  Copyright (c) 2013 Alvin. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define OS_PRIOR_IOS_7 (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  if (OS_PRIOR_IOS_7) {
    // Load resources for iOS 6.1 or earlier
    [self customizeAppearanceIniOS6];
  } else {
    // Load resources for iOS 7 or later
    [self customizeAppearanceIniOS7];
  }

  return YES;
}

- (void)customizeAppearanceIniOS7
{
  // Set bar color
  [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x0099cc)];
  
  // Set bar background with image
  UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 10);
  UIImage *navigationBGImage = [[UIImage imageNamed:@"navigation_bar_bg_pattern_64"]
                                resizableImageWithCapInsets:insets];
  [[UINavigationBar appearance] setBackgroundImage:navigationBGImage
                                     forBarMetrics:UIBarMetricsDefault];
  
  // Remove Navigation bar Bottom Shadow
  [self removeNavigationBarBottomShadow];
  
  // Set Back button color
  [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
  
  // Custom Back button image
  [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
  [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];
  
  // Custom Title
  NSShadow *shadow = [[NSShadow alloc] init];
  shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
  shadow.shadowOffset = CGSizeMake(0, 1);
  
  UIFont *titleFont = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0];
  NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName: UIColorFromRGB(0xf5f5f5),
                                        NSShadowAttributeName : shadow,
                                        NSFontAttributeName : titleFont};
  
  [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
  
  
}

- (void)customizeAppearanceIniOS6
{
  // Set bar color
  [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0x0099cc)];
  
  // Set bar background with image
  UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 10);
  UIImage *navigationBGImage = [[UIImage imageNamed:@"navigation_bar_bg_pattern_44"]
                                resizableImageWithCapInsets:insets];
  [[UINavigationBar appearance] setBackgroundImage:navigationBGImage
                                     forBarMetrics:UIBarMetricsDefault];
  
  // Remove Navigation bar Bottom Shadow
  [self removeNavigationBarBottomShadow];
  
  // Custom Back button Appearance
  [self customBackButtonAppearance];
  
  // Custom Title
  UIFont *titleFont = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0];
  NSDictionary *titleTextAttributes = @{UITextAttributeTextColor : UIColorFromRGB(0xf5f5f5),
                                        UITextAttributeTextShadowColor : UIColorFromRGB(0x000000),
                                        UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
                                        UITextAttributeFont : titleFont};
  [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
  
  // Custom button Item
  NSDictionary *barItemAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                     UIColorFromRGB(0xffffff), UITextAttributeTextColor,
                                     UIColorFromRGB(0x000000), UITextAttributeTextShadowColor,
                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
                                     [UIFont fontWithName:@"AmericanTypewriter" size:0.0], UITextAttributeFont,
                                     nil];
  
  [[UIBarButtonItem appearance] setTitleTextAttributes:barItemAttributes forState:UIControlStateNormal];
  
  UIImage *button30 = [[UIImage imageNamed:@"button_textured_30"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
  UIImage *button24 = [[UIImage imageNamed:@"button_textured_24"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 5)];
  [[UIBarButtonItem appearance] setBackgroundImage:button30 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
  [[UIBarButtonItem appearance] setBackButtonBackgroundImage:button24 forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
}

- (void)removeNavigationBarBottomShadow
{
  [[UINavigationBar appearance] setShadowImage: [[UIImage alloc] init]];
}

- (void)customBackButtonAppearance
{
  NSDictionary *barItemAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                     UIColorFromRGB(0xffffff), UITextAttributeTextColor,
                                     UIColorFromRGB(0x000000), UITextAttributeTextShadowColor,
                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
                                     [UIFont fontWithName:@"AmericanTypewriter" size:0.0], UITextAttributeFont,
                                     nil];
  
  [[UIBarButtonItem appearance] setTitleTextAttributes:barItemAttributes forState:UIControlStateNormal];
  
  UIImage *buttonBack30 = [[UIImage imageNamed:@"button_back_textured_30"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
  UIImage *buttonBack24 = [[UIImage imageNamed:@"button_back_textured_24"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 5)];
  [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack30 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
  [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack24 forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
}


@end
