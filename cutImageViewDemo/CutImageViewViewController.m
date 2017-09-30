//
//  CutImageViewViewController.m
//  cutImageViewDemo
//
//  Created by lvshasha on 2017/9/30.
//  Copyright © 2017年 com.GlassStore. All rights reserved.
//

#import "CutImageViewViewController.h"
#import "UIImageView+WebCache.h"


#define KSCREENWIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define KSCREENHEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

@interface CutImageViewViewController ()

@end

@implementation CutImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 图片剪裁
    UIImageView *picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 100, 150, 150)];
    [picImageView sd_setImageWithURL:[NSURL URLWithString:@"https://www.vquaner.com/Upload/image/bf9e6ccfc7d244c627b7a90f054958c1.jpeg"]
                    placeholderImage:[UIImage imageNamed:@""]
                             options:SDWebImageAllowInvalidSSLCertificates
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                               picImageView.image = [self image:image scaleToSize:CGSizeMake(150, 150)];
                               picImageView.image = [self imageFromImage:picImageView.image inRect:CGRectMake(picImageView.image.size.width/2 - 75, picImageView.image.size.height/2 - 75, 150, 150)];
                           }];
    [self.view addSubview:picImageView];
}


/**
 *将图片缩放到指定的CGSize大小
 * UIImage image 原始的图片
 * CGSize size 要缩放到的大小
 */
- (UIImage*)image:(UIImage *)image scaleToSize:(CGSize)size{
    
    
    CGSize dealWithSize = CGSizeZero;
    if (image.size.width < image.size.height) {
        dealWithSize = CGSizeMake(size.width, (size.height * image.size.height) / image.size.width);
    } else {
        dealWithSize = CGSizeMake((size.height * image.size.width) / image.size.height, size.height);
    }
    
    
    // 得到图片上下文，指定绘制范围
    UIGraphicsBeginImageContext(dealWithSize);
    
    // 将图片按照指定大小绘制
    [image drawInRect:CGRectMake(0, 0, dealWithSize.width, dealWithSize.height)];
    
    // 从当前图片上下文中导出图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 当前图片上下文出栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
- (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [image CGImage];
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    
    //将CGImageRef转换成UIImage
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    //返回剪裁后的图片
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
