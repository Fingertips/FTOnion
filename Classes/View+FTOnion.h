#import "FTOnion.h"

@interface VIEW_CLASS (FTOnion)

- (FTOnionViewSet *)viewsByClass:(Class)viewClass;
- (NSArray *)_viewsByClass:(Class)viewClass recursive:(BOOL)recursive;
- (BACON_VIEW *)viewByName:(NSString *)accessibilityLabel;

@end
