//
//  ViewController.m
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#import "ViewController.h"
#import "ScollViewMenu.h"
#import "Header.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    ScollViewMenu *menu = [[ScollViewMenu alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 2 * cellW + 2 * margin) ModelArray:@[@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123"]];
    menu.menuItemSelectedBlock = ^(MenuItemModel *model) {
        NSLog(@"***********%@",model);
    };
    [self.view addSubview:menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
