@interface FPItem
@property (nonatomic, copy, readwrite) NSString *displayName;
@property (nonatomic, copy, readwrite) NSString *filename;
-(void)setDisplayName:(id)arg1;
@end

@interface DOCFilenameView
-(id)textField;
@end

%hook FPItem
-(id)initWithCoder:(id)arg1{
	self = %orig;
	[self setDisplayName:self.filename];
	return self;
}
%end

UITextField *field;
BOOL done = FALSE;

%hook DOCFilenameView
-(void)layoutSubviews{
	%orig;
	[self textField];
}
-(id)textField{
	field = %orig;
	NSMutableArray *mutableWords = [[field.text componentsSeparatedByString: @"."] mutableCopy];
	if(!done){
		if([mutableWords count]>1)[mutableWords removeLastObject];
		done = TRUE;
	}
	field.text = [mutableWords componentsJoinedByString:@"."];
	return field;
}
%end

%hook UIStackView
-(id)init{
	done = FALSE;
	return %orig;
}
%end

%ctor{
	%init(DOCFilenameView=NSClassFromString(@"Files.DOCFilenameView"));
}