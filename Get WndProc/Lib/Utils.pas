unit Utils;

interface

uses Windows,SysUtils,tlhelp32;

Function GetHandle(TitleName : AnsiString):HWND;
Function GetWndInfo(Hwnd : HWND):SIZE_T;

implementation

Function GetHandle(TitleName : AnsiString):HWND;
begin
  result := FindWindowA(nil,PAnsiCHAR(TitleName));
end;

Function GetWndInfo(Hwnd : HWND):SIZE_T;
var ret : SIZE_T;
begin
 if IsWindowUnicode(Hwnd) then
 begin
   result := GetClassLongPtrW(Hwnd,GCL_WNDPROC);
 end
 else
   result := GetClassLongPtrA(Hwnd,GCL_WNDPROC)

end;

end.
