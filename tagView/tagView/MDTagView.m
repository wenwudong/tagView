//
//  MDTagView.m
//  tagView
//
//  Created by Mark on 16/1/11.
//  Copyright © 2016年 Mark Dong. All rights reserved.
//

#import "MDTagView.h"

#import "UIView+Frame.h"

@interface MDTagView ()

@property (strong, nonatomic) UILabel* label;

@end

@implementation MDTagView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] init];
        self.label.textColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.image = [UIImage imageNamed:@"textTag"];

        [self.imageView addSubview:self.label];
        //点击手势
        UITapGestureRecognizer* tap =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(tap:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        //拖动手势
        UIPanGestureRecognizer* pan =
            [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        self.size = self.imageView.size;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setLabelText:(NSString*)labelText
{
    _labelText = labelText;

    self.label.font = [UIFont systemFontOfSize:12];
    self.label.text = labelText;
    [self.label sizeToFit];

    if ([self.imageView.image isEqual:[UIImage imageNamed:@"textTag"]]) {
        self.label.origin = CGPointMake(
            24, (self.imageView.image.size.height - self.label.height) / 2);
    }
    else if ([self.imageView.image
                 isEqual:[UIImage imageNamed:@"textTagAnti"]]) {
        self.label.origin = CGPointMake(
            6, (self.imageView.image.size.height - self.label.height) / 2);
    }

    self.imageView.size = CGSizeMake(self.label.width + 30, self.imageView.image.size.height);
    self.size = self.imageView.size;
}

- (void)setIsPos:(BOOL)isPos
{
    _isPos = isPos;
    if (isPos) {
        self.imageView.image = [UIImage imageNamed:@"textTagAnti"];
        self.label.origin = CGPointMake(
            6, (self.imageView.image.size.height - self.label.height) / 2);
    }
    else {
        self.imageView.image = [UIImage imageNamed:@"textTag"];
        self.label.origin = CGPointMake(
            24, (self.imageView.image.size.height - self.label.height) / 2);
    }
}
/**
 *  点击手势
 *
 *  @param tap <#tap description#>
 */
- (void)tap:(UITapGestureRecognizer*)tap
{
    if ([self.imageView.image isEqual:[UIImage imageNamed:@"textTag"]]) {
        self.isPos = YES;
    }
    else if ([self.imageView.image
                 isEqual:[UIImage imageNamed:@"textTagAnti"]]) {
        self.isPos = NO;
    }
}
/**
 *  拖拽手势
 *
 *  @param pan <#pan description#>
 */
- (void)pan:(UIPanGestureRecognizer*)pan
{
    self.point = pan.view.origin;
    if (pan.state != UIGestureRecognizerStateEnded && pan.state != UIGestureRecognizerStateFailed) {
        //获取手指的相对位移
        CGPoint translation = [pan translationInView:pan.view];
        NSLog(@"translation%@", NSStringFromCGPoint(translation));

        CGPoint newCenter = CGPointMake(pan.view.center.x + translation.x,
            pan.view.center.y + translation.y);

        [pan setTranslation:CGPointZero inView:pan.view];
        // 设置拖动范围
        if ((newCenter.y >= pan.view.height / 2) && (newCenter.y <= pan.view.superview.height - pan.view.height / 2) && (newCenter.x >= pan.view.width / 2) && (newCenter.x <= pan.view.superview.width - pan.view.width / 2)) {

            pan.view.center = newCenter;
        }
        else {
            [pan setTranslation:CGPointZero inView:pan.view];
        }
    }
}
/**
 *  存储标签的信息
 *
 *  @return <#return value description#>
 */
- (NSMutableDictionary*)dic
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setObject:@(self.isPos) forKey:@"zhengfa"];
    [dic setObject:NSStringFromCGPoint(self.point) forKey:@"weizhi"];
    return dic;
}

@end
