//
//  DVNavigationController.m
//  DVBands
//
//  Created by Devond on 15/11/13.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVNavigationController.h"

@implementation DVNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
//    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    //导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:DefaultTintColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //返回键颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
                                                             [UIColor whiteColor],
                                                           NSFontAttributeName:[UIFont systemFontOfSize:17]
                                                           }];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
    
//    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
//                                                               [UIColor grayColor],
//                                                           NSFontAttributeName:[UIFont systemFontOfSize:17]
//                                                           }
//                                                forState:UIControlStateDisabled];
//
//    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
//                                                               DefaultTintColor,
//                                                           NSFontAttributeName:[UIFont systemFontOfSize:17]
//                                                           }
//                                                forState:UIControlStateNormal];
    
//    //去除底部黑线
    [UINavigationBar appearance].shadowImage = [UIImage new];
//    [[UINavigationBar appearance] setBackgroundImage:[DVUtil imageWithColor:RGBAFromHex(0xfafafa, 0.9) AndSize:CGSizeMake(IPHONE_WIDTH, 1)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count==1) {
        viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    }
    [super pushViewController:viewController animated:animated];
}


-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

-(BOOL)shouldAutorotate {
  
    return  YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
 
    return  UIInterfaceOrientationMaskPortrait;
}


@end
