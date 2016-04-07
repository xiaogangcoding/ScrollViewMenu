//
//  MenuItemCell.m
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#import "MenuItemCell.h"
#import "MenuItemBtn.h"
@interface MenuItemCell ()

@property (nonatomic, strong) MenuItemBtn *button;
@end
@implementation MenuItemCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _button = [MenuItemBtn buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.942 green:0.939 blue:0.942 alpha:1.000]] forState:UIControlStateHighlighted];
        _button.frame = self.bounds;
        [self addSubview:_button];
        
    }

    return self;
}

- (void)btnClick:(UIButton *)sender
{
    if (self.block) {
        self.block(_model);
    }
}
- (void)setModel:(MenuItemModel *)model
{
    _model = model;

    [_button setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
    [_button setTitle:@"美食美食" forState:UIControlStateNormal];
    [_button.titleLabel sizeToFit];

}
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
