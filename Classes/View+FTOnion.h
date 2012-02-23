#import "FTOnion.h"

#define $(klass) [VIEW_CLASS viewsInKeyWindowMatching:[klass class]]

@interface VIEW_CLASS (FTOnion)

+ (id)viewsInKeyWindowMatching:(id)classOrNameOrQuery;

- (NSArray *)viewsByClass:(Class)viewClass;
- (NSArray *)viewsByClass:(Class)viewClass sortByOrigin:(BOOL)sortByOrigin;
- (VIEW_CLASS *)viewByName:(NSString *)accessibilityLabel;

@end
