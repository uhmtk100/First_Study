program Get_Stock_v01;

uses
  Forms,
  stockinfo in 'stockinfo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
