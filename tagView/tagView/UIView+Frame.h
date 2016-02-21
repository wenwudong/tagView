

#import <UIKit/UIKit.h>
/**
 *  此扩展用于方便的修改控件的frame  获取控件的各个属性
 */
@interface UIView (Frame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat boderWidth;
@property (nonatomic, strong) IBInspectable UIColor* bodercolor;
- (CGFloat)BottomY;
- (CGFloat)RightX;
- (CGFloat)LeftX;
- (CGFloat)TopY;
//- (CGFloat)Width;
//- (CGFloat)Heigh;
//- (CGSize) Size;
@end
