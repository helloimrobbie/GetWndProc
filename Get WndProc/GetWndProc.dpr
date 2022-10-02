program GetWndProc;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  windows,
  Utils in 'Lib\Utils.pas';

var
 ProcessName : AnsiString = '';
 pHandle : HWND = 0;
begin
  try
    Write('Process Title Name : ');
    ReadLn(ProcessName);

    if ProcessName <> '' then
    begin
      pHandle := GetHandle(ProcessName);

      WriteLn( Format('Hwnd : %x',[pHandle]) );

      WriteLn( Format('Proc : %x',[GetWndInfo(pHandle)]) );
    end;

    readLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
