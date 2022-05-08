void __declspec(naked) fn0x4E50D5()
{
	__asm
	{
		sub eax,dword ptr ds:[0x90D1E4] //g_pLevel
		cmp eax,0xA
		jl _pink
		mov eax,0xFF808080	
		retn 0x4

		_pink:
		cmp eax,0x8
		jl _red
		mov eax,0xFFFF00FF
		retn 0x4

		_red:
		cmp eax,0x6
		jl _orange
		mov eax,0xFFFF0000
		retn 0x4

		_orange:
		cmp eax,0x4
		jl _yellow
		mov eax,0xFFFF8000
		retn 0x4

		_yellow:
		cmp eax,0x2
		jl _green
		mov eax,0xFFFFFF00
		retn 0x4

		_green:
		cmp eax,-0x1
		jl _blue
		mov eax,0xFF00FF00
		retn 0x4

		_blue:
		cmp eax,-0x3
		jl _light
		mov eax,0xFF0000FF
		retn 0x4

		_light:
		cmp eax,-0x5
		jl _white
		mov eax,0xFF00FFFF
		retn 0x4

		_white:
		mov eax,0xFFFFFFFF
		retn 0x4
	}
}

void func()
{
	Hook((void*)0x4E50D5, fn0x4E50D5, 6);
}