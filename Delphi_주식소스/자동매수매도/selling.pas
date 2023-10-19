unit selling;

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
  FireDAC.Phys.MSSQLDef;

type
  TfrmSell = class(TForm)
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
    Button3: TButton;
    Button2: TButton;
    Panel8: TPanel;
    sgResult: TStringGrid;
    XAQuery2: TXAQuery;
    XAReal1: TXAReal;
    XAReal2: TXAReal;
    Button5: TButton;
    XAReal3: TXAReal;
    XAQuery1: TXAQuery;
    XAQuery3: TXAQuery;
    XAQuery4: TXAQuery;
    XAQuery5: TXAQuery;
    ProfitGrid: TStringGrid;
    Button7: TButton;
    XAQuery6: TXAQuery;
    edtPass: TEdit;
    cbAccount: TComboBox;
    Label1: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    Edit15: TEdit;
    ADOQuery4: TADOQuery;
    WebBrowser1: TWebBrowser;
    IdHTTP1: TIdHTTP;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Panel9: TPanel;
    Edit6: TEdit;
    FDConnection1: TFDConnection;
    FDQuery2: TFDQuery;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    Timer1: TTimer;
    OrdList: TStringGrid;
    Button6: TButton;
    ListBox1: TListBox;
    ListBox3: TListBox;
    ListBox2: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    ListBox7: TListBox;
    ListBox8: TListBox;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Label11: TLabel;
    Memo1: TMemo;
    NONE: TButton;
    ListBox10: TListBox;
    Label12: TLabel;
    ListBox9: TListBox;
    ListBox11: TListBox;
    ListBox12: TListBox;
    ListBox13: TListBox;
    Memo2: TMemo;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ListBox14: TListBox;
    Button4: TButton;
    Panel1: TPanel;
    Panel11: TPanel;
    procedure FormShow(Sender: TObject);
    procedure NONEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
    procedure Button5Click(Sender: TObject);
    procedure XAQuery2ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure SetData ( ARow   : Integer; BCol : Integer; szName : WideString; szRealName : String = '' );
    procedure XAReal2ReceiveRealData(ASender: TObject;
      const szTrCode: WideString);
    procedure Button3Click(Sender: TObject);
    procedure XAQuery2ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAQuery3ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure sgResultDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgResultSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    procedure Button2Click(Sender: TObject);

    procedure XAQuery4ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAQuery4ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery3ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure Button4Click(Sender: TObject);
    procedure XAQuery5ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure Button7Click(Sender: TObject);
    procedure XAQuery6ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery6ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);

    procedure FormCreate(Sender: TObject);
    function BytesToHex(aSource: TBytes): string;
    procedure ProfitGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AutoSizeGridColumn(Grid : TStringGrid; column : integer);
    procedure ProfitGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure SellStock(StockCode : string; StockPrice: integer ; StockQty : integer; Mgnt :string; LoanDt:string);
    procedure BuyStock(StockCode : string; StockPrice: integer ; StockQty : integer ; gType :string);
    procedure GetPrice(StockCode : string);
    procedure Button6Click(Sender: TObject);
    procedure SellCancel(StockCode : string; OrgOrdNo: string ; StockQty : string);
    procedure BuySellint(StockCode : string; StockPrice: string ; StockQty : string; BySl : string; opt : string ; gType:string);
    procedure CheckBox1Click(Sender: TObject);
    function GetBuyPrice ( OrgPrice : Integer) : integer;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSell: TfrmSell;
   minTime, BuyRecord : integer;
   comStockTotal : longint;
   reCnt : integer;

implementation

uses MAIN, about;

{$R *.dfm}

procedure TfrmSell.FormShow(Sender: TObject);
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
  OrdList.Cells[6,0] := '체결가격';
//  OrdList.Cells[6,0] := '이익';
  OrdList.Cells[7,0] := '체결시간';






  ////////////////////////////////////////////////////

  ProfitGrid.Cells[0,0] := '종목번호';
  ProfitGrid.Cells[1,0] := '종목명';
  ProfitGrid.Cells[2,0] := '매도가능수량';
  ProfitGrid.Cells[3,0] := '매도손익금액';
  ProfitGrid.Cells[4,0] := '손익율';
  ProfitGrid.Cells[5,0] :='현재가';
  ProfitGrid.Cells[6,0] := '평균단가';
  ProfitGrid.Cells[7,0] := '합계금액';


  Button6Click(nil);
  Button7Click(nil);

end;



procedure TfrmSell.ProfitGridDrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TfrmSell.ProfitGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=0) and (ARow >=1)  then begin
          edtCode.Text := copy(ProfitGrid.Cells[ACol,ARow],2,6);
          edtQty.Text := ProfitGrid.Cells[3,ARow];


          Button5Click(nil);
      end;
end;







procedure TfrmSell.NONEClick(Sender: TObject);
begin
//  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'reccnt', 0, '1' );
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0, edtCode.Text );      // 종목번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, edtQty.Text  );            // 주문수량
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, StringReplace(edtPrc.Text,',','', [rfReplaceAll, rfIgnoreCase]));         // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '2');       // 매매구분
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, '000' );                                     // 신용거래코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, '' );                                             // 대출일
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
  XAQuery1.Request( FALSE );




end;

procedure TfrmSell.Button2Click(Sender: TObject);
begin
   if Panel7.Caption <> '' then begin

     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrgOrdNo', 0, Panel7.Caption  );     	// 원주문번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'InptPwd', 0,  edtPass.Text );      // 입력비밀번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'IsuNo', 0, StringReplace(edtCode.Text,'A','', [rfReplaceAll, rfIgnoreCase]));        // 종목번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrdQty', 0, edtQty.Text);            // 주문수량
     XAQuery4.Request( FALSE );
   end;
end;

procedure TfrmSell.Button3Click(Sender: TObject);
var
  i,timeMM : integer;
  hhmm : string;

begin
    hhmm := formatdatetime('hhmm',now);
    timeMM :=strToint(hhmm);
    Button6Click(nil);
    Button7Click(nil);
    if (timeMM mod 10) = 4 then Button4Click(nil);

    for i:=1 to BuyRecord do begin

              GetPrice(StringReplace(ProfitGrid.Cells[0,i],'A','', [rfReplaceAll, rfIgnoreCase]));
              if i mod 10 = 0 then
                 sleep(1200);


    end;

 //   timer1.Enabled :=false;
end;

procedure TfrmSell.Button4Click(Sender: TObject);
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
                   Panel1.Caption	:= ADOQuery1.fieldvalues['DAY20RATE'];
                   Panel1.Color	 :=clBlue;
                END ELSE BEGIN
                   Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
                   Panel1.Caption	:= ADOQuery1.fieldvalues['DAY20RATE'];
                   Panel1.Color	:=clRed;
                END;
           END ELSE IF ADOQuery1.fieldvalues['STOPBUY'] < 0 THEN BEGIN
                Panel1.Color :=clWebperu;
                Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
           END ELSE BEGIN
                Panel1.Color :=clGreen;
                Panel11.Caption	:= ADOQuery1.fieldvalues['BUYSTOCK'];
           END;
       end;
end;

procedure TfrmSell.Button5Click(Sender: TObject);
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


procedure TfrmSell.Button6Click(Sender: TObject);
var
OrderDay : string;
begin

  OrderDay := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'RecCnt', 0, '1' );     	// 계좌번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdMktCode', 0, '00' );         // 주문시장코드
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'BnsTpCode', 0, '0'  );                // 매매구분
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'IsuNo', 0,'' );                 //종목번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'ExecYn', 0,'1'  );   // 체결여부
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdDt', 0, '' );                 // 주문일
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'SrtOrdNo2', 0, '0');       // 시작주문번호2
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'BkseqTpCode', 0, '1' );          // 역순구분
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdPtnCode', 0, '00' );          // 주문유형코드
  XAQuery3.Request( FALSE );




end;

procedure TfrmSell.Button7Click(Sender: TObject);
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




procedure TfrmSell.edtCodeKeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin
       Button5Click(nil);
   end;

end;

procedure TfrmSell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrmSell.FormCreate(Sender: TObject);
var
   con_string1 :string;
begin
 DateTimePicker1.DateTime :=now;

// con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
// con_string := con_string + 'localhost ;Use Encryption for Data=False;Tag with column collation when possible=False';
 ADOConnection1.ConnectionString := con_string;



end;

procedure TfrmSell.XAQuery1ReceiveMessage(ASender: TObject;  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
    Panel8.Caption := Trim(szMessage) + 'XAQuery1';
end;


procedure TfrmSell.XAQuery2ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  indexNum, indexOrd, IdxBuyTime : integer;
  high,low, Junil, Bidcount1, Bidcount2,myPrice, Price, myStock,timeMM, CurTime, AftBuy,DAY20, DirectSell: integer;
  volume, offer,bid, sellopt,TodayBuyedQ, BuyQty: integer;
  diff,UPdown,DAY20RATE, highrate, lowrate, AftBuyMax, cKDAC, wKDAC : Double;
  CallDay, StockCode,sql, myPriceStr, gType, BuyTime, hhmm, LoanDt : string;
begin
  //  sgResult.Cells[0, 0] := 'ItemName';
  //  sgResult.Cells[1, 0] := 'ItemValue';
  TRY
        edit2.Text := XAQuery2.GetFieldData( 't1101OutBlock', 'hname', 0 );
        if edit2.Text ='' then begin
          memo2.Lines.Add( FormatDateTime('hh:mm:ss', now));
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

        high := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'high', 0 ));
        low := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'low', 0 ));
        diff := strToFloat(XAQuery2.GetFieldData( 't1101OutBlock', 'diff', 0 ));
        volume := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'volume', 0 ));
        offer := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'offer', 0 ));
        bid := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'bid', 0 ));

        Junil := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'jnilclose', 0 ));
        Price := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'price', 0 ));
        Bidcount1 := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'bidrem1', 0 ));
        Bidcount2 := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'bidrem2', 0 ));
        StockCode := XAQuery2.GetFieldData( 't1101OutBlock', 'shcode', 0 );

        highrate := (high -junil)*100/junil;
        lowrate  := (low -junil)*100/junil;

        edit3.Text :=  formatfloat('0.##%', lowrate);
        edit4.Text :=  formatfloat('0.##%', highrate);

        indexNum := ListBox1.Items.IndexOf(StockCode);

        if indexNum < 0 then exit;

        cKDAC := strTofloat(Panel11.Caption);
        wKDAC := strTofloat(Panel1.Caption);

     //   if (cKDAC < 0) AND (wKDAC < -3)  then
     //      exit;


        IdxBuyTime := ListBox5.Items.IndexOf(StockCode);
        if IdxBuyTime >= 0 then begin
            BuyTime := ListBox8.Items[IdxBuyTime];
            TodayBuyedQ :=strToint(ListBox7.Items[IdxBuyTime]);

        end else  BuyTime :='0';

        CallDay := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);
        hhmm := formatdatetime('hhmm',now);
        timeMM :=strToint(hhmm);
        CurTime :=(strToint(copy(hhmm,1,2)) - 9) * 60 +  strToint(copy(hhmm,3,2));

        myPriceStr := ListBox3.Items[indexNum];
        myStock := strToInt(ListBox4.Items[indexNum]);
        gType := ListBox9.Items[indexNum];
        LoanDt := ListBox14.Items[indexNum];


     //   indexOrd := ListBox1.Items.IndexOf(StockCode);


        if (copy(myPriceStr,1,1) = '@')  then begin
            myPrice := strToInt(StringReplace(myPriceStr,'@','', [rfReplaceAll, rfIgnoreCase]));
        end else begin
           myPrice := strToInt(myPriceStr);
        end;


       if BuyTime <> '0' then begin

           ADOQuery1.Close;
           ADOQuery1.SQL.Clear;
           sql :='SELECT DDATE, CCODE, MAX(HIGHPRICE) AS AftBuy FROM STOCK_MIN WHERE DDATE=''' + CallDay + ''' AND CCODE=''' + StockCode + ''' AND MinSeq > ' + BuyTime + ' + 10 GROUP BY DDATE, CCODE ';
        //   sql :='SELECT DAY20, (SELECT MAX(HIGHPRICE) FROM STOCK_MIN WHERE DDATE= A.DDATE AND CCODE=A.CCODE AND MinSeq > ' + BuyTime + ' + 10 GROUP BY DDATE, CCODE) AS AftBuy';
        //   sql := sql + ' FROM DAILY_KOSP A WHERE A.DDATE= ''' + CallDay + ''' AND A.CCODE=''' + StockCode + '''';


           ADOQuery1.SQL.Add(sql);
           ADOQuery1.Open;
           if NOT ADOQuery1.Eof then begin
               AftBuy := ADOQuery1.fieldvalues['AftBuy'];
          //     DAY20 := ADOQuery1.fieldvalues['DAY20'];
               ADOQuery1.Next;
           end;
           AftBuyMax := (AftBuy - myPrice) * 100 / Junil;
       end;

       sellopt :=0;
       DirectSell := 0;
       if AftBuyMax >= 7 then begin
           sellopt :=1;
           if (AftBuy - price) * 100 / Junil  > 2 + (AftBuyMax - 4) / 3   then
              DirectSell := 3;
       end else if (AftBuyMax >= 5) AND (CurTime > StrToint(BuyTime) + 30) then begin
           sellopt :=2;
           if (AftBuy - price) * 100 / Junil  > 1 + (AftBuyMax - 4) / 2    then
              DirectSell := 2;
       end else if (AftBuyMax >= 2.5) AND (CurTime > StrToint(BuyTime) + 90) then begin
           sellopt :=3;
           if (AftBuy - price) * 100 / Junil  > 1 + (AftBuyMax - 2) / 2    then
              DirectSell := 1;
       end;

       BuyQty := StrtoInt(edit1.Text) div Price;

       if (BuyTime <> '0') and (CurTime > StrToint(BuyTime) + 70) AND (sellopt >= 1) then  begin
             if ((myPrice - Junil)  < 0) AND ((Price - Junil) > 0 )  then myPrice :=  Junil;


             if ((Price - myPrice) * 100 / Junil > 18.3) AND  ((Price - myPrice) * 100 / Junil >= 27)  then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '1');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','1',gType);
                     Button6Click(nil);
                     Button7Click(nil);
             end else if  ((Price - myPrice) * 100 / Junil > 15.3) AND  ((Price - Junil) * 100 / Junil >= 22)   then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '2');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','2', gType);
                     Button6Click(nil);
                     Button7Click(nil);

             end else if  ((Price - myPrice) * 100 / Junil > 13.3) AND  ((Price - Junil) * 100 / Junil >= 18)  then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '3');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','3', gType);
                     Button6Click(nil);
                     Button7Click(nil);
             end else if ((Price - myPrice) * 100 / Junil > 9.3) AND  ((Price - Junil) * 100 / Junil >= 15) then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '4');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','4', gType);
                     Button6Click(nil);
                     Button7Click(nil);

             end else if (DirectSell = 3) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock) AND ((Price - myPrice) * 100 / Junil >= 3) then begin
                    Price := GetBuyPrice(Price + floor(price * 0.02));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '5');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','5', gType);
                    Button6Click(nil);
                    Button7Click(nil);

             end else if (DirectSell = 2) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock)  AND ((Price - myPrice) * 100 / Junil >= 2) then begin
                    Price := GetBuyPrice(Price + floor(price * 0.02));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '6');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','6', gType);
                    Button6Click(nil);
                    Button7Click(nil);

             end else if (DirectSell = 1) AND (copy(myPriceStr,1,1) = '@') AND ((Price - myPrice) * 100 / Junil >= 1) AND (TodayBuyedQ = myStock)   then begin
                    Price := GetBuyPrice(Price + floor(price * 0.02));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '7');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','7', gType);
                    Button6Click(nil);
                    Button7Click(nil);
             end else if ((Price - Junil) * 100 / Junil < -2.7) AND  ((Price - myPrice) * 100 / Junil < -2) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock)   then begin
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '8');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','8', gType);
                    Button6Click(nil);
                    Button7Click(nil);

             end else if ((timeMM > 1521) AND (timeMM < 1530)) AND (copy(myPriceStr,1,1) = '@') AND ((Price - myPrice) * 100 / Junil > 2) AND (TodayBuyedQ = myStock) then begin
                    Price := GetBuyPrice(Price - floor(price * 0.003));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '9');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','9', gType);
                    Button6Click(nil);
                    Button7Click(nil);
             end;

       end else begin

            if ((myPrice - Junil)  < 0) AND ((Price - Junil) > 0 )  then myPrice :=  Junil;


             if  ((Price - Junil) * 100 / Junil > 14.5) AND  ((Price - myPrice) * 100 / Junil > 9.3) AND (copy(myPriceStr,1,1) <> '@') then begin
                     Price := GetBuyPrice(Price + floor(price * 0.005));
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '11');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','11', gType);
                     Button6Click(nil);
                     Button7Click(nil);

             end else if  ((Price - Junil) * 100 / Junil > 14) AND  ((Price - myPrice) * 100 / Junil >= 5.5)  AND (copy(myPriceStr,1,1) <> '@') AND (wKDAC < -1.8) then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '13');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','13', gType);
                     Button6Click(nil);
                     Button7Click(nil);

             end else if  ((Price - Junil) * 100 / Junil > 7) AND  ((Price - myPrice) * 100 / Junil >= 5.5)  AND (cKDAC <= 0) AND (copy(myPriceStr,1,1) <> '@') AND (wKDAC < -1.8) then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '12');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','12', gType);
                     Button6Click(nil);
                     Button7Click(nil);

             end else if  ((Price - myPrice) * 100 / Junil > 13.3) AND  ((Price - Junil) * 100 / Junil >= 18) AND (copy(myPriceStr,1,1) = '@') then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '14');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','14', gType);
                     Button6Click(nil);
                     Button7Click(nil);
             end else if ((Price - myPrice) * 100 / Junil > 9.3) AND  ((Price - Junil) * 100 / Junil >= 15) AND (copy(myPriceStr,1,1) = '@') then begin
                     SellStock(StockCode, Price, myStock, gType, LoanDt);
                     memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/' + '15');
                     BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','15', gType);
                     Button6Click(nil);
                     Button7Click(nil);
//             end else if ((Price - myPrice) * 100 / Junil < - 6) AND (copy(myPriceStr,1,1) = '@')   then begin
//                    if (BuyTime <> '0') and (CurTime < StrToint(BuyTime) + 20) then begin
//                        if ((Price - myPrice) * 100 / Junil < -7) then begin
//                       //     SellStock(StockCode, Price, myStock, gType, LoanDt);
//                            memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '16');
//                            BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','16', gType);
//                            Button6Click(nil);
//                            Button7Click(nil);
//                        end;
//                    end else begin
//                     //    SellStock(StockCode, Price, myStock, gType, LoanDt);
//                         memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '17');
//                         BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','17', gType);
//                         Button6Click(nil);
//                         Button7Click(nil);
//                    end;

             end else if ((Price - myPrice) * 100 / Junil < 2) AND ((Price - myPrice) * 100 / Junil > 1)  AND  (copy(myPriceStr,1,1) = '@') AND (BuyTime <> '0') and (CurTime > StrToint(BuyTime) + 150) AND (TodayBuyedQ = myStock) then begin
                            Price := GetBuyPrice(Price + floor(price * 0.02));
                            SellStock(StockCode, Price, myStock, gType, LoanDt);
                            memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '18');
                            BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','18', gType);
                            Button6Click(nil);
                            Button7Click(nil);
             end else if (DirectSell = 3) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock) AND ((Price - myPrice) * 100 / Junil >= 3)  then begin
                    Price := GetBuyPrice(Price + floor(price * 0.02));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '19');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','19', gType);
                    Button6Click(nil);
                    Button7Click(nil);
             end else if (DirectSell = 2) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock) AND ((Price - myPrice) * 100 / Junil >= 2)  then begin
                    Price := GetBuyPrice(Price + floor(price * 0.015));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '20');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','20', gType);
                    Button6Click(nil);
                    Button7Click(nil);

             end else if (DirectSell = 1) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock) AND ((Price - myPrice) * 100 / Junil >= 1) then begin
                    Price := GetBuyPrice(Price + floor(price * 0.01));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '21');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','21', gType);
                    Button6Click(nil);
                    Button7Click(nil);

             end else if ((Price - Junil) * 100 / Junil < -6) AND ((Price - myPrice) * 100 / Junil < -6) AND (copy(myPriceStr,1,1) <> '@') AND (TodayBuyedQ = myStock)  then begin             //AND  ((Price - myPrice) * 100 / Junil < - 6)
                //    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '22');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','22', gType);
                    Button6Click(nil);
                    Button7Click(nil);
             end else if ((Price - Junil) * 100 / Junil < -2.7) AND  ((Price - myPrice) * 100 / Junil < -2) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock) then begin
               //     SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '23');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','23', gType);
                    Button6Click(nil);
                    Button7Click(nil);


             end else if ((timeMM > 1521) AND (timeMM < 1530)) AND ((Price - myPrice) * 100 / Junil > 2) AND (copy(myPriceStr,1,1) = '@') AND (TodayBuyedQ = myStock) then begin
                    Price := GetBuyPrice(Price - floor(price * 0.003));
                    SellStock(StockCode, Price, myStock, gType, LoanDt);
                    memo2.Lines.Add(StockCode + '/'+ intTostr(Price) + '/' +  inttostr(myStock) + '/' + gType +'/'+ '24');
                    BuySellint(StockCode, intTostr(Price), inttostr(myStock), '1','24', gType);
                    Button6Click(nil);
                    Button7Click(nil);
             end;
       end;



    except
    on E: Exception do begin
         OutputDebugString(PWideChar('..., Error message is ' + E.Message));
    end;
  END;

end;

procedure TfrmSell.XAQuery2ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
    Panel8.Caption := Trim(szMessage) + 'XAQuery2';
end;

procedure TfrmSell.XAQuery3ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  I, J, x,y : Integer;
  nRecordCount, IdxSell, OrdPrc, ExecPrc,IdxPrc : Integer;
  MinSeq, IsuNo, SellQty,jongmok : String;
begin
     ListBox5.Clear;
     ListBox6.Clear;
     ListBox7.Clear;
     ListBox8.Clear;
     ListBox10.Clear;
     ListBox11.Clear;
     ListBox12.Clear;
     ListBox13.Clear;

     nRecordCount := XAQuery3.GetBlockCount( 'CSPAQ13700OutBlock3' );
     for x := 1 to OrdList.RowCount -1 do begin
         for y := 0 to OrdList.ColCount -1  do begin
             OrdList.Cells[y,x] :='';
         end;
     end;


     for I := 1 to nRecordCount  do begin
         if XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'BnsTpNm', I-1 ) = '매도' then begin       //매도
            IsuNo := StringReplace(XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'IsuNo', I-1),'A','', [rfReplaceAll, rfIgnoreCase]);

            Listbox10.Items.Add(IsuNo);
            Listbox11.Items.Add(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 ));
            Listbox12.Items.Add(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'ExecQty', I-1 ));
            //ExecPrc :=strToint(formatfloat('#0',strTofloat(XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'ExecPrc', I-1 ))));
            //OrdPrc :=strToint(formatfloat('#0',strTofloat(XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'OrdPrc', I-1 ))));

          //  IdxPrc := Listbox1.Items.IndexOf(IsuNo);
          //  if IdxPrc >=0 then begin
          //      OrdPrc := strToint(StringReplace(Listbox3.Items[IdxPrc],'@','', [rfReplaceAll, rfIgnoreCase]));
          //      Listbox13.Items.Add(formatfloat('0.##%', (ExecPrc - OrdPrc) * 100 / OrdPrc - 0.24 ));
          //  end;
         end;
     end;

     J := 1;
     for I := 1 to nRecordCount  do begin
         IsuNo := StringReplace(XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'IsuNo', I-1),'A','', [rfReplaceAll, rfIgnoreCase]);
         jongmok := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 );
         IdxSell := Listbox10.Items.IndexOf(IsuNo);
         IF IdxSell >= 0 THEN SellQty := Listbox12.Items[IdxSell];


         if  (IsuNo <> '') AND (XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'BnsTpNm', I-1 ) ='매수') then begin //OR (IdxSell < 0) AND (SellQty <> XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdQty', I-1 )) then begin
             MinSeq :=  COPY(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'ExecTrxTime', I-1 ),1,4);
             OrdList.Cells[0,J] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdDt', I-1 ); // '주문일';
             OrdList.Cells[1,J] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNo', I-1 ); // '종목번호';
             OrdList.Cells[2,J] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 ); // '종목명';
             OrdList.Cells[3,J] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdNo', I-1 ); // '주문번호';    BnsTpNm
             OrdList.Cells[4,J] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'BnsTpNm', I-1 ); // '매매구분';
             OrdList.Cells[5,J] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdQty', I-1 ))); // '주문수량';

             OrdPrc :=strToint(formatfloat('#0',strTofloat(XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'OrdPrc', I-1 ))));
             //ExecPrc :=strToint(formatfloat('#0',strTofloat(XAQuery3.GetFieldData('CSPAQ13700OutBlock3', 'ExecPrc', I-1 ))));

             OrdList.Cells[6,J] := formatfloat('#0,', OrdPrc); // '체결가격';

//             OrdList.Cells[6,J] := formatfloat('0.##%', (ExecPrc - OrdPrc) * 100 / OrdPrc - 0.24 ); // '주문가격';
             OrdList.Cells[7,J] := MinSeq; // '주문시간';

             J:=J+1;
         end;
     end;

     for x := I - 1 downto  1 do  begin
           if OrdList.Cells[4,x] = '매수'  then begin

             Listbox5.Items.Add(StringReplace(OrdList.Cells[1,x],'A','', [rfReplaceAll, rfIgnoreCase]));
             Listbox6.Items.Add(OrdList.Cells[2,x]);
             Listbox7.Items.Add(OrdList.Cells[5,x]);
             Listbox8.Items.Add(inttostr((strToint(copy(OrdList.Cells[7,x],1,2)) - 9) * 60 + strToint(copy(OrdList.Cells[7,x],3,2))));
           end;
     end;


     AutoSizeGridColumn(OrdList, 7);

end;

procedure TfrmSell.XAQuery3ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
       Panel8.Caption := Trim(szMessage) + 'XAQuery3';
end;

procedure TfrmSell.XAQuery4ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  i : integer;
  iData : widestring;
begin
//     iData := XAQuery4.GetFieldData( 'CSPAT00800OutBlock1', 'OrgOrdNo', 0 ); // '주문번호';
//     if iData = Panel7.Caption then begin
//          Panel7.Caption :='';
//          for i := 0 to 12 do
//              OrdGrid.Cells[i,1] := '';
//     end;
end;

procedure TfrmSell.XAQuery4ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
   Panel8.Caption := Trim(szMessage) + 'XAQuery4';

end;

procedure TfrmSell.XAQuery5ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
   Panel8.Caption := Trim(szMessage)+ 'XAQuery5';
end;

procedure TfrmSell.XAQuery6ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
 nRecordCount, I, J, nRow: integer;
 gtype,Jongmok,gtypeNm : string;
 sumAmt : double;
begin

     ListBox1.Clear;
     ListBox2.Clear;
     ListBox3.Clear;
     ListBox4.Clear;
     ListBox9.Clear;

     nRecordCount := XAQuery6.GetBlockCount ( 'CSPAQ12300OutBlock3' );
     ProfitGrid.RowCount := nRecordCount + 1;
     J:=1;

     for nRow := 1 to nRecordCount - 1 do
          ProfitGrid.Rows[nRow].Clear;

     for I := 1 to nRecordCount  do begin
            Jongmok := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNm', I-1 );
            if strtoFloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)) > 0 then begin // XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BuyPrc', I-1)) > 0 then begin
              ProfitGrid.Cells[0,J] := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNo', I-1 );     //'종목번호';
              ProfitGrid.Cells[1,J] := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNm', I-1 );     //'종목명';
              ProfitGrid.Cells[2,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)));     //'매도가능수량';
              ProfitGrid.Cells[3,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellPnlAmt', I-1)));     //'매도손익금액';
              ProfitGrid.Cells[4,J] := formatfloat('0.##%', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'PnlRat', I-1 )) * 100 );     //'손익율';
              ProfitGrid.Cells[5,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'NowPrc', I-1)));    //'현재가';
              ProfitGrid.Cells[6,J] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 )));     //'평균단가';
              sumAmt := strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 )) * strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)) ;
              ProfitGrid.Cells[7,J] := formatfloat('#0,', sumAmt);     //'평균단가';
              J:=J+1;
            end;

            if  (strtoFloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)) > 0) AND (XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BuyPrc', I-1) <> '0') then begin               //(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdayBuyExecQty', I-1) <> '0')

                ListBox1.Items.Add(StringReplace(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNo', I-1),'A','', [rfReplaceAll, rfIgnoreCase]));
                gtype := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SecBalPtnCode', I-1 );
                gtypeNm := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SecBalPtnNm', I-1 );
                if pos('유가', gtypeNm) > 0 then ListBox9.Items.Add('000')
                else if pos('예탁주식', gtypeNm) > 0 then ListBox9.Items.Add('180')
                else if pos('유통융자', gtypeNm) > 0 then ListBox9.Items.Add('101')
                else ListBox9.Items.Add('XXX');

                if XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'LoanDt', I-1)<> '' then
                    ListBox14.Items.Add(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'LoanDt', I-1))
                else
                    ListBox14.Items.Add('-');

                ListBox2.Items.Add(StringReplace(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNm', I-1 ),'A','', [rfReplaceAll, rfIgnoreCase]));
                ListBox4.Items.Add(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1));
                if StrToint(XAQuery6.GetFieldData('CSPAQ12300OutBlock3', 'CrdayBuyExecQty', I-1 )) > 0  then
                    ListBox3.Items.Add(formatfloat('@#0', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 ))))
                else ListBox3.Items.Add(formatfloat('#0', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 ))));
            end;
     end;
     BuyRecord := J - 1;
     AutoSizeGridColumn(ProfitGrid, 7);
end;

procedure TfrmSell.XAQuery6ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
     Panel8.Caption := Trim(szMessage) + 'XAQuery6';
end;


procedure TfrmSell.XAReal2ReceiveRealData(ASender: TObject;
  const szTrCode: WideString);
begin
   // SetData ( 0,1, 'price', szTrCode  );
end;





procedure TfrmSell.SetData ( ARow   : Integer; BCol : Integer; szName : WideString; szRealName : String );
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


procedure TfrmSell.sgResultDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  //  if ((1 <= ACol) and (ACol <= 2)) and ((1 <= ARow) and  (ARow <=12))then begin
 //          sgResult.Canvas.Font.Color := clRed;
 //          sgResult.Canvas.TextOut(Rect.Left, Rect.Top, sgResult.Cells[ACol,ARow]) ;
 //   end;

end;

procedure TfrmSell.sgResultSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=1) and ((ARow >=1) and (ARow <=22)) then
          edtPrc.Text := sgResult.Cells[ACol,ARow];
end;



function TfrmSell.BytesToHex(aSource: TBytes): string;
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




procedure TfrmSell.CheckBox1Click(Sender: TObject);
begin
    if checkbox1.Checked  then
       timer1.Enabled :=false
    else
       timer1.Enabled :=true;
end;

procedure TfrmSell.AutoSizeGridColumn(Grid : TStringGrid; column : integer);
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




procedure TfrmSell.GetPrice(StockCode : string);
begin
  reCnt :=0;
  XAQuery2.SetFieldData( 't1101InBlock', 'shcode', 0, StockCode );
  XAQuery2.Request( FALSE );
end;


procedure TfrmSell.SellCancel(StockCode : string; OrgOrdNo: string ; StockQty : string);
begin

     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrgOrdNo', 0, OrgOrdNo  );     	// 원주문번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'InptPwd', 0,  edtPass.Text );      // 입력비밀번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'IsuNo', 0, StockCode);        // 종목번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrdQty', 0, StockQty);            // 주문수량
     XAQuery4.Request( FALSE );

end;



function TfrmSell.GetBuyPrice ( OrgPrice : Integer) : integer;
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
       end else if OrgPrice > 500000 then begin
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

procedure TfrmSell.SellStock(StockCode : string; StockPrice: integer ; StockQty : integer; Mgnt :string; LoanDt: string);
begin
//  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'reccnt', 0, '1' );
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0,  StockCode);      // 종목번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, intToStr(StockQty));            // 주문수량
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, StringReplace(intToStr(StockPrice),',','', [rfReplaceAll, rfIgnoreCase]));               // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '1');       // 매매구분
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, Mgnt );   //  000:보통 003:유통/자기융자신규  005:유통대주신규 007:자기대주신규  101:유통융자상환   103:자기융자상환    105:유통대주상환 107:자기대주상환   180:예탁담보대출상환(신용)'000'                                // 신용거래코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, LoanDt );                                            // 대출일
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
  XAQuery1.Request( FALSE );
end;

procedure TfrmSell.BuyStock(StockCode : string; StockPrice: integer ; StockQty : integer ; gType :string);
begin
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0, StockCode );      // 종목번호
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, intToStr(StockQty)  );            // 주문수량
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, intToStr(StockPrice));         // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '2');       // 매매구분
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, gType );                                     // 신용거래코드
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, '' );                                             // 대출일
    XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
    XAQuery1.Request( FALSE );
end;


procedure TfrmSell.BuySellint(StockCode : string; StockPrice: string ; StockQty : string; BySl : string; opt : string; gType: string);
var
   iSql : string;
   iDate : string;
begin
        iDate := FormatDateTime('YYYYMMDD',now);
   //     iDate := FormatDateTime('YYYYMMDDhhmmss',now);

        ADOQuery2.close;
        ADOQuery2.sql.Clear;
        iSql := 'INSERT INTO BUYSELL(DDATE, CCODE, BUYPRICE, BUYQTY, BUYSELL, OPT, gType, BUYTIME) ';
        iSql := iSql + ' Values(''' + iDate + ''',''' + StockCode + ''',' + StockPrice + ','+ StockQty +','+ BySl +',' + opt +','''+ gType + ''',GETUTCDATE())';
        ADOQuery2.sql.add(iSql);
        ADOQuery2.ExecSQL;
end;


end.
