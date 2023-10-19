unit u6024;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, StdCtrls, Grids, XA_DATASETLib_TLB;

type
  Tfrm6024 = class(TForm)
    Button1: TButton;
    cbAccount: TComboBox;
    edtPass: TEdit;
    Query: TXAQuery;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryReceiveMessage(ASender: TObject; nIsSystemError,
      nRequestID, nMessageCode: Integer; const szMessage: WideString);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QueryReceiveData(ASender: TObject;
      const szBlockName: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm6024: Tfrm6024;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm6024.Button1Click(Sender: TObject);
begin
  Query.SetFieldData ( 't6005InBlock', 'reccnt', 0 , '1' );           //레코드갯수
  Query.SetFieldData ( 't6005InBlock', 'memegb', 0 , '1' ); //매매구분
  Query.SetFieldData ( 't6005InBlock', 'accno', 0 , cbAccount.Text );  //계좌
  Query.SetFieldData ( 't6005InBlock', 'passwd', 0 , '0000' ); //비밀
  Query.SetFieldData ( 't6005InBlock', 'expcode', 0 , '000660' );      //코드
  Query.SetFieldData ( 't6005InBlock', 'hopemesu', 0 , '23000' ); //주문가
  Query.SetFieldData ( 't6005InBlock', 'mechegb', 0 , MainForm.XASession1.GetCommMedia() );  //통신매체             
  Query.Request( FALSE );
end;

procedure Tfrm6024.FormShow(Sender: TObject);
var
  I : Integer;
  szAcc : WideString;
begin
  for I := 0 to MainForm.XASession1.GetAccountListCount - 1 do
  begin
    szAcc := MainForm.XASession1.GetAccountList( I );
    cbAccount.Items.Add( szAcc )
  end;
  cbAccount.ItemIndex := 0;
end;
procedure Tfrm6024.QueryReceiveMessage(ASender: TObject; nIsSystemError,
  nRequestID, nMessageCode: Integer; const szMessage: WideString);
begin
  ShowMessage ( szMessage );
end;

procedure Tfrm6024.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm6024.QueryReceiveData(ASender: TObject;
  const szBlockName: WideString);
var
  I, IRecCount : Integer;
  Data : WideString;
begin
  Data := Query.GetFieldData( 't6005OutBlock', 'reccnt', 0 );
  IRecCount := StrToInt ( Data );
  For I := 0 to IRecCount - 1 do
  begin
    StringGrid1.Cells[ 0, I+1] := Query.GetFieldData( 't6005OutBlock1', 'reccnt', I );
    StringGrid1.Cells[ 1, I+1] := Query.GetFieldData( 't6005OutBlock1', 'accname', I );
    StringGrid1.Cells[ 2, I+1] := Query.GetFieldData( 't6005OutBlock1', 'kospiamt', I );
    StringGrid1.Cells[ 3, I+1] := Query.GetFieldData( 't6005OutBlock1', 'susuryorate', I );
    StringGrid1.Cells[ 4, I+1] := Query.GetFieldData( 't6005OutBlock1', 'usemarginrate', I );                
    ShowMessage ( Data );
  end;
end;

end.
