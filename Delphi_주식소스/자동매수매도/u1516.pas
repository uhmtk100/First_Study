unit u1516;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, OleCtrls, ExtCtrls,
  XA_DATASETLib_TLB;

type
  Tfrm1516 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    edtCode: TEdit;
    Panel4: TPanel;
    sgResult: TStringGrid;
    sgInfo: TStringGrid;
    pnlMessage: TPanel;
    cmbType: TComboBox;
    btnNext: TButton;
    XAQuery1: TXAQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure XAQuery1ReceiveData(ASender: TObject;
      const szBlockName: WideString);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
  private
    procedure SetDataOccus(ACol, ARow, ADataOffSet: Integer;
      szName: WideString);
    { Private declarations }
  public
    { Public declarations }
    FStrKey   : String;
    FRecordSeq : Integer;
  end;

var
  frm1516: Tfrm1516;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm1516.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm1516.FormShow(Sender: TObject);
begin
  sgResult.Cells[0, 0] := 'ItemName';
  sgResult.Cells[1, 0] := 'ItemValue';
  cmbType.ItemIndex := 0;
  Self.Width := 800;
  Self.Height := 600;
  
  XAQuery1.ResFileName := './IO/t1516_2.res';

  sgResult.Cells[0,0] := '종목명';
  sgResult.Cells[1,0] := '현재가';
  sgResult.Cells[2,0] := '전일대비구분';
  sgResult.Cells[3,0] := '전일대비';
  sgResult.Cells[4,0] := '등락율';
  sgResult.Cells[5,0] := '누적거래량';
  sgResult.Cells[6,0] := '시가';
  sgResult.Cells[7,0] := '고가';
  sgResult.Cells[8,0] := '저가';
  sgResult.Cells[9,0] := '소진율';
  sgResult.Cells[10,0] := '베타계수';
  sgResult.Cells[11,0] := 'PER';
  sgResult.Cells[12,0] := '외인순매수';
  sgResult.Cells[13,0] := '기관순매수';
  sgResult.Cells[14,0] := '거래증가율';
  sgResult.Cells[15,0] := '종목코드';
  sgResult.Cells[16,0] := '시가총액';
  sgResult.Cells[17,0] := '거래대금';
  sgResult.ColWidths[0] := 120;

  sgInfo.Cells[0, 0] := '종목코드';
  sgInfo.Cells[0, 1] := '지수';
  sgInfo.Cells[0, 2] := '전일대비구분';
  sgInfo.Cells[0, 3] := '전일대비';
  sgInfo.Cells[0, 4] := '등락율';
end;

procedure Tfrm1516.SetDataOccus ( ACol, ARow, ADataOffSet : Integer;
                                  szName : WideString );
var
  Data : WideString;
begin
  Data := XAQuery1.GetFieldData( 't1516OutBlock1', szName, ADataOffSet );
  sgResult.Cells[ACol, ARow + 1] := szName;
  sgResult.Cells[ACol, ARow + 1] := Data;
end;

procedure Tfrm1516.btnNextClick(Sender: TObject);
var
  szNameK, szNameE : WideString;
  nRecordType : Integer;
begin
  XAQuery1.SetFieldData( 't1516InBlock', 'upcode', 0, edtCode.Text );
  XAQuery1.SetFieldData( 't1516InBlock', 'gubun', 0, Copy(cmbType.Text,1,1) );
  XAQuery1.SetFieldData( 't1516InBlock', 'shcode', 0, FStrKey );
  ShowMessage ( XAQuery1.GetFieldData( 't1516OutBlock', 'shcode', 0 ) );
  XAQuery1.Request( TRUE );
end;

procedure Tfrm1516.Button1Click(Sender: TObject);
var
  szNameK, szNameE : WideString;
  nRecordType : Integer;
begin
  FStrKey := '';
  FRecordSeq := 0;
  XAQuery1.SetFieldData( 't1516InBlock', 'upcode', 0, edtCode.Text );
  XAQuery1.SetFieldData( 't1516InBlock', 'gubun', 0, Copy(cmbType.Text,1,1) );
  XAQuery1.SetFieldData( 't1516InBlock', 'shcode', 0, FStrKey );
  XAQuery1.Request( FALSE );
end;

procedure Tfrm1516.XAQuery1ReceiveData(ASender: TObject;
  const szBlockName: WideString);
var
  I, nRecordCount : integer;
begin

    sgInfo.Cells[1, 0] := XAQuery1.GetFieldData( 't1516OutBlock', 'shcode', 0 );
    sgInfo.Cells[1, 1] := XAQuery1.GetFieldData( 't1516OutBlock', 'pricejisu', 0 );
    sgInfo.Cells[1, 2] := XAQuery1.GetFieldData( 't1516OutBlock', 'sign', 0 );
    sgInfo.Cells[1, 3] := XAQuery1.GetFieldData( 't1516OutBlock', 'change', 0  );
    sgInfo.Cells[1, 4] := XAQuery1.GetFieldData( 't1516OutBlock', 'jdiff', 0 );
    
    FStrKey := XAQuery1.GetFieldData( 't1516OutBlock', 'shcode', 0 );

    If ( XAQuery1.IsNext ) then
    begin
      btnNext.Enabled := True;
    end else btnNext.Enabled := False;

    nRecordCount := XAQuery1.GetBlockCount ( 't1516OutBlock1' );
    if ( nRecordCount = 0 ) then Exit;  

    If ( FRecordSeq <> 0 ) then
    begin
      sgResult.RowCount := sgResult.RowCount + nRecordCount;
    end else begin
      sgResult.RowCount := nRecordCount;
    end;

    sgResult.FixedRows := 1;
      
    For I := 0 to nRecordCount - 1 do
    begin
      SetDataOccus ( 0, FRecordSeq + I, I, sgResult.Cells[0,0]);
      SetDataOccus ( 1, FRecordSeq + I, I, sgResult.Cells[1,0]);
      SetDataOccus ( 2, FRecordSeq + I, I, sgResult.Cells[2,0]);
      SetDataOccus ( 3, FRecordSeq + I, I, sgResult.Cells[3,0]);
      SetDataOccus ( 4, FRecordSeq + I, I, sgResult.Cells[4,0]);
      SetDataOccus ( 5, FRecordSeq + I, I, sgResult.Cells[5,0]);
      SetDataOccus ( 6, FRecordSeq + I, I, sgResult.Cells[6,0]);
      SetDataOccus ( 7, FRecordSeq + I, I, sgResult.Cells[7,0]);
      SetDataOccus ( 8, FRecordSeq + I, I, sgResult.Cells[8,0]);
      SetDataOccus ( 9, FRecordSeq + I, I, sgResult.Cells[9,0]);
      SetDataOccus ( 10, FRecordSeq + I, I, sgResult.Cells[10,0]);
      SetDataOccus ( 11, FRecordSeq + I, I, sgResult.Cells[11,0]);
      SetDataOccus ( 12, FRecordSeq + I, I, sgResult.Cells[12,0]);
     end;
    FRecordSeq := FRecordSeq + nRecordCount;

end;


procedure Tfrm1516.XAQuery1ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  pnlMessage.Caption := Trim(szMessage);
end;

end.
