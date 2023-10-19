unit u1101;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, OleCtrls,
  DBOleCtl, XA_DATASETLib_TLB;

type
  Tfrm1101 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    edtCode: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    sgResult: TStringGrid;
    Button2: TButton;
    pnlMessage: TPanel;
    Memo1: TMemo;
    Panel5: TPanel;
    XAQuery1: TXAQuery;
    XAReal1: TXAReal;
    XAReal2: TXAReal;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SetData ( ARow   : Integer; szName : WideString; szRealName : String = '' );
    procedure XAQuery1ReceiveData(ASender: TObject;
      const szTrCode: WideString);
    procedure XAReal1ReceiveRealData(ASender: TObject;
      const szTrCode: WideString);
    procedure XAReal2ReceiveRealData(ASender: TObject;
      const szTrCode: WideString);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1101: Tfrm1101;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm1101.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm1101.FormShow(Sender: TObject);
begin
  Self.Width := 800;
  Self.Height := 600;
  Memo1.Text := XAQuery1.GetResData( );
end;

procedure Tfrm1101.Button1Click(Sender: TObject);
begin
  XAReal1.UnadviseRealData;
  XAReal2.UnadviseRealData;
  XAQuery1.SetFieldData( 't1101InBlock', 'shcode', 0, edtCode.Text );
  XAQuery1.Request( FALSE );
  XAReal1.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
  XAReal2.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
end;

procedure Tfrm1101.Button2Click(Sender: TObject);
begin
  Memo1.Text := XAQuery1.GetResData( );
end;

procedure Tfrm1101.SetData ( ARow   : Integer;
                             szName : WideString;
                             szRealName : String );
var
  Data : WideString;
begin
  If szRealName = 'HA_' then
    Data := XAReal1.GetFieldData( 'OutBlock', szName )
  else If szRealName = 'S3_' then
    Data := XAReal2.GetFieldData( 'OutBlock', szName )  
  else
    Data := XAQuery1.GetFieldData( 't1101OutBlock', szName, 0 );

  sgResult.Cells[0, ARow + 1] := szName;
  sgResult.Cells[1, ARow + 1] := Data;
end;

procedure Tfrm1101.XAQuery1ReceiveData(ASender: TObject;
  const szTrCode: WideString);
begin
    sgResult.Cells[0, 0] := 'ItemName';
    sgResult.Cells[1, 0] := 'ItemValue';

    SetData ( 0, 'hname' );
    SetData ( 1, 'price'  );
    SetData ( 2, 'sign'  );
    SetData ( 3, 'change'  );
    SetData ( 4, 'diff'  );
    SetData ( 5, 'volume'  );
    SetData ( 6, 'jnilclose'  );

    SetData ( 7, 'offerho1'  );
    SetData ( 8, 'bidho1'  );
    SetData ( 9, 'offerrem1'  );
    SetData ( 10, 'bidrem1'  );
    SetData ( 11, 'preoffercha1'  );
    SetData ( 12, 'prebidcha1'  );

    SetData ( 13, 'offerho2'  );
    SetData ( 14, 'bidho2'  );
    SetData ( 15, 'offerrem2'  );
    SetData ( 16, 'bidrem2'  );
    SetData ( 17, 'preoffercha2'  );
    SetData ( 18, 'prebidcha2'  );

    SetData ( 19, 'offerho3'  );
    SetData ( 20, 'bidho3'  );
    SetData ( 21, 'offerrem3'  );
    SetData ( 22, 'bidrem3'  );
    SetData ( 23, 'preoffercha3'  );
    SetData ( 24, 'prebidcha3'  );

    SetData ( 25, 'offerho4'  );
    SetData ( 26, 'bidho4'  );
    SetData ( 27, 'offerrem4'  );
    SetData ( 28, 'bidrem4'  );
    SetData ( 29, 'preoffercha4'  );
    SetData ( 30, 'prebidcha4'  );

    SetData ( 31, 'offerho5'  );
    SetData ( 32, 'bidho5'  );
    SetData ( 33, 'offerrem5'  );
    SetData ( 34, 'bidrem5'  );
    SetData ( 35, 'preoffercha5'  );
    SetData ( 36, 'prebidcha5'  );

    SetData ( 37, 'offerho6'  );
    SetData ( 38, 'bidho6'  );
    SetData ( 39, 'offerrem6'  );
    SetData ( 40, 'bidrem6'  );
    SetData ( 41, 'preoffercha6'  );
    SetData ( 42, 'prebidcha6'  );

    SetData ( 43, 'offerho7'  );
    SetData ( 44, 'bidho7'  );
    SetData ( 45, 'offerrem7'  );
    SetData ( 46, 'bidrem7'  );
    SetData ( 47, 'preoffercha7'  );
    SetData ( 48, 'prebidcha7'  );

    SetData ( 49, 'offerho8'  );
    SetData ( 50, 'bidho8'  );
    SetData ( 51, 'offerrem8'  );
    SetData ( 52, 'bidrem8'  );
    SetData ( 53, 'preoffercha8'  );
    SetData ( 54, 'prebidcha8'  );

    SetData ( 55, 'offerho9'  );
    SetData ( 56, 'bidho9'  );
    SetData ( 57, 'offerrem9'  );
    SetData ( 58, 'bidrem9'  );
    SetData ( 59, 'preoffercha9'  );
    SetData ( 60, 'prebidcha9'  );

    SetData ( 61, 'offerho10'  );
    SetData ( 62, 'bidho10'  );
    SetData ( 63, 'offerrem10'  );
    SetData ( 64, 'bidrem10'  );
    SetData ( 65, 'preoffercha10'  );
    SetData ( 66, 'prebidcha10'  );

    SetData ( 67, 'offer'  );
    SetData ( 68, 'bid'  );

    SetData ( 69, 'preoffercha'  );
    SetData ( 70, 'prebidcha'  );

    SetData ( 71, 'hotime'  );
    SetData ( 72, 'yeprice'  );
    SetData ( 73, 'yevolume'  );

    SetData ( 74, 'yesign'  );
    SetData ( 75, 'yechange'  );

    SetData ( 76, 'yediff'  );

    SetData ( 77, 'tmoffer'  );
    SetData ( 78, 'tmbid'  );

    SetData ( 79, 'ho_status'  );
    SetData ( 80, 'shcode'  );

    SetData ( 81, 'uplmtprice'  );
    SetData ( 82, 'dnlmtprice'  );

    SetData ( 83, 'open' );
    SetData ( 84, 'high' );
    SetData ( 85, 'low' );

    XAReal1.AdviseRealData;
    XAReal2.AdviseRealData;

end;

procedure Tfrm1101.XAReal1ReceiveRealData(ASender: TObject;
  const szTrCode: WideString);
begin
  Panel5.Caption := XAReal1.GetFieldData( 'OutBlock', 'hotime' );

  SetData ( 7, 'offerho1', szTrCode  );
  SetData ( 8, 'bidho1', szTrCode  );
  SetData ( 9, 'offerrem1' , szTrCode );
  SetData ( 10, 'bidrem1', szTrCode  );

  SetData ( 13, 'offerho2', szTrCode  );
  SetData ( 14, 'bidho2' , szTrCode );
  SetData ( 15, 'offerrem2', szTrCode  );
  SetData ( 16, 'bidrem2' , szTrCode );

  SetData ( 25, 'offerho3' , szTrCode );
  SetData ( 26, 'bidho3', szTrCode  );
  SetData ( 27, 'offerrem3', szTrCode  );
  SetData ( 28, 'bidrem3', szTrCode  );

  SetData ( 31, 'offerho4', szTrCode  );
  SetData ( 32, 'bidho4', szTrCode  );
  SetData ( 33, 'offerrem4', szTrCode  );
  SetData ( 34, 'bidrem4', szTrCode  );

  SetData ( 37, 'offerho5', szTrCode  );
  SetData ( 38, 'bidho5', szTrCode  );
  SetData ( 39, 'offerrem5', szTrCode  );
  SetData ( 40, 'bidrem5', szTrCode  );

  SetData ( 43, 'offerho6', szTrCode  );
  SetData ( 44, 'bidho6', szTrCode  );
  SetData ( 45, 'offerrem6' , szTrCode );
  SetData ( 46, 'bidrem6' , szTrCode );

  SetData ( 49, 'offerho7' , szTrCode );
  SetData ( 50, 'bidho7' , szTrCode );
  SetData ( 51, 'offerrem7' , szTrCode );
  SetData ( 52, 'bidrem7' , szTrCode );

  SetData ( 55, 'offerho8' , szTrCode );
  SetData ( 56, 'bidho8' , szTrCode );
  SetData ( 57, 'offerrem8' , szTrCode );
  SetData ( 58, 'bidrem8' , szTrCode );

  SetData ( 61, 'offerho9' , szTrCode );
  SetData ( 62, 'bidho9' , szTrCode );
  SetData ( 63, 'offerrem9' , szTrCode  );
  SetData ( 64, 'bidrem9' , szTrCode );

  SetData ( 67, 'offerho10' , szTrCode );
  SetData ( 68, 'bidho10' , szTrCode );
  SetData ( 69, 'offerrem10' , szTrCode );
  SetData ( 70, 'bidrem10' , szTrCode );

end;

procedure Tfrm1101.XAReal2ReceiveRealData(ASender: TObject;
  const szTrCode: WideString);
begin
  SetData ( 1, 'price', szTrCode  );
end;

procedure Tfrm1101.XAQuery1ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  pnlMessage.Caption := Trim(szMessage);
end;

end.
