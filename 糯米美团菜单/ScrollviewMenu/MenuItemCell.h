//
//  MenuItemCell.h
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemModel.h"


typedef void(^MenuItemCellBlock)(MenuItemModel *);
@interface MenuItemCell : UICollectionViewCell

@property (nonatomic,strong) MenuItemModel *model;

@property (nonatomic,copy) MenuItemCellBlock block;

@end
