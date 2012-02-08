#import "FTOnion.h"

@class FTOnionViewSet;

@interface VIEW_CLASS (FTOnion)

- (FTOnionViewSet *)viewsByClass:(Class)viewClass;
- (NSArray *)_viewsByClass:(Class)viewClass recursive:(BOOL)recursive;
- (VIEW_CLASS *)viewByName:(NSString *)accessibilityLabel;

@end
