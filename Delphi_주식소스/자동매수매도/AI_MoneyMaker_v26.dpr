program AI_MoneyMaker_v26;

uses
  Forms,
  MAIN in 'MAIN.PAS' {MainForm},
  about in 'about.pas' {DB_Box},
  u1101 in 'u1101.pas' {frm1101},
  u0424 in 'u0424.pas' {frm0424},
  u0425 in 'u0425.pas' {frm0425},
  u1516 in 'u1516.pas' {frm1516},
  u1301 in 'u1301.pas' {frm1301},
  u6024 in 'u6024.pas' {frm6024},
  selling in 'selling.pas' {frmSell},
  Monitoring in 'Monitoring.pas' {frm5100},
  Buying in 'Buying.pas' {frmBuy};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
