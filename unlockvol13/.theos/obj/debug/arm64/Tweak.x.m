#line 1 "Tweak.x"

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

@class SBVolumeControlState; 
static BOOL (*_logos_orig$_ungrouped$SBVolumeControlState$isUILocked)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControlState* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBVolumeControlState$isUILocked(_LOGOS_SELF_TYPE_NORMAL SBVolumeControlState* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBVolumeControlState$setUILocked$)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControlState* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBVolumeControlState$setUILocked$(_LOGOS_SELF_TYPE_NORMAL SBVolumeControlState* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 1 "Tweak.x"

static BOOL _logos_method$_ungrouped$SBVolumeControlState$isUILocked(_LOGOS_SELF_TYPE_NORMAL SBVolumeControlState* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	return FALSE;
}
static void _logos_method$_ungrouped$SBVolumeControlState$setUILocked$(_LOGOS_SELF_TYPE_NORMAL SBVolumeControlState* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL locked){
	_logos_orig$_ungrouped$SBVolumeControlState$setUILocked$(self, _cmd, FALSE);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBVolumeControlState = objc_getClass("SBVolumeControlState"); MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControlState, @selector(isUILocked), (IMP)&_logos_method$_ungrouped$SBVolumeControlState$isUILocked, (IMP*)&_logos_orig$_ungrouped$SBVolumeControlState$isUILocked);MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControlState, @selector(setUILocked:), (IMP)&_logos_method$_ungrouped$SBVolumeControlState$setUILocked$, (IMP*)&_logos_orig$_ungrouped$SBVolumeControlState$setUILocked$);} }
#line 9 "Tweak.x"
