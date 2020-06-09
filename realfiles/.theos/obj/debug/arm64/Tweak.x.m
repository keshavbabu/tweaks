#line 1 "Tweak.x"
@interface FPItem
@property (nonatomic, copy, readwrite) NSString *displayName;
@property (nonatomic, copy, readwrite) NSString *filename;
-(void)setDisplayName:(id)arg1;
@end

@interface DOCFilenameView
-(id)textField;
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

@class DOCFilenameView; @class UIStackView; @class FPItem; 
static FPItem* (*_logos_orig$_ungrouped$FPItem$initWithCoder$)(_LOGOS_SELF_TYPE_INIT FPItem*, SEL, id) _LOGOS_RETURN_RETAINED; static FPItem* _logos_method$_ungrouped$FPItem$initWithCoder$(_LOGOS_SELF_TYPE_INIT FPItem*, SEL, id) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$DOCFilenameView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$DOCFilenameView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$DOCFilenameView$textField)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$DOCFilenameView$textField(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UIStackView* (*_logos_orig$_ungrouped$UIStackView$init)(_LOGOS_SELF_TYPE_INIT UIStackView*, SEL) _LOGOS_RETURN_RETAINED; static UIStackView* _logos_method$_ungrouped$UIStackView$init(_LOGOS_SELF_TYPE_INIT UIStackView*, SEL) _LOGOS_RETURN_RETAINED; 

#line 11 "Tweak.x"

static FPItem* _logos_method$_ungrouped$FPItem$initWithCoder$(_LOGOS_SELF_TYPE_INIT FPItem* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED{
	self = _logos_orig$_ungrouped$FPItem$initWithCoder$(self, _cmd, arg1);
	[self setDisplayName:self.filename];
	return self;
}


UITextField *field;
BOOL done = FALSE;


static void _logos_method$_ungrouped$DOCFilenameView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$_ungrouped$DOCFilenameView$layoutSubviews(self, _cmd);
	[self textField];
}
static id _logos_method$_ungrouped$DOCFilenameView$textField(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	field = _logos_orig$_ungrouped$DOCFilenameView$textField(self, _cmd);
	NSMutableArray *mutableWords = [[field.text componentsSeparatedByString: @"."] mutableCopy];
	if(!done){
		if([mutableWords count]>1)[mutableWords removeLastObject];
		done = TRUE;
	}
	field.text = [mutableWords componentsJoinedByString:@"."];
	return field;
}



static UIStackView* _logos_method$_ungrouped$UIStackView$init(_LOGOS_SELF_TYPE_INIT UIStackView* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED{
	done = FALSE;
	return _logos_orig$_ungrouped$UIStackView$init(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalCtor_70f9104a(int __unused argc, char __unused **argv, char __unused **envp){
	{Class _logos_class$_ungrouped$FPItem = objc_getClass("FPItem"); MSHookMessageEx(_logos_class$_ungrouped$FPItem, @selector(initWithCoder:), (IMP)&_logos_method$_ungrouped$FPItem$initWithCoder$, (IMP*)&_logos_orig$_ungrouped$FPItem$initWithCoder$);Class _logos_class$_ungrouped$DOCFilenameView = NSClassFromString(@"Files.DOCFilenameView"); MSHookMessageEx(_logos_class$_ungrouped$DOCFilenameView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$DOCFilenameView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$DOCFilenameView$layoutSubviews);MSHookMessageEx(_logos_class$_ungrouped$DOCFilenameView, @selector(textField), (IMP)&_logos_method$_ungrouped$DOCFilenameView$textField, (IMP*)&_logos_orig$_ungrouped$DOCFilenameView$textField);Class _logos_class$_ungrouped$UIStackView = objc_getClass("UIStackView"); MSHookMessageEx(_logos_class$_ungrouped$UIStackView, @selector(init), (IMP)&_logos_method$_ungrouped$UIStackView$init, (IMP*)&_logos_orig$_ungrouped$UIStackView$init);}
}
