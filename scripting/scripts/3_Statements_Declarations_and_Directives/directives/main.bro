@load ./newmod

event bro_init()
{
	@ifdef ( NEWMOD::available )
		@if (NEWMOD::v2 == T )
			NEWMOD::func_v2("first arg", "second arg");
		@else
			NEWMOD::func_v1("one arg");
		@endif
	@endif
}

