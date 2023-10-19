program StockAnalyzer;

uses
  Forms,
  analisys in 'analisys.pas' {Form1},
  market_analysis in 'market_analysis.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
