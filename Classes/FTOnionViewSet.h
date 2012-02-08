#import "FTOnion.h"

@interface FTOnionViewSet : NSObject {
  NSArray *viewSet;
}

- (id)initWithArray:(NSArray *)array;
- (NSArray *)array;
- (NSUInteger)count;
- (BOOL)isEmpty;
- (id)index:(NSInteger)index;

- (id)_filteredList:(NSArray *)array;

@end
