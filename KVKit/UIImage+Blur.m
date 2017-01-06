//
//  UIImage+Blur.h
//
//  Created by Hanwen on 15/9/3.
//  Copyright (c) 2015年 Kevin_han. All rights reserved.
//

#import "UIImage+Blur.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Blur)


#pragma mark --毛玻璃效果
-(UIImage *)boxblurImageWithBlur:(CGFloat)blur {

    NSData *imageData = UIImageJPEGRepresentation(self, 1); // convert to jpeg
    UIImage* destImage = [UIImage imageWithData:imageData];


    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;

    CGImageRef img = destImage.CGImage;

    vImage_Buffer inBuffer, outBuffer;

    vImage_Error error;

    void *pixelBuffer;


    //create vImage_Buffer with data from CGImageRef

    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);


    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);

    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);

    //create vImage_Buffer for output

    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));

    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");

    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);

    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);

    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];

    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);

    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

/**
 *  使用vImage API进行图像的模糊处理
 *
 *  @param image 原图像
 *  @param blur  模糊度（0.0~1.0）
 *
 *  @return 模糊处理之后的图像
 */
-(UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }//判断曝光度
    int boxSize = (int)(blur * 100);//放大100，就是小数点之后两位有效
    boxSize = boxSize - (boxSize % 2) + 1;//如果是偶数，+1，变奇数
    
    CGImageRef img = image.CGImage;//获取图片指针
    
    vImage_Buffer inBuffer, outBuffer;//获取缓冲区
    vImage_Error error;//一个错误类，在后调用画图函数的时候要用
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);//放回一个图片供应者信息
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);//拷贝数据，并转化
    
    inBuffer.width = CGImageGetWidth(img);//放回位图的宽度
    inBuffer.height = CGImageGetHeight(img);//放回位图的高度
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);//放回位图的
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);//填写图片信息
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));//创建一个空间
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,//这个数一定要是奇数的，因此我们一开始的时候需要转化
                                       boxSize,//这个数一定要是奇数的，因此我们一开始的时候需要转化
                                       NULL,
                                       kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    //将刚刚得出的数据，画出来。
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

/**
 * imager 根据传入的图片,生成一张模糊图片
 * blurValue 模糊程序
 **/
- (UIImage *)grCIImage:(UIImage *)imager blurValue:(NSInteger)value {
    //原始图片
    UIImage *image = imager;
    //[UIImage imageNamed:@"TB2cWFQoFXXXXa6XpXXXXXXXXXX_!!0-rate.jpg_400x400.jpg"];
    
    //CIImage 获取图片资源
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    //CIFilter 滤镜
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    
    //将图片输入到滤镜中
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];
    
    //设置模糊程度 默认10
    [blurFilter setValue:@(value) forKey:@"inputRadius"];
    
    //将处理好的图片输出
    CIImage *outCiImage = [blurFilter valueForKey:kCIOutputImageKey];
    
    //用来查询滤镜可以设置的参数和相关的信息
    NSLog(@"%@",[blurFilter attributes]);
    
    //CIContext
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //获取CGImage句柄
    CGImageRef outCGImage = [context createCGImage:outCiImage fromRect:[outCiImage extent]];
    
    //最终获取到图片
    UIImage *blurImage = [UIImage imageWithCGImage:outCGImage];
    
    //释放CGImage句柄
    CGImageRelease(outCGImage);
    
    return blurImage;
}




@end
