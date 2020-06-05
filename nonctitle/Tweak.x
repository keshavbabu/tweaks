@interface NCNotificationListHeaderTitleView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook NCNotificationListHeaderTitleView

-(id)title{
	self.hidden = TRUE;
	return %orig;
}

%end