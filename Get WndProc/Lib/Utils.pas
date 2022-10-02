unit Utils;

interface

uses Windows,SysUtils,tlhelp32;

Function GetHandle(TitleName : AnsiString):HWND;
Function GetWndInfo(Hwnd : HWND):DWORD;

implementation

Function GetHandle(TitleName : AnsiString):HWND;
begin
  result := FindWindowA(nil,PAnsiCHAR(TitleName));
end;

Function GetWndInfo(Hwnd : HWND):DWORD;
var ret : DWORD;
begin
 if IsWindowUnicode(Hwnd) then
 begin
   result := GetClassLongPtrA(Hwnd,GCL_WNDPROC);
 end
 else
 begin
   ret := GetClassLongPtrW(Hwnd,GCL_WNDPROC);
   if ret = 0 then ret := GetClassLongPtrA(Hwnd,GCL_WNDPROC)
   else result := ret;
 end;

end;

end.
