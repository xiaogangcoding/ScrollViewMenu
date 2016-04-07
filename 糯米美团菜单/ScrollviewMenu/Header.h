//
//  Header.h
//  糯米美团菜单
//
//  Created by wg on 16/4/6.
//  Copyright © 2016年 ubetween. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define RandomColor  [UIColor colorWithHue: ( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1];


#define DeviceWidth            [[UIScreen mainScreen] bounds].size.width
#define DeviceHeight           [[UIScreen mainScreen] bounds].size.height
//默认的行数列数
#define rowCount  4
#define lineCount  2
#define totalCount (rowCount * lineCount)

//collectionView的常量
#define margin  5

//有关cell内的contentView

#define iconW   44 * DeviceWidth/375.0 //默认为正方形

#define cellW   (DeviceWidth/rowCount)
#define cellH   cellW

#endif /* Header_h */
