## The double-dollar sign macro

Returns an array of UI elements of the given class.
Starts traversing from the key UIWindow instance.

```objc
it(@"has a segmented control that switches the type of task shown", ^{
  UISegmentedControl *tabs = [$$(UISegmentedControl) lastObject];
  [[[tabs titleForSegmentAtIndex:0] should] equal:@"Upcoming"];
  [[[tabs titleForSegmentAtIndex:1] should] equal:@"Completed"];
  [[[tabs titleForSegmentAtIndex:2] should] equal:@"Assigned"];
});
```


## The single-dollar sign macro

Returns the UI element whose accessibility label matches the given string.
Starts traversing from the key UIWindow instance.

```objc
it(@"shows the `completed' tab", ^{
  UIView *tab = $(@"Completed"); // instance of UISegment
  [[theValue(tab.hidden) should] equal:theValue(NO)];
});
```


## -[UIView tap]

Sends a touch event to the UI element, simulating a tap.

```objc
it(@"shows the `completed' tasks", ^{
  [$(@"Completed") tap];
  [[controller.tasks should] equal:completedTasks];
});
```
