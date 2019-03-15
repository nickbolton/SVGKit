//
//  CAShapeLayer+CAShapeLayer_Additions.m
//  SVGKit
//
//  Created by Nick Bolton on 1/25/19.
//

#import "CAShapeLayer+CAShapeLayer_Additions.h"
#import <objc/runtime.h>

@implementation CAShapeLayer (CAShapeLayer_Additions)

- (NSString *)svgk_uuid {
    return (NSString *)objc_getAssociatedObject(self, @selector(svgk_uuid));
}

- (void)svgk_setUuid:(NSString *)uuid {
    objc_setAssociatedObject(self, @selector(svgk_uuid), uuid, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)svgk_isFillable {
    return ((NSNumber *)objc_getAssociatedObject(self, @selector(svgk_isFillable))).boolValue;
}

- (void)svgk_setFillable:(BOOL)value {
    objc_setAssociatedObject(self, @selector(svgk_isFillable), [NSNumber numberWithBool:value], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
