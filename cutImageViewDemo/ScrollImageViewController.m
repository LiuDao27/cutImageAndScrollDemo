//
//  ScrollImageViewController.m
//  cutImageViewDemo
//
//  Created by lvshasha on 2017/9/30.
//  Copyright © 2017年 com.GlassStore. All rights reserved.
//

#import "ScrollImageViewController.h"
#import "UIImageView+WebCache.h"


#define KSCREENWIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define KSCREENHEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

@interface ScrollImageViewController ()<UIScrollViewDelegate>

@end

@implementation ScrollImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 图片滚动
    UIImageView *picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 100, KSCREENWIDTH, 150)];
    picImageView.contentMode = UIViewContentModeScaleAspectFit;
    picImageView.backgroundColor = [UIColor blueColor];
    [picImageView sd_setImageWithURL:[NSURL URLWithString:@"https://www.vquaner.com/Upload/image/2cd0239195a3a5f79542b53b00d76a59.jpeg"]
                    placeholderImage:[UIImage imageNamed:@""]
                             options:SDWebImageAllowInvalidSSLCertificates
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                               // 获取图片适应屏幕比例
                               CGFloat imageFloat = KSCREENWIDTH * image.size.height / image.size.width;
                               if (imageFloat > KSCREENHEIGHT + 20) {
                                   UIScrollView *zoomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGHT+20)];
                                   zoomScrollView.backgroundColor = [UIColor blueColor];
                                   zoomScrollView.minimumZoomScale = 1.0;
                                   zoomScrollView.maximumZoomScale = 2.0;
                                   zoomScrollView.contentSize = CGSizeMake(KSCREENWIDTH, imageFloat);
                                   zoomScrollView.delegate = self;
                                   [self.view addSubview:zoomScrollView];
                                   
                                   picImageView.image = image;
                                   picImageView.frame = CGRectMake(0, 0, KSCREENWIDTH, imageFloat);
                                   [zoomScrollView addSubview:picImageView];
                               }
                               
                           }];
    [self.view addSubview:picImageView];
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
