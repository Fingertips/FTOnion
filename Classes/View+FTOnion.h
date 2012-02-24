#import "FTOnion.h"

#define $(accessibilityLabel) [VIEW_CLASS viewInKeyWindowWithName:accessibilityLabel]
#define $$(className) [VIEW_CLASS viewsInKeyWindowMatchingClass:NSClassFromString(@#className)]

@interface VIEW_CLASS (FTOnion)

+ (id)viewsInKeyWindowMatchingClass:(Class)klass;
+ (id)viewInKeyWindowWithName:(NSString *)accessibilityLabel;

- (NSArray *)viewsByClass:(Class)viewClass;
- (NSArray *)viewsByClass:(Class)viewClass sortByOrigin:(BOOL)sortByOrigin;
- (VIEW_CLASS *)viewByName:(NSString *)accessibilityLabel;

#if TARGET_OS_IPHONE
- (void)tap;
#endif

@end
