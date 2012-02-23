## The one-dollar sign macro

Returns an array of UI elements of the given class. Starts traversing from the key UIWindow instance.

```objc
it(@"has a segmented control that switches the type of task shown", ^{
  UISegmentedControl *tabs = [$(UISegmentedControl) lastObject];
  [[[tabs titleForSegmentAtIndex:0] should] equal:@"Upcoming"];
  [[[tabs titleForSegmentAtIndex:1] should] equal:@"Completed"];
  [[[tabs titleForSegmentAtIndex:2] should] equal:@"Assigned"];
});
```
