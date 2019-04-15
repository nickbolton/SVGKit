#import "SVGKExporterUIImage.h"

#import "SVGKImage+CGContext.h" // needed for Context calls

@implementation SVGKExporterUIImage

+(UIImage*) exportAsUIImage:(SVGKImage *)image
{
    return [self exportAsUIImage:image size:image.size scale:[UIScreen mainScreen].scale antiAliased:TRUE curveFlatnessFactor:1.0 interpolationQuality:kCGInterpolationDefault];
}

+(UIImage*) exportAsUIImage:(SVGKImage*) image size:(CGSize)size scale:(CGFloat)scale antiAliased:(BOOL) shouldAntialias curveFlatnessFactor:(CGFloat) multiplyFlatness interpolationQuality:(CGInterpolationQuality) interpolationQuality
{
	if( [image hasSize] )
	{
		UIGraphicsBeginImageContextWithOptions( size, FALSE, scale );
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		[image renderToContext:context antiAliased:shouldAntialias curveFlatnessFactor:multiplyFlatness interpolationQuality:interpolationQuality flipYaxis:FALSE];
		
		UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		return result;
	}
	else
	{
		NSAssert(FALSE, @"You asked to export an SVG to bitmap, but the SVG file has infinite size. Either fix the SVG file, or set an explicit size you want it to be exported at (by calling .size = something on this SVGKImage instance");
		
		return nil;
	}
}

@end
