#line 1 "Tweak.x"
@interface UITabBar : UIView
@property (nonatomic, copy, readwrite) NSArray<UITabBarItem *> *items;
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

@class UITabBar; 
static NSArray * (*_logos_orig$_ungrouped$UITabBar$items)(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); static NSArray * _logos_method$_ungrouped$UITabBar$items(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); 

#line 5 "Tweak.x"


static NSArray * _logos_method$_ungrouped$UITabBar$items(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	
	NSArray *it = [NSArray arrayWithObjects:[self.items objectAtIndex:0],nil];
	return it;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UITabBar = objc_getClass("UITabBar"); MSHookMessageEx(_logos_class$_ungrouped$UITabBar, @selector(items), (IMP)&_logos_method$_ungrouped$UITabBar$items, (IMP*)&_logos_orig$_ungrouped$UITabBar$items);} }
#line 14 "Tweak.x"
