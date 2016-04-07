//
//  MenuItemBtn.m
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#import "MenuItemBtn.h"
@implementation MenuItemBtn


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.enabled = NO;
        [self setTitleColor:[UIColor colorWithRed:0.524 green:0.543 blue:0.615 alpha:1.000] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
//        self.imageView.backgroundColor = [UIColor redColor];
//        self.titleLabel.backgroundColor = [UIColor blueColor];
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.mj_x = (self.mj_w - iconW)/2.0;
    self.imageView.mj_y = 10;
    self.imageView.mj_size = CGSizeMake(iconW, iconW);

    self.titleLabel.mj_x = 0;
    self.titleLabel.mj_y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.mj_size = CGSizeMake(self.mj_w, cellW - CGRectGetMaxY(self.imageView.frame));

}
@end
