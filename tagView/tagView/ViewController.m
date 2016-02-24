//
//  ViewController.m
//  tagView
//
//  Created by Mark on 16/1/11.
//  Copyright © 2016年 Mark Dong. All rights reserved.
//

#import "MDTagView.h"
#import "UIView+Frame.h"
#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/**
 *  图片遮罩层
 */
@property (strong, nonatomic) UIView* coverView;
/**
 *  存放标签
 */
@property (strong, nonatomic) NSMutableDictionary* dict;

@property (strong, nonatomic) UIImage* newmage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dishName.enabled = NO;
    self.dishPrice.enabled = NO;
    //图片自适应显示
    self.backImage.contentMode = UIViewContentModeScaleAspectFit;
}
/**
 *  保存图片
 *
 *  @param sender <#sender description#>
 */
- (IBAction)save:(id)sender
{

    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.coverView.bounds.size, NO, 0);
    //获取图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //移动截取框
    CGContextTranslateCTM(ref, -self.coverView.x, -self.coverView.y);
    //渲染
    [self.backImage.layer renderInContext:ref];

    self.newmage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭
    UIGraphicsEndImageContext();

    UIImageWriteToSavedPhotosAlbum(self.newmage, self, @selector(imageSaveToPhoto:error:contextInfo:), nil);
}

- (void)imageSaveToPhoto:(UIImage*)image error:(NSError*)error contextInfo:(void*)contextInfo
{
    NSString* message = @"呵呵";
    if (!error) {
        message = @"保存成功";
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        message = [error description];
    }
    NSLog(@"%@", message);
}

/**
 *  添加背景图
 *
 *  @param sender <#sender description#>
 */
- (IBAction)addPic:(UIButton*)sender
{
    //重复选择添加图片，防止coverView叠加
    [self.coverView removeFromSuperview];
    UIImagePickerController* imagePick = [[UIImagePickerController alloc] init];
    imagePick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePick.allowsEditing = YES;
    imagePick.delegate = self;
    [self presentViewController:imagePick animated:YES completion:nil];
}
#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString*, id>*)info
{
    UIImage* image = info[@"UIImagePickerControllerEditedImage"];
    self.backImage.image = image;
    self.coverView = [[UIView alloc] init];

    self.coverView.size = [self scaleSizeWithImage:self.backImage.image andImageView:self.backImage];
    NSLog(@"%@", NSStringFromCGSize(_coverView.size));
    self.coverView.y = (self.backImage.height - self.coverView.height) / 2;
    self.coverView.x = (self.backImage.width - self.coverView.width) / 2;
    [self.backImage addSubview:self.coverView];

    self.dishName.enabled = YES;
    self.dishPrice.enabled = YES;
    //为了防止二次添加图片时点击按钮无响应
    self.dishName.selected = NO;
    self.dishPrice.selected = NO;

    [picker dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  添加菜名标签
 *
 *  @param sender <#sender description#>
 */
- (IBAction)addDishName:(UIButton*)sender
{

    sender.selected = !sender.selected;
    if (sender.isSelected) {
        [self addTagViewWith:0];
    }
    else {
        MDTagView* tag = [self.dict objectForKey:@999];
        [tag removeFromSuperview];
    }
}
/**
 *  添加价格标签
 *
 *  @param sender <#sender description#>
 */
- (IBAction)addDishPrice:(UIButton*)sender
{

    sender.selected = !sender.selected;

    if (sender.isSelected) {
        [self addTagViewWith:1];
    }
    else {
        MDTagView* tag = [self.dict objectForKey:@1000];
        [tag removeFromSuperview];
    }
}

- (void)addTagViewWith:(NSInteger)buttonTag
{
    MDTagView* tagView = [[MDTagView alloc] initWithFrame:CGRectZero];
    if (buttonTag == 0) {
        tagView.isPos = NO;
        tagView.tags = 999;
        tagView.origin = CGPointMake(self.coverView.width / 2, self.coverView.height / 2);
        tagView.labelText = @"春卷";
    }
    else if (buttonTag == 1) {
        tagView.isPos = NO;
        tagView.tags = 1000;
        tagView.origin = CGPointMake(self.coverView.width / 2, self.coverView.height / 2 - 50);
        tagView.labelText = @"120";
    }
    [self.dict setObject:tagView forKey:@(tagView.tags)];
    [self.coverView addSubview:tagView];
}

/**
 *  定位图片遮罩层位置
 */
- (CGSize)scaleSizeWithImage:(UIImage*)image andImageView:(UIImageView*)imageView
{
    CGSize imageSize = CGSizeZero;
    CGFloat imageWidth = image.size.width;

    CGFloat imageHeight = image.size.height;

    CGFloat imageScale = imageHeight / imageWidth;
    NSLog(@"%@", image);
    CGFloat screenScale = imageView.height / imageView.width;
    if (imageScale > screenScale) {
        imageSize = CGSizeMake(imageView.height / imageScale, imageView.height);
    }
    else if (imageScale < screenScale) {
        imageSize = CGSizeMake(imageView.width, imageView.width * imageScale);
    }
    else if (imageScale == screenScale) {
        imageSize = CGSizeMake(imageView.width, imageView.height);
    }
    NSLog(@"%@", NSStringFromCGSize(imageSize));
    return imageSize;
}

#pragma mark 懒加载

- (NSMutableDictionary*)dict
{
    if (_dict == nil) {
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

@end
