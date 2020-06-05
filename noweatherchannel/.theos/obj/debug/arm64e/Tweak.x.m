#line 1 "Tweak.x"
#import <substrate.h>

@interface WAWeatherCollectionFooterViewCell : UIView
@property (nonatomic, strong, readwrite) UIButton *theWeatherChannelButton;
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

@class WAWeatherCollectionFooterViewCell; 
static id (*_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$theWeatherChannelButton)(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$theWeatherChannelButton(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$setTheWeatherChannelButton$)(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$setTheWeatherChannelButton$(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST, SEL, id); 

#line 7 "Tweak.x"


	static id _logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$theWeatherChannelButton(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		UIButton *goAway = MSHookIvar<UIButton *>(self, "_theWeatherChannelButton");
		goAway.enabled = FALSE;
		return goAway;
	}
	static void _logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$setTheWeatherChannelButton$(_LOGOS_SELF_TYPE_NORMAL WAWeatherCollectionFooterViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
		_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$setTheWeatherChannelButton$(self, _cmd, arg1);
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WAWeatherCollectionFooterViewCell = objc_getClass("WAWeatherCollectionFooterViewCell"); MSHookMessageEx(_logos_class$_ungrouped$WAWeatherCollectionFooterViewCell, @selector(theWeatherChannelButton), (IMP)&_logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$theWeatherChannelButton, (IMP*)&_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$theWeatherChannelButton);MSHookMessageEx(_logos_class$_ungrouped$WAWeatherCollectionFooterViewCell, @selector(setTheWeatherChannelButton:), (IMP)&_logos_method$_ungrouped$WAWeatherCollectionFooterViewCell$setTheWeatherChannelButton$, (IMP*)&_logos_orig$_ungrouped$WAWeatherCollectionFooterViewCell$setTheWeatherChannelButton$);} }
#line 18 "Tweak.x"
