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
		self = %orig;
		UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleLowPowerMode)];
		doubleTap.numberOfTapsRequired = 2;
		[self addGestureRecognizer:doubleTap];
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