@interface _CDBatterySaver
+(id)batterySaver;
-(BOOL)setPowerMode:(long long)arg1 error:(id *)arg2;
-(long long)getPowerMode;
@end

@interface UIStatusBarWindow : UIView
-(void)addGestureRecognizer:(id)arg1;
-(void)toggleLowPowerMode;
@end


%hook UIStatusBarWindow
	- (id)initWithFrame:(CGRect)frame {
		UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleLowPowerMode)];
		doubleTap.numberOfTapsRequired = 2;
		//UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/2.0,frame.origin.y,frame.size.width/2.0,frame.size.height)];
		[self addGestureRecognizer:doubleTap];
		//[self addSubview:newView];
		return %orig;
	}
	%new
	-(void)toggleLowPowerMode{
		if([[objc_getClass("_CDBatterySaver") batterySaver] getPowerMode]==0)
			[[objc_getClass("_CDBatterySaver") batterySaver] setPowerMode:1 error:nil];
		else
			[[objc_getClass("_CDBatterySaver") batterySaver] setPowerMode:0 error:nil];
	}
%end