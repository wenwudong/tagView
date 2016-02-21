//
//  MDTagView.h
//  tagView
//
//  Created by Mark on 16/1/11.
//  Copyright © 2016年 Mark Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDTagView : UIView
/**
 *  标签内容
 */
@property (copy, nonatomic) NSString* labelText;
/**
 *  标签位置
 */
@property (assign, nonatomic) CGPoint point;
/**
 *  标签正反
 */
@property (assign, nonatomic) BOOL isPos;
/**
 *  记录标签数据
 */
@property (strong, nonatomic) NSMutableDictionary* dic;
/**
 *  相当于tag
 */
@property (assign, nonatomic) NSInteger tags;

/**
 *  标签的图片
 */
@property (strong, nonatomic) UIImageView* imageView;

@end
