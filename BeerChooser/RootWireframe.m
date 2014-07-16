//
//  RootWireframe.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "RootWireframe.h"

@implementation RootWireframe

- (void)showRootViewControllers:(NSArray *)viewControllers
                      inWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = [self tabBarControllerFromWindow:window];
    tabBarController.viewControllers = viewControllers;
}


- (UITabBarController *)tabBarControllerFromWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = (UITabBarController *)[window rootViewController];
    
    return tabBarController;
}

@end