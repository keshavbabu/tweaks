#import <substrate.h>

@interface WAWeatherCollectionFooterViewCell : UIView
@property (nonatomic, strong, readwrite) UIButton *theWeatherChannelButton;
@end

@interface WATouchButton : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook WAWeatherCollectionFooterViewCell
	
	-(void)layoutSubviews{
		%orig;
		self.theWeatherChannelButton.enabled = false;
		self.theWeatherChannelButton.frame = CGRectMake(0.0,0.0,0.0,0.0);
	}
%end

%hook WATouchButton
	-(void)layoutSubviews{
		%orig;
		if(self.frame.size.width == 24&&self.frame.size.height == 24)self.frame = CGRectMake(0.0,0.0,0.0,0.0); //idk
	}
%end