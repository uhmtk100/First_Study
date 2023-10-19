unit about;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TDB_Box = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DB_Box: TDB_Box;

implementation
uses MAIN;
{$R *.dfm}

procedure TDB_Box.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked then begin
       con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
       con_string := con_string + 'localhost ;Use Encryption for Data=False;Tag with column collation when possible=False';
   end;

end;

procedure TDB_Box.RadioButton2Click(Sender: TObject);
begin
   if RadioButton2.Checked then begin
      con_string := 'Provider=SQLOLEDB.1;Persist Security Info=False;User ID= sa ;PassWord= Link2sky;Initial Catalog= STOCK_INFO; Data Source =' + edit1.Text;

   end;


end;

end.
 
