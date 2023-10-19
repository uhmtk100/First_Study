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
  Query.SetFieldData( 't5101InBlock', 'reccnt', 0, '1' ); //���ڵ尹��
  Query.SetFieldData( 't5101InBlock', 'tongsingb', 0, MainForm.XASession1.GetCommMedia );  //��Ÿ�ü�ڵ�
  Query.SetFieldData( 't5101InBlock', 'ordercnt', 0, IntToStr(lstCode.Count) );  //�����ֹ�Ƚ��
  Query.SetFieldData( 't5101InBlock', 'reccnt1', 0, '1' );  //���ڵ巧��

  For I := 0 to lstCode.Count - 1 do
  begin
    Query.SetFieldData( 't5101InBlock1', 'ordergb', I, IntToStr(lstCode.Count) );  //�ֹ�ó������
    Query.SetFieldData( 't5101InBlock1', 'dummyorgordno', I, '0' );  //dummy���ֹ���ȣ
    Query.SetFieldData( 't5101InBlock1', 'orgordno', I, '0' );  //���ֹ���ȣ
    Query.SetFieldData( 't5101InBlock1', 'accno', I, cbAccount.Text );  //���¹�ȣ
    Query.SetFieldData( 't5101InBlock1', 'passwd', I, edtPass.Text );  //�Էº�й�ȣ
    Query.SetFieldData( 't5101InBlock1', 'memegb', I, IntToStr(rgBS.ItemIndex) );  //�Ÿű���
    Query.SetFieldData( 't5101InBlock1', 'expcode', I, lstCode.Items[I] );  //�����ȣ
    Query.SetFieldData( 't5101InBlock1', 'qty', I, lstQty.Items[I] );  //�ֹ�����
    Query.SetFieldData( 't5101InBlock1', 'price', I, lstPrc.Items[I] );  //�ֹ���
    Query.SetFieldData( 't5101InBlock1', 'hogagb', I, lstOrdType.Items[I] );  //ȣ�������ڵ�
    Query.SetFieldData( 't5101InBlock1', 'gongtype', I, '0' );  //���ŵ����ɿ���
    Query.SetFieldData( 't5101InBlock1', 'ghogagb', I, '0' );  //���ŵ�ȣ������
    Query.SetFieldData( 't5101InBlock1', 'ordcondgb', I, '0' );  //�ֹ����Ǳ���
    Query.SetFieldData( 't5101InBlock1', 'pgmtype', I, '00' );  //���α׷�ȣ�������ڵ�
    Query.SetFieldData( 't5101InBlock1', 'operordnum', I, '0' );  //������ù�ȣ
    Query.SetFieldData( 't5101InBlock1', 'sincd', I, '0' );  //�ſ�ŷ��ڵ�
    Query.SetFieldData( 't5101InBlock1', 'loandt', I, '0' );  //������
    Query.SetFieldData( 't5101InBlock1', 'flowsupgb', I, '0' );  //�����������ڿ���
    Query.SetFieldData( 't5101InBlock1', 'multiordno', I, IntToStr(I) );  //�����ֹ��Ϸù�ȣ
    Query.SetFieldData( 't5101InBlock1', 'dummyordno', I, IntToStr(lstCode.Count) );  //dummy�ֹ���ȣ
    Query.SetFieldData( 't5101InBlock1', 'ordno', I, '0' );  //�ֹ���ȣ
    Query.SetFieldData( 't5101InBlock1', 'msgcode', I, 'A' );  //�޼����ڵ�
    Query.SetFieldData( 't5101InBlock1', 'msg', I, 'A' );  //�޼�������
    Query.SetFieldData( 't5101InBlock1', 'proctm', I, 'A' );  //ó���ð�

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
