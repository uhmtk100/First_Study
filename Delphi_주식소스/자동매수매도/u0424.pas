unit u0424;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ExtCtrls, StdCtrls, Grids,
  XA_DATASETLib_TLB;

type
  Tfrm0424 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbAccount: TComboBox;
    edtPass: TEdit;
    btnQuery: TButton;
    Panel4: TPanel;
    sgResult: TStringGrid;
    sgInfo: TStringGrid;
    XAQuery1: TXAQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQueryClick(Sender: TObject);
    procedure XAQuery1ReceiveData(ASender: TObject;
      const szBlockName: WideString);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
  private
    { Private declarations }

    FRecordCount : Integer;

    procedure SetData(ARow : Integer; szName: WideString);
    procedure SetDataOccus(ACol, ARow, ADataOffSet: Integer;
      szName: WideString);
  public
    { Public declarations }
  end;

var
  frm0424: Tfrm0424;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm0424.FormShow(Sender: TObject);
var
  I : Integer;
  szAcc : WideString;
begin
  Width := 680;
  Height := 500;

  for I := 0 to MainForm.XASession1.GetAccountListCount - 1 do
  begin
    szAcc := MainForm.XASession1.GetAccountList( I );
    cbAccount.Items.Add( szAcc )
  end;

  If cbAccount.Items.Count > 0 then
    cbAccount.ItemIndex := 0;

  sgResult.Cells[0,0] := '종목번호';
  sgResult.Cells[1,0] := '잔고구분';
  sgResult.Cells[2,0] := '잔고수량';
  sgResult.Cells[3,0] := '매도가능수량';
  sgResult.Cells[4,0] := '평균단가';
  sgResult.Cells[5,0] := '매입금액';
  sgResult.Cells[6,0] := '대출금액';
  sgResult.Cells[7,0] := '만기일자';
  sgResult.Cells[8,0] := '당일매수금액';
  sgResult.Cells[9,0] := '당일매수단가';
  sgResult.Cells[10,0] := '당일매도금액';
  sgResult.Cells[11,0] := '당일매도단가';
  sgResult.Cells[12,0] := '전일매수금액';
  sgResult.Cells[13,0] := '전일매수단가';
  sgResult.Cells[14,0] := '전일매도금액';
  sgResult.Cells[15,0] := '전일매도단가';
  sgResult.Cells[16,0] := '처리순번';
  sgResult.Cells[17,0] := '대출일자';
  sgResult.Cells[18,0] := '종목명';
  sgResult.Cells[19,0] := '시장구분';
  sgResult.Cells[20,0] := '종목구분';
  sgResult.Cells[21,0] := '보유비중';
  sgResult.Cells[22,0] := '현재가';
  sgResult.Cells[23,0] := '평가금액';
  sgResult.Cells[24,0] := '평가손익';
  sgResult.Cells[25,0] := '수익율';
  sgResult.Cells[26,0] := '수수료';
  sgResult.Cells[27,0] := '제세금';
  sgResult.Cells[28,0] := '신용이자';
end;

procedure Tfrm0424.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm0424.btnQueryClick(Sender: TObject);
begin
  FRecordCount := 0;
  XAQuery1.SetFieldData( 't0424InBlock', 'accno', 0, cbAccount.Text );
  XAQuery1.SetFieldData( 't0424InBlock', 'passwd', 0, edtPass.Text );
  XAQuery1.SetFieldData( 't0424InBlock', 'prcgb', 0, '1' );
  XAQuery1.SetFieldData( 't0424InBlock', 'chegb', 0, '0' );
  XAQuery1.SetFieldData( 't0424InBlock', 'charge', 0, '1' );
  XAQuery1.SetFieldData( 't0424InBlock', 'cts_expcode', 0, '' );
  XAQuery1.Request( FALSE );
end;

procedure Tfrm0424.SetData ( ARow   : Integer;
                             szName : WideString );
var
  Data : WideString;
begin
  Data := XAQuery1.GetFieldData( 't0424OutBlock', szName, 0 );
  sgInfo.Cells[0, ARow] := szName;
  sgInfo.Cells[1, ARow] := Data;
end;

procedure Tfrm0424.SetDataOccus ( ACol, ARow, ADataOffSet : Integer;
                                  szName : WideString );
var
  Data : WideString;
begin
  Data := XAQuery1.GetFieldData( 't0424OutBlock1', szName, ADataOffSet );
  sgResult.Cells[ACol, ARow + 1] := szName;
  sgResult.Cells[ACol, ARow + 1] := Data;
end;


procedure Tfrm0424.XAQuery1ReceiveData(ASender: TObject;
  const szBlockName: WideString);
var
  I, nRecordCount : Integer;
begin
  SetData ( 0, 'sunamt' );
  SetData ( 1, 'dtsunik' );
  SetData ( 2, 'mamt' );
  SetData ( 3, 'sunamt1' );
  SetData ( 4, 'cts_expcode' );
  SetData ( 5, 'tappamt' );
  SetData ( 6, 'tdtsunik' );

  nRecordCount := XAQuery1.GetBlockCount ( 't0424OutBlock1' );
  sgResult.RowCount := nRecordCount + 1;

  For I := 0 to nRecordCount - 1 do
  begin
    SetDataOccus ( 0, I, FRecordCount,  sgResult.Cells[0,0]);
    SetDataOccus ( 1, I, FRecordCount, sgResult.Cells[1,0]);
    SetDataOccus ( 2, I, FRecordCount, sgResult.Cells[2,0]);
    SetDataOccus ( 3, I, FRecordCount, sgResult.Cells[3,0]);
    SetDataOccus ( 4, I, FRecordCount, sgResult.Cells[4,0]);
    SetDataOccus ( 5, I, FRecordCount, sgResult.Cells[5,0]);
    SetDataOccus ( 6, I, FRecordCount, sgResult.Cells[6,0]);
    SetDataOccus ( 7, I, FRecordCount, sgResult.Cells[7,0]);
    SetDataOccus ( 8, I, FRecordCount, sgResult.Cells[8,0]);
    SetDataOccus ( 9, I, FRecordCount, sgResult.Cells[9,0]);
    SetDataOccus ( 10, I, FRecordCount, sgResult.Cells[10,0]);
    SetDataOccus ( 11, I, FRecordCount, sgResult.Cells[11,0]);
    SetDataOccus ( 12, I, FRecordCount, sgResult.Cells[12,0]);
    SetDataOccus ( 13, I, FRecordCount, sgResult.Cells[13,0]);
    SetDataOccus ( 14, I, FRecordCount, sgResult.Cells[14,0]);
    SetDataOccus ( 15, I, FRecordCount, sgResult.Cells[15,0]);
    SetDataOccus ( 16, I, FRecordCount, sgResult.Cells[16,0]);
    SetDataOccus ( 17, I, FRecordCount, sgResult.Cells[17,0]);
    SetDataOccus ( 18, I, FRecordCount, sgResult.Cells[18,0]);
    SetDataOccus ( 19, I, FRecordCount, sgResult.Cells[19,0]);
    SetDataOccus ( 20, I, FRecordCount, sgResult.Cells[20,0]);
    SetDataOccus ( 21, I, FRecordCount, sgResult.Cells[21,0]);
    SetDataOccus ( 22, I, FRecordCount, sgResult.Cells[22,0]);
    SetDataOccus ( 23, I, FRecordCount, sgResult.Cells[23,0]);
    SetDataOccus ( 24, I, FRecordCount, sgResult.Cells[24,0]);
    SetDataOccus ( 25, I, FRecordCount, sgResult.Cells[25,0]);
    SetDataOccus ( 26, I, FRecordCount, sgResult.Cells[26,0]);
    SetDataOccus ( 27, I, FRecordCount, sgResult.Cells[27,0]);
    SetDataOccus ( 28, I, FRecordCount, sgResult.Cells[28,0]);
    Inc ( FRecordCount );
  end;
end;


procedure Tfrm0424.XAQuery1ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  ShowMessage ( szMessage );
end;

end.
