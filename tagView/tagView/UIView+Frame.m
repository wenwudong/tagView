

#import "UIView+Frame.h"

@implementation UIView (Frame)

/**
 *  改变View的frame 或者其中一个或者多个属性
 *
 *  @param x x 改变x坐标
 */

- (void)setX:(CGFloat)x /** 改变x坐标 */
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y /** 改变y坐标 */
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width /** 改变宽度 */
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height /** 改变高度 */
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setOrigin:(CGPoint)origin /** 改变x和y的坐标 */
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (void)setSize:(CGSize)size /** 改变frame */
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGFloat)x
{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)y
{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}
- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}
- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGSize)size
{
    return self.frame.size;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}
/**
 *  自定义圆角
 *
 *  @return <#return value description#>
 */
- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}
/**
 *  自定义边框的颜色
 *
 *  @return <#return value description#>
 */
- (UIColor*)bodercolor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setBodercolor:(UIColor*)bodercolor
{
    self.layer.borderColor = bodercolor.CGColor;
}
/**
 *  设置边框宽度
 *
 *  @return <#return value description#>
 */
- (CGFloat)boderWidth
{
    return self.layer.borderWidth;
}
- (void)setBoderWidth:(CGFloat)boderWidth
{
    self.layer.borderWidth = boderWidth;
}
//获取view的坐标
- (CGSize)Size
{
    return self.frame.size;
}
- (CGFloat)Width /** 获取宽度 */
{
    return CGRectGetWidth(self.frame);
}
- (CGFloat)Heigh
{
    return CGRectGetHeight(self.frame);
}
- (CGFloat)TopY /** 获取上面的y坐标 */
{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)BottomY /** 获取下面的y坐标 */
{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)LeftX /** 获取左边的x坐标 */
{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)RightX /** 获取右边的y坐标 */
{
    return CGRectGetMaxX(self.frame);
}
@end
