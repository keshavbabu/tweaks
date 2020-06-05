#line 1 "Tweak.x"
@interface NCNotificationListHeaderTitleView : UIView
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

@class NCNotificationListHeaderTitleView; 
static id (*_logos_orig$_ungrouped$NCNotificationListHeaderTitleView$title)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListHeaderTitleView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$NCNotificationListHeaderTitleView$title(_LOGOS_SELF_TYPE_NORMAL NCNotificationListHeaderTitleView* _LOGOS_SELF_CONST, SEL); 

#line 5 "Tweak.x"


static id _logos_method$_ungrouped$NCNotificationListHeaderTitleView$title(_LOGOS_SELF_TYPE_NORMAL NCNotificationListHeaderTitleView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	self.hidden = TRUE;
	return _logos_orig$_ungrouped$NCNotificationListHeaderTitleView$title(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NCNotificationListHeaderTitleView = objc_getClass("NCNotificationListHeaderTitleView"); MSHookMessageEx(_logos_class$_ungrouped$NCNotificationListHeaderTitleView, @selector(title), (IMP)&_logos_method$_ungrouped$NCNotificationListHeaderTitleView$title, (IMP*)&_logos_orig$_ungrouped$NCNotificationListHeaderTitleView$title);} }
#line 13 "Tweak.x"
