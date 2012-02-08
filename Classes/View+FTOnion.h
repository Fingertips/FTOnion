#import "FTOnion.h"

@interface VIEW_CLASS (FTOnion)

- (NSArray *)viewsByClass:(Class)viewClass;
- (NSArray *)viewsByClass:(Class)viewClass sortByOrigin:(BOOL)sortByOrigin;
- (VIEW_CLASS *)viewByName:(NSString *)accessibilityLabel;

@end
