unit u1301;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, OleCtrls, ExtCtrls,
  XA_DATASETLib_TLB;

type
  Tfrm1301 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnQuery: TButton;
    edtCode: TEdit;
    Panel4: TPanel;
    sgResult: TStringGrid;
    pnlMessage: TPanel;
    btnNext: TButton;
    Panel5: TPanel;
    Label2: TLabel;
    edtStTime: TEdit;
    edtEndTime: TEdit;
    Label3: TLabel;
    XAQuery1: TXAQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQueryClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure XAQuery1ReceiveData(ASender: TObject;
      const szTrCode: WideString);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
  private
    { Private declarations }
    FStrKey    : String;
    FRecordSeq : Integer;
    procedure SetDataOccus(ACol, ARow, ADataOffSet: Integer; szName: WideString);
  public
    { Public declarations }
  end;

var
  frm1301: Tfrm1301;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm1301.FormShow(Sender: TObject);
begin
  Self.Width := 800;
  Self.Height := 600;

  sgResult.Cells[0,0] := '시간';
  sgResult.Cells[1,0] := '현재가';
  sgResult.Cells[2,0] := '전일대비구분';
  sgResult.Cells[3,0] := '전일대비';
  sgResult.Cells[4,0] := '등락율';
  sgResult.Cells[5,0] := '체결수량';
  sgResult.Cells[6,0] := '체결강도';
  sgResult.Cells[7,0] := '거래량';
  sgResult.Cells[8,0] := '매도체결수량';
  sgResult.Cells[9,0] := '매도체결건수';
  sgResult.Cells[10,0] := '매수체결수량';
  sgResult.Cells[11,0] := '순체결량';
  sgResult.Cells[12,0] := '순체결건수';

end;
procedure Tfrm1301.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm1301.SetDataOccus ( ACol, ARow, ADataOffSet : Integer;
                                  szName : WideString );
var
  Data : WideString;
begin
  Data := XAQuery1.GetFieldData( 't1301OutBlock1', szName, ADataOffSet );
  sgResult.Cells[ACol, ARow + 1] := szName;
  sgResult.Cells[ACol, ARow + 1] := Data;
end;

procedure Tfrm1301.btnQueryClick(Sender: TObject);
var
  szNameK, szNameE : WideString;
  nRecordType : Integer;
begin
  FStrKey := '';
  FRecordSeq := 0;
  XAQuery1.SetFieldData( 't1301InBlock', 'shcode', 0, edtCode.Text );
  XAQuery1.SetFieldData( 't1301InBlock', 'cvolume', 0, '' );
  XAQuery1.SetFieldData( 't1301InBlock', 'starttime', 0, '0900' );
  XAQuery1.SetFieldData( 't1301InBlock', 'endtime', 0, '1300' );
  XAQuery1.SetFieldData( 't1301InBlock', 'cts_time', 0, '' );
  XAQuery1.Request( FALSE );
end;

procedure Tfrm1301.btnNextClick(Sender: TObject);
var
  szNameK, szNameE : WideString;
  nRecordType : Integer;
  nDataSize : Integer;
  szDataBuff : WideString;
begin
  If FStrKey = '' then Exit;
  XAQuery1.SetFieldData( 't1301InBlock', 'shcode', 0, edtCode.Text );
  XAQuery1.SetFieldData( 't1301InBlock', 'cvolume', 0, '' );
  XAQuery1.SetFieldData( 't1301InBlock', 'starttime', 0, edtStTime.Text );
  XAQuery1.SetFieldData( 't1301InBlock', 'endtime', 0, edtEndTime.Text );
  XAQuery1.SetFieldData( 't1301InBlock', 'cts_time', 0,  FStrKey );
  XAQuery1.Request( TRUE );
end;

procedure Tfrm1301.XAQuery1ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  I, nRecordCount: integer;
begin

    FStrKey := XAQuery1.GetFieldData( 't1301OutBlock', 'cts_time', 0 );
    Panel5.Caption := FStrKey;

    If ( XAQuery1.IsNext ) then
    begin
      btnNext.Enabled := True;
    end else btnNext.Enabled := False;

    nRecordCount := XAQuery1.GetBlockCount ( 't1301OutBlock1' );
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

procedure Tfrm1301.XAQuery1ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  pnlMessage.Caption := Trim(szMessage);
end;

end.
