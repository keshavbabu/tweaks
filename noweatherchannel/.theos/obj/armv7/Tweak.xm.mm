#line 1 "Tweak.xm"
#import <substrate.h>

@interface WAWeatherCollectionFooterViewCell : UIView
@property (nonatomic, strong, readwrite) UIButton *theWeatherChannelButton;
@end

@interface WATouchButton : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WAWeatherCollectionFooterViewCell; @class WATouchButton; 
static void (*_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WATouchButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL WATouchButton* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WATouchButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL WATouchButton* _LOGOS_SELF_CONST, SEL); 

#line 11 "Tweak.xm"

	
	static void _logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$layoutSubviews(self, _cmd);
		self.theWeatherChannelButton.enabled = false;
		self.theWeatherChannelButton.frame = CGRectMake(0.0,0.0,0.0,0.0);
	}



	static void _logos_method$_ungrouped$WATouchButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL WATouchButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		_logos_orig$_ungrouped$WATouchButton$layoutSubviews(self, _cmd);
		if(self.frame.size.width == 24&&self.frame.size.height == 24)self.frame = CGRectMake(0.0,0.0,0.0,0.0); 
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WAWeatherCollectionFooterViewCell = objc_getClass("WAWeatherCollectionFooterViewCell"); MSHookMessageEx(_logos_class$_ungrouped$WAWeatherCollectionFooterViewCell, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$layoutSubviews);Class _logos_class$_ungrouped$WATouchButton = objc_getClass("WATouchButton"); MSHookMessageEx(_logos_class$_ungrouped$WATouchButton, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$WATouchButton$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$WATouchButton$layoutSubviews);} }
#line 26 "Tweak.xm"
