unit u0425;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ExtCtrls, StdCtrls, Grids,
  XA_DATASETLib_TLB;

type
  Tfrm0425 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbAccount: TComboBox;
    edtPass: TEdit;
    btnQuery: TButton;
    sgInfo: TStringGrid;
    sgResult: TStringGrid;
    rgfills: TRadioGroup;
    rgMM: TRadioGroup;
    rgSort: TRadioGroup;
    edtCode: TEdit;
    XAQuery1: TXAQuery;
    procedure FormShow(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XAQuery1ReceiveData(ASender: TObject;
      const szBlockName: WideString);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
  private
    FOrNm : WideString;  
    procedure SetData(ARow: Integer; szName: WideString);
    procedure SetDataOccus(ACol, ARow : Integer;
      szName: WideString);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm0425: Tfrm0425;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm0425.FormShow(Sender: TObject);
var
  I : Integer;
  szAcc : WideString;
begin
  Width := 720;
  Height := 500;

  for I := 0 to MainForm.XASession1.GetAccountListCount - 1 do
  begin
    szAcc := MainForm.XASession1.GetAccountList( I );
    cbAccount.Items.Add( szAcc )
  end;

  If cbAccount.Items.Count > 0 then
    cbAccount.ItemIndex := 0;

  sgResult.Cells[0,0] := '주문번호';
  sgResult.Cells[1,0] := '종목번호';
  sgResult.Cells[2,0] := '구분';
  sgResult.Cells[3,0] := '주문수량';
  sgResult.Cells[4,0] := '주문가격';
  sgResult.Cells[5,0] := '체결수량';
  sgResult.Cells[6,0] := '체결가격';
  sgResult.Cells[7,0] := '미체결잔량';
  sgResult.Cells[8,0] := '확인수량';
  sgResult.Cells[9,0] := '상태';
  sgResult.Cells[10,0] := '원주문번호';
  sgResult.Cells[11,0] := '유형';
  sgResult.Cells[12,0] := '상태';
  sgResult.Cells[13,0] := '주문시간';
  sgResult.Cells[14,0] := '주문매체';
  sgResult.Cells[15,0] := '처리순번';
  sgResult.Cells[16,0] := '호가유형';
  sgResult.Cells[17,0] := '처리순번';
  sgResult.Cells[18,0] := '현재가';
  sgResult.Cells[19,0] := '주문구분';
  sgResult.Cells[20,0] := '신용구분';
  sgResult.Cells[21,0] := '대출일자';
      
end;

procedure Tfrm0425.btnQueryClick(Sender: TObject);
begin
  XAQuery1.SetFieldData( 't0425InBlock', 'accno', 0, cbAccount.Text );
  XAQuery1.SetFieldData( 't0425InBlock', 'passwd', 0, edtPass.Text );
  XAQuery1.SetFieldData( 't0425InBlock', 'expcode', 0, edtCode.Text );
  XAQuery1.SetFieldData( 't0425InBlock', 'chegb', 0, IntToStr(rgfills.ItemIndex) );
  XAQuery1.SetFieldData( 't0425InBlock', 'medosu', 0, IntToStr(rgMM.ItemIndex) );
  XAQuery1.SetFieldData( 't0425InBlock', 'sortgb', 0, IntToStr(rgSort.ItemIndex+1) );
  XAQuery1.SetFieldData( 't0425InBlock', 'cts_ordno', 0, FOrNm );
  XAQuery1.Request( FALSE );
end;

procedure Tfrm0425.SetData ( ARow   : Integer;
                             szName : WideString );
var
  Data : WideString;
begin
  Data := XAQuery1.GetFieldData( 't0425OutBlock', szName, 0 );
  if szName = 'ordno' then FOrNm := Data;
  sgInfo.Cells[0, ARow] := szName;
  sgInfo.Cells[1, ARow] := Data;
end;

procedure Tfrm0425.SetDataOccus ( ACol, ARow : Integer;
                                  szName : WideString );
var
  Data : WideString;
begin
  Data := XAQuery1.GetFieldData( 't0425OutBlock1', szName, ARow );
  sgResult.Cells[ACol, ARow + 1] := szName;
  sgResult.Cells[ACol, ARow + 1] := Data;
end;

procedure Tfrm0425.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm0425.XAQuery1ReceiveData(ASender: TObject;
  const szBlockName: WideString);
var
  I, J : Integer;
  nRecordCount : Integer;
begin
    SetData ( 0, 'tqty');
    SetData ( 1, 'tcheqty');
    SetData ( 2, 'tordrem');
    SetData ( 3, 'cmss');
    SetData ( 4, 'tamt');
    SetData ( 5, 'tmdamt');
    SetData ( 6, 'tmsamt');
    SetData ( 7, 'tax');
    SetData ( 8, 'cts_ordno');

    nRecordCount := XAQuery1.GetBlockCount( 't0425OutBlock1' );

    If nRecordCount = 0 then sgResult.RowCount := 2
    else sgResult.RowCount := nRecordCount + 1;

    For I := 0 to nRecordCount - 1 do
    begin
      For J := 0 to sgResult.ColCount -1 do
      begin
        SetDataOccus(J, I, sgResult.Cells[J, 0]);
      end;
    end;
end;

procedure Tfrm0425.XAQuery1ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  ShowMessage ( szMessage );
end;

end.
