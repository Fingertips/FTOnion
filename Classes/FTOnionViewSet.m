#import "FTOnionViewSet.h"

@implementation FTOnionViewSet

- (id)initWithArray:(NSArray *)array {
  if ((self = [super init])) {
    viewSet = [[array sortedArrayUsingComparator:^(id view1, id view2) {
      CGPoint origin1 = [(VIEW_CLASS *)view1 convertPoint:((VIEW_CLASS *)view1).bounds.origin toView:nil];
      CGPoint origin2 = [(VIEW_CLASS *)view2 convertPoint:((VIEW_CLASS *)view2).bounds.origin toView:nil];
      if (floor(origin1.y) > floor(origin2.y)) {
        return (NSComparisonResult)NSOrderedDescending;
      } else if (floor(origin1.y) < floor(origin2.y)) {
        return (NSComparisonResult)NSOrderedAscending;
      } else if (floor(origin1.x) > floor(origin2.x)) {
        return (NSComparisonResult)NSOrderedDescending;
      } else if (floor(origin1.x) < floor(origin2.x)) {
        return (NSComparisonResult)NSOrderedAscending;
      }
      return (NSComparisonResult)NSOrderedSame;
    }] retain];
  }
  return self;
}

- (void)dealloc {
  [viewSet release];
  [super dealloc];
}

- (NSArray *)array {
  return [viewSet autorelease];
}

- (NSUInteger)count {
  return [viewSet count];
}

- (BOOL)isEmpty {
  return [viewSet count] == 0;
}

- (id)at:(NSInteger)index {
  NSInteger i = index;
  if (i < 0) {
    i = [viewSet count] + i;
  }
  if (i < 0 || i + 1 > [viewSet count]) {
    return nil;
  }
  return [viewSet objectAtIndex:i];
}

- (NSString *)description {
  return [viewSet description];
}

- (BOOL)isEqual:(id)other {
  if ([other isKindOfClass:[FTOnionViewSet class]]) {
    return [viewSet isEqual:[other array]];
  } else {
    return [other isEqual:viewSet];
  }
}

// Doesn't forward messages with args (yet).
- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
  const char *sel = sel_getName(selector);
  if (sel[strlen(sel) - 1] != ':' && [[viewSet objectAtIndex:0] respondsToSelector:selector]) {
    return [NSMethodSignature signatureWithObjCTypes:"@@:^v"];
  } else {
    return [super methodSignatureForSelector:selector];
  }
}

- (void)forwardInvocation:(NSInvocation *)invocation {
  SEL sel = [invocation selector];
  if ([[viewSet objectAtIndex:0] respondsToSelector:sel]) {
    id result = [self _filteredList:[viewSet valueForKey:NSStringFromSelector(sel)]];
    [invocation setReturnValue:&result];
  } else {
    [self doesNotRecognizeSelector:sel];
  }
}

// To be override by the client to return a suitable class other than NSArray.
- (id)_filteredList:(NSArray *)array {
  return (id)array;
}

@end
