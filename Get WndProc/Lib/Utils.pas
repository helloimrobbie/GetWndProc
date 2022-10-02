unit Utils;

interface

uses Windows,SysUtils,tlhelp32;

Function GetHandle(TitleName : AnsiString):HWND;
Function GetWndInfo(Hwnd : HWND):Bool;

implementation

Function GetHandle(TitleName : AnsiString):HWND;
begin
  result := FindWindowA(nil,PAnsiCHAR(TitleName));
end;

Function GetWndInfo(Hwnd : HWND):Bool;
begin
 if IsWindowUnicode(Hwnd) then
 begin
   WriteLn( Format('%x',[GetClassLongPtrA(Hwnd,GCL_WNDPROC)]) );
 end
 else
 begin
   WriteLn( Format('%x',[GetClassLongPtrW(Hwnd,GCL_WNDPROC)]) );
 end;

end;

end.
