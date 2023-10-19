unit Buying;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, OleCtrls,
  XA_DATASETLib_TLB, Vcl.Grids, VclTee.TeeGDIPlus, Data.DB,DateUtils, VCLTee.Series,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Data.Win.ADODB,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,ShellApi, SHDocVw,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSSQL,Math,
  FireDAC.Phys.MSSQLDef, Vcl.Mask;

type
  TfrmBuy = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel10: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    MgntrnCode: TComboBox;
    edtPrc: TEdit;
    edtQty: TEdit;
    cbOrdType: TComboBox;
    edtCode: TEdit;
    Button1: TButton;
    Button2: TButton;
    Panel8: TPanel;
    sgResult: TStringGrid;
    XAQuery2: TXAQuery;
    XAReal1: TXAReal;
    XAReal2: TXAReal;
    Button5: TButton;
    XAReal3: TXAReal;
    Button6: TButton;
    XAQuery1: TXAQuery;
    XAQuery3: TXAQuery;
    XAQuery4: TXAQuery;
    Button4: TButton;
    XAQuery5: TXAQuery;
    Button7: TButton;
    XAQuery6: TXAQuery;
    edtPass: TEdit;
    cbAccount: TComboBox;
    Label1: TLabel;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox1: TListBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button17: TButton;
    ADOQuery4: TADOQuery;
    WebBrowser1: TWebBrowser;
    IdHTTP1: TIdHTTP;
    FDConnection1: TFDConnection;
    FDQuery2: TFDQuery;
    Button14: TButton;
    OrdList: TStringGrid;
    ProfitGrid: TStringGrid;
    ListBox4: TListBox;
    ListBox6: TListBox;
    ListBox5: TListBox;
    ListBox7: TListBox;
    ListBox8: TListBox;
    ListBox9: TListBox;
    ListBox10: TListBox;
    ListBox11: TListBox;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Label11: TLabel;
    Label2: TLabel;
    ListBox12: TListBox;
    Memo2: TMemo;
    Memo1: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Button3: TButton;
    XAQuery7: TXAQuery;
    Memo8: TMemo;
    Button8: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    JangoGrid: TStringGrid;
    ListBox13: TListBox;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel11: TPanel;
    Button9: TButton;
    Panel9: TPanel;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
    procedure Button5Click(Sender: TObject);
    procedure XAQuery2ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure SetData ( ARow   : Integer; BCol : Integer; szName : WideString; szRealName : String = '' );
    procedure Button3Click(Sender: TObject);
    procedure XAQuery2ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAQuery3ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure sgResultDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgResultSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure XAQuery4ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAQuery3ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure Button4Click(Sender: TObject);
    procedure XAQuery5ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery5ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure Button7Click(Sender: TObject);
    procedure XAQuery6ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery6ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure OrdListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    function BytesToHex(aSource: TBytes): string;
    function GetBuyPrice ( OrgPrice : Integer) : integer;
    procedure ListBox2Click(Sender: TObject);


    procedure ProfitGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure AutoSizeGridColumn(Grid : TStringGrid; column : integer);
    procedure ProfitGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button14Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);

    procedure BuyStock(StockCode : string; StockPrice: string ; StockQty : string; gType :string );
    procedure BuySellint(StockCode : string; StockPrice: string ; StockQty : string; BySl : string; opt : string);
    procedure GetPrice(StockCode : string);
    procedure GetCredit(StockCode : string);
    procedure BuyCancel(StockCode : string; OrgOrdNo: string ; StockQty : string);
    procedure XAQuery7ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure Button8Click(Sender: TObject);
    procedure XAQuery7ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure Memo1DblClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuy: TfrmBuy;
   minTime, BuyRecord : integer;
   comStockTotal : longint;
   PREPRICE : integer;
   gType, DBLJONGMOK : string;
   rCnt : integer;

implementation

uses MAIN, about;

{$R *.dfm}

procedure TfrmBuy.FormShow(Sender: TObject);
var
  I : Integer;
  szAcc : WideString;
begin

  for I := 0 to MainForm.XASession1.GetAccountListCount - 1 do
  begin
    szAcc := MainForm.XASession1.GetAccountList( I );
    cbAccount.Items.Add( szAcc )
  end;

  If cbAccount.Items.Count > 0 then
    cbAccount.ItemIndex := 0;
  cbOrdType.ItemIndex := 0;

  //Memo1.Text := XAQuery1.GetResData;



  OrdList.Cells[0,0] := '주문일';
  OrdList.Cells[1,0] := '종목번호';
  OrdList.Cells[2,0] := '종목명';
  OrdList.Cells[3,0] := '주문번호';
  OrdList.Cells[4,0] := '매매구분';
  OrdList.Cells[5,0] := '주문수량';
  OrdList.Cells[6,0] := '주문가격';
  OrdList.Cells[7,0] := '주문시간';

  ////////////////////////////////////////////////////

  ProfitGrid.Cells[0,0] := '종목번호';
  ProfitGrid.Cells[1,0] := '종목명';
  ProfitGrid.Cells[2,0] := '매도가능수량';
  ProfitGrid.Cells[3,0] := '매도손익금액';
  ProfitGrid.Cells[4,0] := '손익율';
  ProfitGrid.Cells[5,0] :='현재가';
  ProfitGrid.Cells[6,0] := '평균단가';
  ProfitGrid.Cells[7,0] := '합계금액';
   //////////////////////////////////////////////////

  JangoGrid.Cells[0,0] := '주문가능금액';
  JangoGrid.Cells[1,0] := '출금가능금액';
  JangoGrid.Cells[2,0] := '거래소금액';
  JangoGrid.Cells[3,0] := '코스닥금액';
  JangoGrid.Cells[4,0] := '잔고평가금액';
  JangoGrid.Cells[5,0] := '미수금액';
  JangoGrid.Cells[6,0] := '예탁자산총액';
  JangoGrid.Cells[7,0] := '손익율';
  JangoGrid.Cells[8,0] := '투자원금';
  JangoGrid.Cells[9,0] := '투자손익금액';
  JangoGrid.Cells[10,0] := '담보부족금액';
  JangoGrid.Cells[11,0] := '예수금';
  JangoGrid.Cells[12,0] := '대용금액';
  JangoGrid.Cells[13,0] := 'D1예수금';
  JangoGrid.Cells[14,0] := 'D2예수금';
  JangoGrid.Cells[15,0] := '현금미수금액';
  JangoGrid.Cells[16,0] := '증거금률35%';
  JangoGrid.Cells[17,0] := '증거금률50%액';

  ////////////////////////////////////////////////////

  Button4Click(nil);
  Button6Click(nil);
  Button7Click(nil);
  Button17Click(nil);

end;

procedure TfrmBuy.ListBox2Click(Sender: TObject);
var
  chDate : string;
  futureDate : TDateTime;
begin
      edtCode.Text := listbox1.items[listbox2.itemindex];

      if chDate <> '----------' then begin

          Button5Click(nil);
      end;

end;



procedure TfrmBuy.Memo1DblClick(Sender: TObject);
begin

          edtCode.Text := Memo1.SelText;
          Button5Click(nil);
end;

procedure TfrmBuy.OrdListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=3) and (ARow >=1)  then begin
          Panel7.Caption := OrdList.Cells[ACol,ARow];
          edtQty.Text := OrdList.Cells[5,ARow];
          edtCode.Text :=   StringReplace(OrdList.Cells[1,ARow], 'A', '',[rfReplaceAll, rfIgnoreCase]);
      end else if (ACol=1) and (ARow >=1)  then begin
          Panel7.Caption := OrdList.Cells[ACol,ARow];
          edtQty.Text := OrdList.Cells[5,ARow];
          edtCode.Text :=   StringReplace(OrdList.Cells[1,ARow], 'A', '',[rfReplaceAll, rfIgnoreCase]);
      end;

end;





procedure TfrmBuy.ProfitGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S: string;
  SavedAlign: word;
begin
//  if ARow <> 1 then begin  // ACol is zero based
//    S := ProfitGrid.Cells[ACol, ARow]; // cell contents
//    SavedAlign := SetTextAlign(ProfitGrid.Canvas.Handle, TA_RIGHT);
//  //  ProfitGrid.Canvas.TextRect(Rect,
////      Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 2, S);
//    SetTextAlign(ProfitGrid.Canvas.Handle, SavedAlign);
//  end;

end;

procedure TfrmBuy.ProfitGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=0) and (ARow >=1)  then begin
          edtCode.Text := copy(ProfitGrid.Cells[ACol,ARow],2,6);
          edtQty.Text := ProfitGrid.Cells[3,ARow];


          Button5Click(nil);
      end;
end;




procedure TfrmBuy.Button14Click(Sender: TObject);
begin
    Button4Click(nil);

    if (edtPrc.Text <> '') and  (panel1.Caption <> '') then begin
         edtQty.Text := intTostr(strToint(StringReplace(panel1.Caption,',','', [rfReplaceAll, rfIgnoreCase])) div strToint(StringReplace(edtPrc.Text,',','', [rfReplaceAll, rfIgnoreCase])));
    end else
        showmessage('Set Buying Price~!');
end;

procedure TfrmBuy.Button17Click(Sender: TObject);
var
 sql : string;
 CCODE, DDATE, TIMEB, BUYPRICE,COMPANY :string;
 CallDay, sTime: string;
 timeMM : integer;
 StartDate, EndDate : TDate;
begin

  Screen.Cursor := crHourglass;

        StartDate := DateTimePicker1.Date;
        CallDay := FormatDateTime('YYYYMMDD', StartDate);
        sTime := formatdatetime('hhmm',now);
        timeMM :=strToint(sTime);

        MEMO1.Clear;
        MEMO2.Clear;
        MEMO3.Clear;
        MEMO4.Clear;
   //      MEMO7.Clear;

        ADOQuery3.Close;
        ADOQuery3.SQL.Clear;
  //    sql := 'SELECT A.CCODE, A.DDATE, B.COMPANY, A.TIMEB, A.ENDPRICE,A.BUYPRICE,A.NOUSE  FROM  [dbo].[MIN_TOP_DOWN]('''+ CallDay + ''',''' + sTime + ''') A INNER JOIN MAIN_COMP B ON(A.CCODE = B.CCODE) ';
        sql := 'SELECT A.CCODE, A.DDATE, B.COMPANY, A.TIMEB, A.ENDPRICE, A.BUYPRICE,A.NOUSE  FROM  MIN_TD_TEMP A INNER JOIN MAIN_COMP B ON(A.CCODE = B.CCODE)  WHERE NOUSE =0 AND OLD IS NULL AND DDATE = ''' + CallDay +''' ORDER BY TIMEA';

        ADOQuery3.SQL.Add(sql);
        ADOQuery3.Open;
        while NOT ADOQuery3.Eof  do begin
            if ADOQuery3.fieldvalues['NOUSE'] = 0  then begin

              CCODE :=ADOQuery3.fieldvalues['CCODE'];
              TIMEB :=TRIM(ADOQuery3.fieldvalues['TIMEB']);
              BUYPRICE :=ADOQuery3.fieldvalues['BUYPRICE'];
              COMPANY :=ADOQuery3.fieldvalues['COMPANY'];
              MEMO1.Lines.ADD(CCODE);
              MEMO2.Lines.ADD(COMPANY);
              MEMO3.Lines.ADD(TIMEB);
              MEMO4.Lines.ADD(BUYPRICE);

            end;

            ADOQuery3.Next;
        end;

        if (timeMM mod 10) = 4 then begin
           Button4Click(nil);
           Button9Click(nil);
        end;


  Screen.Cursor := crDefault;


end;

procedure TfrmBuy.Button1Click(Sender: TObject);
var
  i : integer;
begin
    Button17Click(nil);
    Button7Click(nil);
    for i:=0 to MEMO1.Lines.Count -1 do begin
         if MEMO1.Lines[i] <> '' then begin
             GetPrice(MEMO1.Lines[i]);
             if (i mod 10 = 0) AND (i > 1) then
                 sleep(1200);
       end;
    end;
  //  Button8Click(nil);
    Button2Click(nil);
end;

procedure TfrmBuy.Button2Click(Sender: TObject);
var
  nlist, i, nc,HHMM, OrdTime: integer;
  OrgOrdNo, OrgOrdQty,Jonmok  : string;
begin
    HHMM :=(strToint(copy(formatdatetime('hhmm',now),1,2)) - 9) * 60 + strToint(copy(formatdatetime('hhmm',now),3,2));

    nlist :=listbox8.Count;

     for i := 0 to nlist -1 do begin
         Jonmok := listbox8.Items[i];
         nc := listbox4.Items.IndexOf(Jonmok);
         OrdTime := StrToint(listbox13.Items[i]);
         if (nc < 0) AND  (HHMM >= OrdTime + 60) AND (HHMM < OrdTime + 61) then begin

             OrgOrdNo := listbox10.Items[i];
             OrgOrdQty := listbox11.Items[i];

             XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrgOrdNo', 0, OrgOrdNo  );     	// 원주문번호
             XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
             XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'InptPwd', 0,  edtPass.Text );      // 입력비밀번호
             XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'IsuNo', 0, Jonmok);        // 종목번호
             XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrdQty', 0, OrgOrdQty);            // 주문수량
             XAQuery4.Request( FALSE );
         end;
     end;

end;

procedure TfrmBuy.Button3Click(Sender: TObject);
begin
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'reccnt', 0, '1' );
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0,  edtCode.Text );      // 종목번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, edtQty.Text  );            // 주문수량
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, StringReplace(edtPrc.Text,',','', [rfReplaceAll, rfIgnoreCase]));               // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '1');       // 매매구분
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, '000' );                                     // 신용거래코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, '' );                                             // 대출일
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
  XAQuery1.Request( FALSE );
end;

procedure TfrmBuy.Button4Click(Sender: TObject);
begin
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'RecCnt', 0, '1' );     	   // 레코드갯수
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'MgmtBrnNo', 0, '0' );     	     // 관리지점번호
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'Pwd', 0, edtPass.Text );         // 비밀번호
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'BalCreTp', 0, '0'  );                // 잔고생성구분
     XAQuery5.Request( FALSE );
end;

procedure TfrmBuy.Button5Click(Sender: TObject);
begin
  XAReal1.UnadviseRealData;
//  XAReal2.UnadviseRealData;
  XAReal3.UnadviseRealData;
  XAQuery2.SetFieldData( 't1101InBlock', 'shcode', 0, edtCode.Text );
  XAQuery2.Request( FALSE );
  if Copy( cbOrdType.Text, 1, 2 ) = '82'  then begin
      XAReal1.ResFileName :='IO/H2_.res';
      XAReal3.ResFileName :='IO/HB_.res';
      XAReal1.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
      XAReal3.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
  end else begin
      XAReal1.ResFileName :='IO/H1_.res';
      XAReal3.ResFileName :='IO/HA_.res';
      XAReal1.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
//  XAReal2.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
      XAReal3.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
  end;

end;

procedure TfrmBuy.Button6Click(Sender: TObject);
var
OrderDay : string;
begin

  OrderDay := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'RecCnt', 0, '1' );     	// 계좌번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdMktCode', 0, '00' );         // 주문시장코드
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'BnsTpCode', 0, '2'  );                // 매매구분
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'IsuNo', 0,'' );                 //종목번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'ExecYn', 0,'0'  );   // 체결여부
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdDt', 0, OrderDay );                 // 주문일
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'SrtOrdNo2', 0, '0');       // 시작주문번호2
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'BkseqTpCode', 0, '1' );          // 역순구분
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdPtnCode', 0, '99' );          // 주문유형코드
  XAQuery3.Request( FALSE );

end;

procedure TfrmBuy.Button7Click(Sender: TObject);
begin
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'RecCnt', 0, '1' );   //  레코드갯수
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'Pwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'BalCreTp', 0, '0'  );                // 잔고생성구분
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'CmsnAppTpCode', 0,'1' );                 //수수료적용구분
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'D2balBaseQryTp', 0,  '0' );   // D2잔고기준조회구분
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'UprcTpCode', 0, '0' );         // 단가구분

  XAQuery6.Request( FALSE );
end;


procedure TfrmBuy.Button8Click(Sender: TObject);
var
 i : integer;
begin
     memo7.Clear;

     for i:=0 to MEMO1.Lines.Count -1 do begin
         XAQuery7.SetFieldData( 't1411InBlock', 'gubun', 0, '0' );
         XAQuery7.SetFieldData( 't1411InBlock', 'shcode', 0, MEMO1.Lines[i] );
         XAQuery7.Request( FALSE );
         sleep(1100);
     end;

end;

procedure TfrmBuy.Button9Click(Sender: TObject);
var
   sql, sDate : string;
begin
       sDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);
       ADOQuery1.Close;
       ADOQuery1.SQL.Clear;
       sql := 'SELECT ROUND(DAYGAP * 0.01 / nullif(((ENDPRICE - DAYGAP)*0.01),0) * 100,2) AS BUYSTOCK,  ROUND((LOWPRICE - DAY20) * 0.01 / nullif(((DAY20)*0.01),0) * 100,2) AS STOPBUY, ';
       sql := sql + ' ROUND((ENDPRICE - DAY20) * 0.01 / nullif(((DAY20)*0.01),0) * 100,2) AS DAY20RATE FROM [dbo].[DAILY_KOSP] where ccode =''996001'' AND DDATE = ''' + sDate +'''';
       ADOQuery1.SQL.Add(sql);
       ADOQuery1.Open;
       IF NOT ADOQuery1.Eof THEN
       BEGIN
           IF ADOQuery1.fieldvalues['STOPBUY'] < -1.8 THEN BEGIN
                IF ADOQuery1.fieldvalues['BUYSTOCK'] < -3.36 THEN BEGIN
                   Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
                   Panel9.Caption	:= ADOQuery1.fieldvalues['DAY20RATE'];
                   Panel9.Color	 :=clBlue;
                END ELSE BEGIN
                   Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
                   Panel9.Caption	:= ADOQuery1.fieldvalues['DAY20RATE'];
                   Panel9.Color	:=clRed;
                END;
           END ELSE IF ADOQuery1.fieldvalues['STOPBUY'] < 0 THEN BEGIN
                Panel9.Color :=clWebperu;
                Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
           END ELSE BEGIN
                Panel9.Color :=clGreen;
                Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
           END;
       end;

end;

procedure TfrmBuy.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin

       LISTBOX1.Clear;
       LISTBOX2.Clear;
       listbox3.Clear;

       FDQuery2.Close;
       FDQuery2.SQL.Clear;
       sql := 'SELECT COMPANY, CCODE FROM MAIN_COMP WHERE COMPANY like ''%' + edit2.Text + '%''';
       FDQuery2.SQL.Add(sql);
       FDQuery2.Open;
       while NOT FDQuery2.Eof  do begin
           LISTBOX1.Items.Add(TRIM(FDQuery2.fieldvalues['CCODE']));
           LISTBOX2.Items.Add(TRIM(FDQuery2.fieldvalues['COMPANY']));
        //   LISTBOX3.Items.Add());
           FDQuery2.Next;
       end;
   end;
end;

procedure TfrmBuy.edtCodeKeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin
       Button5Click(nil);
   end;

end;

procedure TfrmBuy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrmBuy.FormCreate(Sender: TObject);
var
   con_string1 :string;
begin
 DateTimePicker1.DateTime :=now;

 ListBox2.Style := lbOwnerDrawFixed;
 //con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
 //con_string := con_string + 'localhost ;Use Encryption for Data=False;Tag with column collation when possible=False';


  ADOConnection1.ConnectionString := con_string;



end;


procedure TfrmBuy.XAQuery1ReceiveMessage(ASender: TObject;  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
    Panel8.Caption := Trim(szMessage)+ 'XAQuery1';
end;


procedure TfrmBuy.XAQuery2ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  indexNum1,indexNum2, indexOrd,indexNotOrd,idxCancel, BuyedPrice, Secondindex: integer;
  Junil, Offerho1, Offerho2, BuyPrice, Price, myStock, OpenPrice,HighPrice,LowPrice,timeMM,BuyQty, BuyedQty, BuyTime : integer;
  UPdown, cKDAC, wKDAC : Double;
  StockCode,Buyed, OrgOrdNo : string;
begin
  TRY
        edit2.Text := XAQuery2.GetFieldData( 't1101OutBlock', 'hname', 0 );
        if edit2.Text ='' then begin
          memo8.Lines.Add( FormatDateTime('hh:mm:ss', now));
          exit;
        end;

        SetData ( 1,23, 'hotime', szTrCode );


        SetData ( 0, 0, 'jnilclose' );
        SetData ( 0,1, 'price'  );


     //   SetData (1,1, 'change'  );     //xx
     //   SetData (1,2, 'jnilclose'  );  //xx

        SetData ( 0,2, 'diff'  );
        SetData ( 0,3, 'volume'  );


        SetData ( 11,1, 'offerho1'  );
        SetData ( 10,1, 'offerho2'  );
        SetData ( 9,1, 'offerho3'  );
        SetData ( 8,1, 'offerho4'  );
        SetData ( 7,1, 'offerho5'  );
        SetData ( 6,1, 'offerho6'  );
        SetData ( 5,1, 'offerho7'  );
        SetData ( 4,1, 'offerho8'  );
        SetData ( 3,1, 'offerho9'  );
        SetData ( 2,1, 'offerho10'  );

        SetData ( 11,0,'offerrem1'  );
        SetData ( 10,0, 'offerrem2'  );
        SetData ( 9,0, 'offerrem3'  );
        SetData ( 8,0, 'offerrem4'  );
        SetData ( 7,0, 'offerrem5'  );
        SetData ( 6,0, 'offerrem6'  );
        SetData ( 5,0, 'offerrem7'  );
        SetData ( 4,0, 'offerrem8'  );
        SetData ( 3,0, 'offerrem9'  );
        SetData ( 2,0, 'offerrem10'  );

        SetData ( 12,1, 'bidho1'  );
        SetData ( 13,1, 'bidho2'  );
        SetData ( 14,1, 'bidho3'  );
        SetData ( 15,1, 'bidho4'  );
        SetData ( 16,1, 'bidho5'  );
        SetData ( 17,1, 'bidho6'  );
        SetData ( 18,1, 'bidho7'  );
        SetData ( 19,1, 'bidho8'  );
        SetData ( 20,1, 'bidho9'  );
        SetData ( 21,1, 'bidho10' );

        SetData ( 12,3, 'bidrem1'  );
        SetData ( 13,3, 'bidrem2'  );
        SetData ( 14,3, 'bidrem3'  );
        SetData ( 15,3, 'bidrem4'  );
        SetData ( 16,3, 'bidrem5'  );
        SetData ( 17,3, 'bidrem6'  );
        SetData ( 18,3, 'bidrem7'  );
        SetData ( 19,3, 'bidrem8'  );
        SetData ( 20,3, 'bidrem9'  );
        SetData ( 21,3, 'bidrem10' );

        SetData ( 23,0, 'offer'  );
        SetData ( 23,3, 'bid'  );

        Junil := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'jnilclose', 0 ));
        Price := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'price', 0 ));
        Offerho1 := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'offerho1', 0 ));
        Offerho2 := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'offerho2', 0 ));
        StockCode := XAQuery2.GetFieldData( 't1101OutBlock', 'shcode', 0 );
        OpenPrice := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'open', 0 ));
        HighPrice := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'high', 0 ));
        LowPrice := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'low', 0 ));

        edit4.Text :=  formatfloat('0.##%', (LowPrice - junil) * 100/junil);
        edit5.Text :=  formatfloat('0.##%', (HighPrice- junil) * 100/junil);

        indexNum1 := ListBox4.Items.IndexOf(StockCode);

        cKDAC := strTofloat(Panel11.Caption);
        wKDAC := strTofloat(Panel9.Caption);

        if (cKDAC < 0) AND (wKDAC < -1.8)  then begin
           exit;
        end else if (cKDAC >= 0) AND (wKDAC < -1.8) then begin BuyTime := 1300;
        end else if (cKDAC >= 2) AND (wKDAC < -1.8) then begin BuyTime := 1400;
        end else BuyTime := 1500;

        indexNotOrd := MEMO5.Lines.IndexOf(StockCode);

        indexOrd := MEMO1.Lines.IndexOf(StockCode);
        if indexOrd < 0 then   exit;

        BuyPrice := strToint(MEMO4.Lines[indexOrd]);

        timeMM :=strToint(formatdatetime('hhmm',now));


        if indexNum1 >= 0 then begin
           Buyed := ListBox6.Items[indexNum1];
           BuyedQty := strToint(ListBox7.Items[indexNum1]);
           BuyedPrice := strtoint(stringReplace(Buyed,'@','',[rfReplaceAll, rfIgnoreCase]));
        end;

        gType :='000';
        if checkbox2.Checked then
            BuyQty := (Floor(StrtoInt(edit1.Text) / 3)) div Price
        else
            BuyQty := (Floor(StrtoInt(edit1.Text))) div Price;

        if (timeMM > 900) AND (timeMM <= BuyTime) AND ((Price - Junil) * 100 / Junil > 0) AND (Price >= 1500) then  begin
                  indexNum2 := ListBox8.Items.IndexOf(StockCode);

                  if (indexNum1 < 0 ) AND (indexOrd >= 0) and (indexNotOrd < 0) AND (indexNum2 < 0) AND ((Price - Junil) * 100 / Junil > 0) AND (StockCode <> DBLJONGMOK) then begin

                      if (Price - BuyPrice) * 100 / Junil < 0.5 then begin
                          BuyPrice := GetBuyPrice(BuyPrice);
                          if Price < BuyPrice then begin
                             BuyStock(StockCode, intTostr(Price), intTostr(BuyQty), gType);
                             BuySellint(StockCode, intTostr(Price), inttostr(BuyQty), '0','1');
                          end else begin
                             BuyStock(StockCode, intTostr(BuyPrice), intTostr(BuyQty), gType);
                             BuySellint(StockCode, intTostr(BuyPrice), inttostr(BuyQty), '0','2');
                          end;

                          DBLJONGMOK :=  StockCode;
                          MEMO5.Lines.Add(StockCode);
                          MEMO6.Lines.Add(intTostr(BuyPrice));
                          Button6Click(nil);
                          Button7Click(nil);
                          Button4Click(nil);
                      end;
                  end else if (indexNum1 >= 0)  AND ((Price - Junil) * 100 / Junil > 0) AND ((Price - BuyedPrice) * 100 / Junil <= -4) AND (copy(Buyed,1,1) = '@') AND (BuyedQty < BuyQty * 1.2) AND (BuyedQty <> 0)  then begin               //    AND (StockCode <> DBLJONGMOK)
                       Secondindex := MEMO5.Lines.IndexOf(StockCode+'X');
                       if Secondindex < 0 then begin
                          if (indexNum2 >=0) then
                              Buyprice := BuyedPrice;
                          BuyPrice := BuyPrice - floor(Junil * 0.04);
                          BuyPrice := GetBuyPrice(BuyPrice);

                          if Price < BuyPrice then  begin
                             BuyStock(StockCode, intTostr(Price), intTostr(BuyQty), gType);
                             BuySellint(StockCode, intTostr(Price), inttostr(BuyQty), '0','3');
                          end else begin
                             BuyStock(StockCode, intTostr(BuyPrice), intTostr(BuyQty), gType);
                             BuySellint(StockCode, intTostr(BuyPrice), inttostr(BuyQty), '0','4');
                          end;

                          DBLJONGMOK := '';
                          MEMO5.Lines.Add(StockCode+'X');
                          MEMO6.Lines.Add(intTostr(BuyPrice));
                          Button6Click(nil);
                          Button7Click(nil);
                          Button4Click(nil);
                       end;
                  end;


        end;

        if (timeMM > 900) AND (timeMM <= 1520) AND (Price >= 1500) AND (copy(Buyed,1,1) = '@') then  begin
                  indexNum2 := ListBox8.Items.IndexOf(StockCode);

                  if (indexNum1 >= 0)  AND ((Price - Junil) * 100 / Junil > -1) AND ((Price - BuyedPrice) * 100 / Junil <= -6) AND (BuyedQty < BuyQty * 2.1)  then begin    //AND (copy(Buyed,1,1) = '@')            //   AND (StockCode <> DBLJONGMOK)
                       Secondindex := MEMO5.Lines.IndexOf(StockCode+'XX');
                       if Secondindex < 0 then begin
                          if (indexNum2 >=0) then
                              Buyprice := BuyedPrice;
                          BuyPrice := BuyPrice - floor(Junil * 0.06);
                          BuyPrice := GetBuyPrice(BuyPrice);

                          if Price < BuyPrice then  begin
                              BuyStock(StockCode, intTostr(Price), intTostr(BuyQty), gType);
                              BuySellint(StockCode, intTostr(Price), inttostr(BuyQty), '0','5');
                              MEMO6.Lines.Add(intTostr(Price) );
                          end else begin
                              BuyStock(StockCode, intTostr(BuyPrice), intTostr(BuyQty), gType);
                              BuySellint(StockCode, intTostr(BuyPrice), inttostr(BuyQty), '0','6');
                              MEMO6.Lines.Add(intTostr(BuyPrice) );
                          end;

                          DBLJONGMOK := StockCode;
                          MEMO5.Lines.Add(StockCode+'XX');

                          Button6Click(nil);
                          Button7Click(nil);
                          Button4Click(nil);
                       end;

                  end else if (indexNum1 >= 0)  AND ((Price - Junil) * 100 / Junil < -8.2) AND ((Price - BuyedPrice) * 100 / Junil <= -10) AND (BuyedQty < BuyQty * 2.4)  then begin               // AND (copy(Buyed,1,1) = '@')   AND (StockCode <> DBLJONGMOK)
                       Secondindex := MEMO5.Lines.IndexOf(StockCode+'XXX');
                       if Secondindex < 0 then begin
                          if (indexNum2 >=0) then
                              Buyprice := BuyedPrice;
                          BuyPrice := BuyPrice - floor(Junil * 0.06);
                          BuyPrice := GetBuyPrice(BuyPrice);

                          if Price < BuyPrice then  begin
                              BuyStock(StockCode, intTostr(Price), intTostr(BuyQty), gType);
                              BuySellint(StockCode, intTostr(Price), inttostr(BuyQty), '0','7');
                              MEMO6.Lines.Add(intTostr(Price) );
                          end else begin
                              BuyStock(StockCode, intTostr(BuyPrice), intTostr(BuyQty), gType);
                              BuySellint(StockCode, intTostr(BuyPrice), inttostr(BuyQty), '0','8');
                              MEMO6.Lines.Add(intTostr(BuyPrice) );
                          end;

                          DBLJONGMOK := StockCode;
                          MEMO5.Lines.Add(StockCode+'XXX');

                          Button6Click(nil);
                          Button7Click(nil);
                          Button4Click(nil);
                       end;

                  end;
        end;

  except
    on E: Exception do begin
         OutputDebugString(PWideChar('..., Error message is ' + E.Message));
    end;
  END;
end;

procedure TfrmBuy.XAQuery2ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
    Panel8.Caption := Trim(szMessage)+ 'XAQuery2';
end;

procedure TfrmBuy.XAQuery3ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  I, J, x,y : Integer;
  nRecordCount : Integer;
  OrdCnl, OrdCnlCode, jonmok,jumunNm, Masu, OrdReady : string;

begin
     ListBox8.Clear;
     ListBox9.Clear;
     ListBox10.Clear;
     ListBox11.Clear;
     ListBox13.Clear;

     nRecordCount := XAQuery3.GetBlockCount( 'CSPAQ13700OutBlock3' );
     for x := 1 to nRecordCount -1 do begin
         for y := 0 to OrdList.ColCount -1  do begin
             OrdList.Cells[y,x] :='';
         end;
     end;

     J:=1;
     for I := 1 to nRecordCount  do begin
           // OrdCnl := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdPtnNm', I-1 );
           jonmok := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 );
          // if (XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'BnsTpNm', I-1 ) ='매수') AND (XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'ExecQty', I-1 ) <> '0' )  AND (jonmok <> '') then begin      //AND (OrdCnl <> '취소완료')

               OrdList.Cells[0,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdDt', I-1 ); // '주문일';
               OrdList.Cells[1,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNo', I-1 ); // '종목번호';
               OrdList.Cells[2,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 ); // '종목명';
               OrdList.Cells[3,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdNo', I-1 ); // '주문번호';    BnsTpNm
               OrdList.Cells[4,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'BnsTpNm', I-1 ); // '매매구분';
               OrdList.Cells[5,I] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdQty', I-1 ))); // '주문수량';
               OrdList.Cells[6,I] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdPrc', I-1 ))); // '주문가격';
               OrdList.Cells[7,I] := COPY(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdTime', I-1 ),1,4); // '주문시간';
               J :=J+1;
     end;     //  end;// else begin

         
     for x := I-1 downto  1 do  begin
           if OrdList.Cells[1,x] <> ''  then begin
             Listbox8.Items.Add(StringReplace(OrdList.Cells[1,x],'A','', [rfReplaceAll, rfIgnoreCase]));
             Listbox9.Items.Add(OrdList.Cells[2,x]);
             Listbox10.Items.Add(OrdList.Cells[3,x]);
             Listbox11.Items.Add(OrdList.Cells[5,x]);
             Listbox13.Items.Add(inttostr((strToint(copy(OrdList.Cells[7,x],1,2)) - 9) * 60 + strToint(copy(OrdList.Cells[7,x],3,2))));
           end;
     end;

     AutoSizeGridColumn(OrdList, 7);
end;

procedure TfrmBuy.XAQuery3ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
       Panel8.Caption := Trim(szMessage)+ 'XAQuery3';
end;



procedure TfrmBuy.XAQuery4ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
   Panel8.Caption := Trim(szMessage)+ 'XAQuery4';

end;

procedure TfrmBuy.XAQuery5ReceiveData(ASender: TObject;
  const szTrCode: WideString);
begin
     JangoGrid.Cells[0,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyOrdAbleAmt', 0 ))); // '현금주문가능금액';
     edit1.Text :=XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyOrdAbleAmt', 0 );
     JangoGrid.Cells[1,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyoutAbleAmt', 0 ))); // '출금가능금액';
     JangoGrid.Cells[2,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'SeOrdAbleAmt', 0 ))); // '거래소금액';
     JangoGrid.Cells[3,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'KdqOrdAbleAmt', 0 ))); // '코스닥금액';
     JangoGrid.Cells[4,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'BalEvalAmt', 0 ))); // '잔고평가금액';
     JangoGrid.Cells[5,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'RcvblAmt', 0 ))); // '미수금액';
     JangoGrid.Cells[6,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'DpsastTotamt', 0 ))); // '예탁자산총액';

     JangoGrid.Cells[7,1] := formatfloat('0.##%', strTofloat(XAQuery5.GetFieldData( 'CSPAQ12200OutBlock2', 'PnlRat', 0 ))); // '손익율';
     JangoGrid.Cells[8,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'InvstOrgAmt', 0 ))); // '투자원금';
     JangoGrid.Cells[9,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'InvstPlAmt', 0 ))); // '투자손익금액';
     JangoGrid.Cells[10,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'PdlckAmt', 0 ))); // '담보부족금액';
     JangoGrid.Cells[11,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'Dps', 0 ))); // '예수금';
     JangoGrid.Cells[12,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'SubstAmt', 0 ))); // '대용금액';
     JangoGrid.Cells[13,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'D1Dps', 0 ))); // 'D1예수금';
     JangoGrid.Cells[14,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'D2Dps', 0 ))); // 'D2예수금';
     JangoGrid.Cells[15,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyrclAmt', 0 ))); // '현금미수금액';
     JangoGrid.Cells[16,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MgnRat35ordAbleAmt', 0 ))); // 'D2예수금';
     JangoGrid.Cells[17,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MgnRat50ordAbleAmt', 0 ))); // '현금미수금액';
     if trim(MgntrnCode.Text) = '001.유통융자신규' then
        panel1.Caption := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'CrdtOrdAbleAmt', 0 )))
     else
        panel1.Caption := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyOrdAbleAmt', 0 )));

     AutoSizeGridColumn(JangoGrid, 3);
end;

procedure TfrmBuy.XAQuery5ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
   Panel8.Caption := Trim(szMessage)+ 'XAQuery5';
end;

procedure TfrmBuy.XAQuery6ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
 nRecordCount, I, J,nRow : integer;
 sumAmt : double;
begin
     ListBox4.Clear;
     ListBox5.Clear;
     ListBox6.Clear;
     ListBox7.Clear;

     nRecordCount := XAQuery6.GetBlockCount ( 'CSPAQ12300OutBlock3' );
     ProfitGrid.RowCount := nRecordCount + 1;
     for nRow := 1 to nRecordCount - 1 do
          ProfitGrid.Rows[nRow].Clear;
     J:=1;
     for I := 1 to nRecordCount  do begin

            if  strtoFloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BuyPrc', I-1)) > 0 then begin     //strtoFloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)) > 0
               //(XAQuery6.GetFieldData('CSPAQ12300OutBlock3', 'CrdayBuyExecQty', I-1 ) <> '0' ) OR (XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1) <> '0')  THEN BEGIN
              if (XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellPnlAmt', I-1) <> '0') then begin
                 ProfitGrid.Cells[0,J] := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNo', I-1 );     //'종목번호';
                 ProfitGrid.Cells[1,J] := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNm', I-1 );     //'종목명';
                 ProfitGrid.Cells[2,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)));     //'매도가능수량';
                 ProfitGrid.Cells[3,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellPnlAmt', I-1)));     //'매도손익금액';
                 ProfitGrid.Cells[4,J] := formatfloat('0.##%', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'PnlRat', I-1 )) * 100 );     //'손익율';
                 ProfitGrid.Cells[5,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'NowPrc', I-1)));    //'현재가';
                 ProfitGrid.Cells[6,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 )));     //'평균단가';
                 sumAmt := strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 )) * strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)) ;
                 ProfitGrid.Cells[7,J] := formatfloat('#0,', sumAmt);

                 J:=J+1;
              end;
            end;

            if (XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdayBuyExecQty', I-1) <> '0') AND (XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BuyPrc', I-1) <> '0') then begin

              ListBox4.Items.Add(StringReplace(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNo', I-1),'A','', [rfReplaceAll, rfIgnoreCase]));
              ListBox5.Items.Add(StringReplace(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNm', I-1 ),'A','', [rfReplaceAll, rfIgnoreCase]));
              ListBox7.Items.Add(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1));
              if StrToint(XAQuery6.GetFieldData('CSPAQ12300OutBlock3', 'CrdayBuyExecQty', I-1 )) > 0  then
                   ListBox6.Items.Add(formatfloat('@#0', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 ))))
              else ListBox6.Items.Add(formatfloat('#0', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 ))));

            end;

     end;
     BuyRecord := J - 1;
     AutoSizeGridColumn(ProfitGrid, 7);
end;

procedure TfrmBuy.XAQuery6ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
     Panel8.Caption := Trim(szMessage)+ 'XAQuery6';
end;



procedure TfrmBuy.XAQuery7ReceiveData(ASender: TObject; const szTrCode: WideString);
begin

   //   memo8.Lines.Add(XAQuery7.GetFieldData('t1411OutBlock', 'shcode', 0 )); // '현금주문가능금액';
  //    memo8.Lines.Add(XAQuery7.GetFieldData('t1411OutBlock1', 'hname', 0 )); // 'D2예수금';
      memo7.Lines.Add(formatfloat('#0,', strTofloat(XAQuery7.GetFieldData('t1411OutBlock', 'jkrate', 0 )))); // '위탁증거금율';
   //   memo8.Lines.Add(formatfloat('#0,', strTofloat(XAQuery7.GetFieldData('t1411OutBlock', 'sjkrate', 0 )))); // '신용증거금율';
  //    memo8.Lines.Add(formatfloat('#0,', strTofloat(XAQuery7.GetFieldData('t1411OutBlock1', 'price', 0)))); // '현재가';
  //    memo8.Lines.Add(formatfloat('#0,', strTofloat(XAQuery7.GetFieldData('t1411OutBlock', 'price', 0)))); // '현재가';

end;

procedure TfrmBuy.XAQuery7ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
  Panel8.Caption := Trim(szMessage)+ 'XAQuery7';
end;

procedure TfrmBuy.SetData ( ARow   : Integer; BCol : Integer; szName : WideString; szRealName : String );
var
  firstCol : Widestring;
  Data : double;
  jnilclose : double;
begin
  Data := strTofloat(XAQuery2.GetFieldData( 't1101OutBlock', szName, 0 ));

  if (ARow = 0) and (BCol mod 2 = 0) then
      sgResult.Cells[BCol, ARow ] := XAQuery2.GetFieldData( 't1101OutBlock', szName, 0 )
  else if BCol=1 then begin
     jnilclose := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'jnilclose', 0 ));
     sgResult.Cells[BCol, ARow ] := formatfloat('#0,',Data);
     sgResult.Cells[BCol+1, ARow ] := formatfloat('0.##',(Data - jnilclose)*100/jnilclose)+'%';
  end else
     sgResult.Cells[BCol, ARow ] := formatfloat('#0,',Data);
end;


procedure TfrmBuy.sgResultDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  //  if ((1 <= ACol) and (ACol <= 2)) and ((1 <= ARow) and  (ARow <=12))then begin
 //          sgResult.Canvas.Font.Color := clRed;
 //          sgResult.Canvas.TextOut(Rect.Left, Rect.Top, sgResult.Cells[ACol,ARow]) ;
 //   end;

end;

procedure TfrmBuy.sgResultSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=1) and ((ARow >=1) and (ARow <=22)) then
          edtPrc.Text := sgResult.Cells[ACol,ARow];
end;



function TfrmBuy.BytesToHex(aSource: TBytes): string;
var
   strHex : string;
   strHexDec :  string;
   i : integer;
begin
   SetLength(strHex, Length(aSource) * 2);
   if Length(aSource) > 0 then
      BinToHex(aSource[0], PChar(strHex), Length(aSource));
   for i := 4 downto 1 do begin
       strHexDec :=strHexDec + strHex[2*i-1];
       strHexDec :=strHexDec +  strHex[2*i]
   end;
   result := intTostr(strToInt('$' + strHexDec));
end;



procedure TfrmBuy.CheckBox1Click(Sender: TObject);
begin
    if checkbox1.Checked  then
       timer1.Enabled :=false
    else
       timer1.Enabled :=true;
end;

procedure TfrmBuy.ComboBox1Change(Sender: TObject);
begin
  Button6Click(nil);
end;



procedure TfrmBuy.AutoSizeGridColumn(Grid : TStringGrid; column : integer);
var
i,j : integer;
temp : integer;
max : integer;
begin

  for i := 0 to Column -1 do begin
    max :=0;
    for j := 0 to (Grid.RowCount-1) do begin
        temp := Grid.Canvas.TextWidth(grid.cells[i, j]);
        if temp > max then
           max := temp;
    end;
    Grid.ColWidths[i] := max + Grid.GridLineWidth + 10;

  end;
end;


procedure TfrmBuy.BuyStock(StockCode : string; StockPrice: string ; StockQty : string ; gType :string);
begin
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0, StockCode );      // 종목번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, StockQty  );            // 주문수량
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, StockPrice);         // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '2');       // 매매구분
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, gType );                                     // 신용거래코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, '' );                                             // 대출일
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
  XAQuery1.Request( FALSE );
end;

procedure TfrmBuy.GetPrice(StockCode : string);
begin
     XAQuery2.SetFieldData( 't1101InBlock', 'shcode', 0, StockCode );
     XAQuery2.Request( FALSE );
end;

procedure TfrmBuy.GetCredit(StockCode : string);        //신용가능여부
begin
     XAQuery7.SetFieldData( 't1411InBlock', 'gubun', 0, '0' );
     XAQuery7.SetFieldData( 't1411InBlock', 'shcode', 0, StockCode );
     XAQuery7.Request( FALSE );
end;

procedure TfrmBuy.BuyCancel(StockCode : string; OrgOrdNo: string ; StockQty : string);
begin

     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrgOrdNo', 0, OrgOrdNo  );     	// 원주문번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'InptPwd', 0,  edtPass.Text );      // 입력비밀번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'IsuNo', 0, StockCode);        // 종목번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrdQty', 0, StockQty);            // 주문수량
     XAQuery4.Request( FALSE );

end;


function TfrmBuy.GetBuyPrice ( OrgPrice : Integer) : integer;
var
   UUprice : integer;
   UUx, DDx : string;
   maxPrice,Loc : integer;
   i,j : integer;
begin

   i:=0; UUx:='0'; UUprice:=0; maxPrice:=0;



       if OrgPrice > 500000 then begin
            maxPrice := floor(OrgPrice ) - floor(OrgPrice) mod 1000;
         //   UUprice := maxPrice;
       end else if OrgPrice > 100000 then begin
            maxPrice := floor(OrgPrice) - floor(OrgPrice) mod 500;
         //   UUprice := maxPrice;
       end else if OrgPrice > 50000 then begin
            maxPrice := floor(OrgPrice) - floor(OrgPrice) mod 100;
         //   UUprice := maxPrice ;
       end else if OrgPrice > 10000 then begin
            maxPrice := floor(OrgPrice) - floor(OrgPrice) mod 50;
        //    UUprice := maxPrice -  50;
       end else if OrgPrice > 5000 then begin
            maxPrice := floor(OrgPrice) - floor(OrgPrice) mod 10;
         //   UUprice := maxPrice - 10;
       end else if OrgPrice > 1000 then begin
            maxPrice := floor(OrgPrice) - floor(OrgPrice ) mod 5;
         //   UUprice := maxPrice - 5;
       end else begin
            maxPrice := floor(OrgPrice) - floor(OrgPrice);
         //   UUprice := maxPrice  ;
       end;

       result := maxPrice;
end;

procedure TfrmBuy.BuySellint(StockCode : string; StockPrice: string ; StockQty : string; BySl : string; opt : string);
var
   iSql : string;
   iDate : string;
begin
        iDate := FormatDateTime('YYYYMMDD',now);
    //    iDate := FormatDateTime('YYYYMMDDhhmmss',now);

        ADOQuery2.close;
        ADOQuery2.sql.Clear;
        iSql := 'INSERT INTO BUYSELL(DDATE, CCODE, BUYPRICE, BUYQTY, BUYSELL, OPT, BUYTIME) ';
        iSql := iSql + ' Values(''' + iDate + ''',''' + StockCode + ''',' + StockPrice + ','+ StockQty +','+ BySl +',' + opt +',GETUTCDATE())';
        ADOQuery2.sql.add(iSql);
        ADOQuery2.ExecSQL;
end;

end.
