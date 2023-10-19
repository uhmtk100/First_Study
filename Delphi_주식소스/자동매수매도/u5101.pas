unit u5101;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, XA_DATASETLib_TLB;

type
  Tfrm5101 = class(TForm)
    lstCode: TListBox;
    lstOrdType: TListBox;
    rgBS: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lstQty: TListBox;
    lstPrc: TListBox;
    btnQuery: TButton;
    ListBox3: TListBox;
    pnlMessage: TPanel;
    Query: TXAQuery;
    cbAccount: TComboBox;
    edtPass: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryReceiveData(ASender: TObject;
      const szTrCode: WideString);
    procedure QueryReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm5101: Tfrm5101;

implementation

uses MAIN;

{$R *.dfm}

procedure Tfrm5101.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm5101.btnQueryClick(Sender: TObject);
var
  I : Integer;
begin
  Query.SetFieldData( 't5101InBlock', 'reccnt', 0, '1' ); //레코드갯수
  Query.SetFieldData( 't5101InBlock', 'tongsingb', 0, MainForm.XASession1.GetCommMedia );  //통신매체코드
  Query.SetFieldData( 't5101InBlock', 'ordercnt', 0, IntToStr(lstCode.Count) );  //현물주문횟수
  Query.SetFieldData( 't5101InBlock', 'reccnt1', 0, '1' );  //레코드랫수

  For I := 0 to lstCode.Count - 1 do
  begin
    Query.SetFieldData( 't5101InBlock1', 'ordergb', I, IntToStr(lstCode.Count) );  //주문처리구분
    Query.SetFieldData( 't5101InBlock1', 'dummyorgordno', I, '0' );  //dummy원주문번호
    Query.SetFieldData( 't5101InBlock1', 'orgordno', I, '0' );  //원주문번호
    Query.SetFieldData( 't5101InBlock1', 'accno', I, cbAccount.Text );  //계좌번호
    Query.SetFieldData( 't5101InBlock1', 'passwd', I, edtPass.Text );  //입력비밀번호
    Query.SetFieldData( 't5101InBlock1', 'memegb', I, IntToStr(rgBS.ItemIndex) );  //매매구분
    Query.SetFieldData( 't5101InBlock1', 'expcode', I, lstCode.Items[I] );  //종목번호
    Query.SetFieldData( 't5101InBlock1', 'qty', I, lstQty.Items[I] );  //주문수량
    Query.SetFieldData( 't5101InBlock1', 'price', I, lstPrc.Items[I] );  //주문가
    Query.SetFieldData( 't5101InBlock1', 'hogagb', I, lstOrdType.Items[I] );  //호가유형코드
    Query.SetFieldData( 't5101InBlock1', 'gongtype', I, '0' );  //공매도가능여부
    Query.SetFieldData( 't5101InBlock1', 'ghogagb', I, '0' );  //공매도호가구분
    Query.SetFieldData( 't5101InBlock1', 'ordcondgb', I, '0' );  //주문조건구분
    Query.SetFieldData( 't5101InBlock1', 'pgmtype', I, '00' );  //프로그램호가유형코드
    Query.SetFieldData( 't5101InBlock1', 'operordnum', I, '0' );  //운용지시번호
    Query.SetFieldData( 't5101InBlock1', 'sincd', I, '0' );  //신용거래코드
    Query.SetFieldData( 't5101InBlock1', 'loandt', I, '0' );  //대출일
    Query.SetFieldData( 't5101InBlock1', 'flowsupgb', I, '0' );  //유동성공급자여부
    Query.SetFieldData( 't5101InBlock1', 'multiordno', I, IntToStr(I) );  //복수주문일련번호
    Query.SetFieldData( 't5101InBlock1', 'dummyordno', I, IntToStr(lstCode.Count) );  //dummy주문번호
    Query.SetFieldData( 't5101InBlock1', 'ordno', I, '0' );  //주문번호
    Query.SetFieldData( 't5101InBlock1', 'msgcode', I, 'A' );  //메세지코드
    Query.SetFieldData( 't5101InBlock1', 'msg', I, 'A' );  //메세지내용
    Query.SetFieldData( 't5101InBlock1', 'proctm', I, 'A' );  //처리시각

  end;   

  Query.Request( FALSE );
end;

procedure Tfrm5101.FormShow(Sender: TObject);
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

procedure Tfrm5101.QueryReceiveData(ASender: TObject;
  const szTrCode: WideString);
begin
  ShowMessage ( szTrCode );
end;

procedure Tfrm5101.QueryReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  pnlMessage.Caption := szMessage;
end;

end.
