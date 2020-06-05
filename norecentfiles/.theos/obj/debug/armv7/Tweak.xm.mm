#line 1 "Tweak.xm"

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

@class UITabBarController; 
static void (*_logos_orig$_ungrouped$UITabBarController$viewDidLayoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UITabBarController$viewDidLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UITabBarController$_tabBarItemClicked$)(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UITabBarController$_tabBarItemClicked$(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST, SEL, id); 

#line 1 "Tweak.xm"
#import <UIKit/UITabBar.h>


static void _logos_method$_ungrouped$UITabBarController$viewDidLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$_ungrouped$UITabBarController$viewDidLayoutSubviews(self, _cmd);
	self.tabBar.hidden = TRUE;
	[self setSelectedIndex:1];
}

static void _logos_method$_ungrouped$UITabBarController$_tabBarItemClicked$(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	[self setSelectedIndex:1];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UITabBarController = objc_getClass("UITabBarController"); MSHookMessageEx(_logos_class$_ungrouped$UITabBarController, @selector(viewDidLayoutSubviews), (IMP)&_logos_method$_ungrouped$UITabBarController$viewDidLayoutSubviews, (IMP*)&_logos_orig$_ungrouped$UITabBarController$viewDidLayoutSubviews);MSHookMessageEx(_logos_class$_ungrouped$UITabBarController, @selector(_tabBarItemClicked:), (IMP)&_logos_method$_ungrouped$UITabBarController$_tabBarItemClicked$, (IMP*)&_logos_orig$_ungrouped$UITabBarController$_tabBarItemClicked$);} }
#line 15 "Tweak.xm"
