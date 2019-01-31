//
//  CAShapeLayer+CAShapeLayer_Additions.h
//  SVGKit
//
//  Created by Nick Bolton on 1/25/19.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (CAShapeLayer_Additions)

@property (nonatomic, copy, setter = svgk_setUuid:) NSString *svgk_uuid;
@property (nonatomic, copy, setter = svgk_setFillColor:) UIColor *svgk_fillColor;

@end
