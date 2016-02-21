//
//  ViewController.h
//  tagView
//
//  Created by Mark on 16/1/11.
//  Copyright © 2016年 Mark Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/**
 *  背景图
 */
@property (weak, nonatomic) IBOutlet UIImageView* backImage;
/**
 *  菜名按钮
 */
@property (weak, nonatomic) IBOutlet UIButton* dishName;
/**
 *  价格按钮
 */
@property (weak, nonatomic) IBOutlet UIButton* dishPrice;

@end
