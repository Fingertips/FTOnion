#import "View+FTOnion.h"

@implementation VIEW_CLASS (FTOnion)

// Sorts all views by their origin in the window.
- (FTOnionViewSet *)viewsByClass:(Class)viewClass {
  return [[[FTOnionViewSet alloc] initWithArray:[self _viewsByClass:viewClass recursive:YES]] autorelease];
}

- (NSArray *)_viewsByClass:(Class)viewClass recursive:(BOOL)recursive {
  NSMutableArray *result = [NSMutableArray array];
  for (VIEW_CLASS *view in self.subviews) {
    if ([view isKindOfClass:viewClass]) {
      [result addObject:view];
    }
    if (recursive) {
      [result addObjectsFromArray:[view _viewsByClass:viewClass recursive:YES]];
    }
  }
  return result;
}

// To be able to use this the simulator/device needs to have accessibility enabled.
// Do this in the Settings app.
- (VIEW_CLASS *)viewByName:(NSString *)accessibilityLabel {
  //NSLog(@"Search in: %@", self);
  for (VIEW_CLASS *view in self.subviews) {
    NSString *label = nil;
#if TARGET_OS_IPHONE
    label = view.accessibilityLabel;
#else
    if (AXAPIEnabled()) {
      static AXUIElementRef appElement = NULL;
      if (appElement == NULL) {
        appElement = AXUIElementCreateApplication([[NSProcessInfo processInfo] processIdentifier]);
      }

      NSPoint origin = view.bounds.origin;
      if ([view isFlipped]) {
        // add vertical offset in case the view is flipped
        origin.y += view.bounds.size.height;
      }
      // convert to window coodinates
      origin = [view convertPointToBase:origin];
      // convert to screen coodinates
      origin = [view.window convertBaseToScreen:origin];
      // convert to Carbon screen point
      CGPoint screenLocation = [self carbonScreenPointFromCocoaScreenPoint:origin];

      AXUIElementRef element = NULL;
      if (AXUIElementCopyElementAtPosition(appElement, screenLocation.x, screenLocation.y, &element) == kAXErrorSuccess) {
        CFTypeRef title = NULL;
        if (AXUIElementCopyAttributeValue(element, kAXTitleAttribute, &title) == kAXErrorSuccess) {
          label = [(NSString *)title autorelease];
        }
        CFRelease(element);
      }
    } else {
      [NSException raise:@"AccessibilityError" format:@"To be able to find view elements, by their accessibility titles, accessibility should be turned on"];
    }
#endif
    if (label && [label isEqualToString:accessibilityLabel]) {
      return view;
    } else {
      VIEW_CLASS *found = [view viewByName:accessibilityLabel];
      if (found) {
        return found;
      }
    }
  }
  return nil;
}

@end
