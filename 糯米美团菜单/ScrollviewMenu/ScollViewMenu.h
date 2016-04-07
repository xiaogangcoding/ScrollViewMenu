//
//  ScollViewMenu.h
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemCell.h"

@interface ScollViewMenu : UIView

//菜单点击回调,实现即可
@property (nonatomic,copy) MenuItemCellBlock menuItemSelectedBlock;

- (instancetype)initWithFrame:(CGRect)frame ModelArray:(NSArray *)array;
@end
