object frmSell: TfrmSell
  Left = 727
  Top = 162
  Caption = #51452#49885#47588#46020
  ClientHeight = 740
  ClientWidth = 1556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1556
    740)
  TextHeight = 11
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 44
    Height = 11
    Caption = #44228#51340#48264#54840
  end
  object Label2: TLabel
    Left = 583
    Top = 17
    Width = 38
    Height = 11
    Caption = 'START'
  end
  object Label4: TLabel
    Left = 592
    Top = 36
    Width = 28
    Height = 11
    Caption = 'HIGH'
  end
  object Label5: TLabel
    Left = 592
    Top = 55
    Width = 26
    Height = 11
    Caption = 'LOW'
  end
  object Label6: TLabel
    Left = 592
    Top = 74
    Width = 22
    Height = 11
    Caption = 'END'
  end
  object Label7: TLabel
    Left = 592
    Top = 93
    Width = 26
    Height = 11
    Caption = 'UP%'
  end
  object Label8: TLabel
    Left = 578
    Top = 112
    Width = 40
    Height = 11
    Caption = 'GURAE'
  end
  object Label9: TLabel
    Left = 592
    Top = 131
    Width = 33
    Height = 11
    Caption = #51204#45216#44032
  end
  object Label10: TLabel
    Left = 592
    Top = 150
    Width = 22
    Height = 11
    Caption = #44053#46020
  end
  object Label3: TLabel
    Left = 1013
    Top = 277
    Width = 74
    Height = 16
    Caption = #51452#47928' '#47588#49688' '#52404#44208
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 725
    Top = 8
    Width = 44
    Height = 16
    Caption = #51452#47928#52404#44208
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 1013
    Top = 469
    Width = 74
    Height = 16
    Caption = #51452#47928' '#47588#46020' '#52404#44208
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel2: TPanel
    Left = 319
    Top = 51
    Width = 89
    Height = 21
    Caption = #51333#47785
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 325
    Top = 76
    Width = 89
    Height = 21
    Caption = #54840#44032#50976#54805
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 325
    Top = 102
    Width = 89
    Height = 21
    Caption = #51452#47928#49688#47049
    TabOrder = 2
  end
  object Panel5: TPanel
    Left = 325
    Top = 126
    Width = 89
    Height = 21
    Caption = #51452#47928#45800#44032
    TabOrder = 3
  end
  object Panel10: TPanel
    Left = 322
    Top = 150
    Width = 92
    Height = 21
    Caption = #49888#50857#44144#47000#53076#46300
    TabOrder = 4
  end
  object Panel6: TPanel
    Left = 322
    Top = 177
    Width = 89
    Height = 21
    Caption = #51452#47928#48264#54840
    TabOrder = 5
  end
  object Panel7: TPanel
    Left = 431
    Top = 177
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object MgntrnCode: TComboBox
    Left = 431
    Top = 152
    Width = 123
    Height = 19
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 7
    Items.Strings = (
      '000.'#48372#53685'                '
      '001.'#50976#53685#50997#51088#49888#44508'        '
      '003.'#51088#44592#50997#51088#49888#44508'                '
      '007.'#51088#44592#45824#51452#49888#44508
      '101.'#50976#53685#50997#51088#49345#54872'        '
      '103.'#51088#44592#50997#51088#49345#54872
      '107.'#51088#44592#45824#51452#49345#54872
      '180.'#50696#53441#45812#48372#45824#52636#49345#54872'('#49888#50857')')
  end
  object edtPrc: TEdit
    Left = 431
    Top = 125
    Width = 121
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 8
  end
  object edtQty: TEdit
    Left = 431
    Top = 101
    Width = 121
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 9
    Text = '1'
  end
  object cbOrdType: TComboBox
    Left = 431
    Top = 74
    Width = 123
    Height = 19
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 10
    Items.Strings = (
      '00.'#51648#51221#44032
      '03.'#49884#51109#44032
      '05.'#51312#44148#48512#51648#51221#44032
      '06.'#52572#50976#47532#51648#51221#44032
      '07.'#52572#50864#49440#51648#51221#44032
      '81.'#49884#44036#50808#51333#44032
      '82.'#49884#44036#50808#45800#51068#44032
      '')
  end
  object edtCode: TEdit
    Left = 433
    Top = 47
    Width = 121
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 11
    Text = '217600'
    OnKeyPress = edtCodeKeyPress
  end
  object Button3: TButton
    Left = 319
    Top = 227
    Width = 63
    Height = 47
    Caption = #47588#46020
    TabOrder = 12
    OnClick = Button3Click
  end
  object Button2: TButton
    Left = 397
    Top = 227
    Width = 65
    Height = 47
    Caption = #51452#47928#52712#49548
    TabOrder = 13
    OnClick = Button2Click
  end
  object Panel8: TPanel
    Left = 0
    Top = 714
    Width = 1556
    Height = 26
    Align = alBottom
    TabOrder = 14
    ExplicitTop = 713
    ExplicitWidth = 1552
  end
  object sgResult: TStringGrid
    Left = 8
    Top = 78
    Width = 305
    Height = 466
    BiDiMode = bdLeftToRight
    ColCount = 4
    DefaultColWidth = 80
    DefaultRowHeight = 18
    FixedColor = clSkyBlue
    FixedCols = 0
    RowCount = 24
    ParentBiDiMode = False
    ScrollBars = ssNone
    TabOrder = 15
    OnDrawCell = sgResultDrawCell
    OnSelectCell = sgResultSelectCell
    ColWidths = (
      80
      80
      80
      80)
    RowHeights = (
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18)
  end
  object XAQuery2: TXAQuery
    Left = 328
    Top = 0
    Width = 0
    Height = 0
    OnReceiveData = XAQuery2ReceiveData
    OnReceiveMessage = XAQuery2ReceiveMessage
    ControlData = {
      000A0000D8130000D813000008001A00000049004F002F007400310031003000
      31002E007200650073000000}
  end
  object XAReal1: TXAReal
    Left = 496
    Top = 0
    Width = 0
    Height = 0
    ControlData = {
      000A0000D8130000D813000008001600000049004F002F00480031005F002E00
      7200650073000000}
  end
  object XAReal2: TXAReal
    Left = 552
    Top = 0
    Width = 0
    Height = 0
    OnReceiveRealData = XAReal2ReceiveRealData
    ControlData = {
      000A0000D8130000D813000008001600000049004F002F00530033005F002E00
      7200650073000000}
  end
  object Button5: TButton
    Left = 317
    Top = 6
    Width = 65
    Height = 29
    Caption = #51333#47785#49884#49464
    TabOrder = 19
    OnClick = Button5Click
  end
  object XAReal3: TXAReal
    Left = 504
    Top = 8
    Width = 0
    Height = 0
    ControlData = {
      000A0000D8130000D813000008001600000049004F002F00480041005F002E00
      7200650073000000}
  end
  object XAQuery1: TXAQuery
    Left = 303
    Top = 75
    Width = 0
    Height = 0
    Anchors = []
    OnReceiveMessage = XAQuery1ReceiveMessage
    ExplicitLeft = 302
    ControlData = {
      000A0000D8130000D813000008002400000049004F002F004300530050004100
      5400300030003600300030002E007200650073000000}
  end
  object XAQuery3: TXAQuery
    Left = 355
    Top = 91
    Width = 0
    Height = 0
    Anchors = []
    OnReceiveData = XAQuery3ReceiveData
    OnReceiveMessage = XAQuery3ReceiveMessage
    ExplicitLeft = 354
    ControlData = {
      000A0000D8130000D813000008002400000049004F002F004300530050004100
      5100310033003700300030002E007200650073000000}
  end
  object XAQuery4: TXAQuery
    Left = 364
    Top = 109
    Width = 0
    Height = 0
    Anchors = []
    OnReceiveData = XAQuery4ReceiveData
    OnReceiveMessage = XAQuery4ReceiveMessage
    ExplicitLeft = 363
    ControlData = {
      000A0000D8130000D81300000800280000002E002F0049004F002F0043005300
      500041005400300030003800300030002E007200650073000000}
  end
  object XAQuery5: TXAQuery
    Left = 378
    Top = 124
    Width = 0
    Height = 0
    Anchors = []
    OnReceiveMessage = XAQuery5ReceiveMessage
    ExplicitLeft = 377
    ControlData = {
      000A0000D8130000D81300000800280000002E002F0049004F002F0043005300
      500041005100310032003200300030002E007200650073000000}
  end
  object ProfitGrid: TStringGrid
    Left = 319
    Top = 415
    Width = 602
    Height = 282
    ColCount = 8
    FixedCols = 0
    TabOrder = 25
    OnDrawCell = ProfitGridDrawCell
    OnSelectCell = ProfitGridSelectCell
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      25
      24
      24
      24)
  end
  object Button7: TButton
    Left = 936
    Top = 416
    Width = 71
    Height = 47
    Caption = #51452#49885#51092#44256'2'
    TabOrder = 26
    OnClick = Button7Click
  end
  object XAQuery6: TXAQuery
    Left = 387
    Top = 25
    Width = 0
    Height = 0
    Anchors = []
    OnReceiveData = XAQuery6ReceiveData
    OnReceiveMessage = XAQuery6ReceiveMessage
    ExplicitLeft = 386
    ControlData = {
      000A0000D8130000D81300000800280000002E002F0049004F002F0043005300
      500041005100310032003300300030002E007200650073000000}
  end
  object edtPass: TEdit
    Left = 218
    Top = 8
    Width = 79
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    PasswordChar = '*'
    TabOrder = 28
    Text = '0803'
  end
  object cbAccount: TComboBox
    Left = 67
    Top = 8
    Width = 145
    Height = 19
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 29
  end
  object Edit15: TEdit
    Left = 625
    Top = 126
    Width = 80
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 30
  end
  object WebBrowser1: TWebBrowser
    Left = 468
    Top = 217
    Width = 33
    Height = 25
    TabOrder = 31
    ControlData = {
      4C00000069030000950200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Edit9: TEdit
    Left = 625
    Top = 14
    Width = 80
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 32
  end
  object Edit10: TEdit
    Left = 625
    Top = 32
    Width = 80
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 33
  end
  object Edit11: TEdit
    Left = 625
    Top = 70
    Width = 80
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 34
  end
  object Edit12: TEdit
    Left = 625
    Top = 51
    Width = 80
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 35
  end
  object Edit13: TEdit
    Left = 625
    Top = 88
    Width = 80
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 36
  end
  object Edit14: TEdit
    Left = 625
    Top = 107
    Width = 80
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 37
  end
  object Panel9: TPanel
    Left = 583
    Top = 177
    Width = 70
    Height = 21
    TabOrder = 38
  end
  object Edit6: TEdit
    Left = 625
    Top = 145
    Width = 80
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 39
  end
  object DateTimePicker1: TDateTimePicker
    Left = 465
    Top = 250
    Width = 115
    Height = 24
    Date = 42506.000000000000000000
    Time = 0.049598368052102160
    TabOrder = 40
  end
  object Edit2: TEdit
    Left = 8
    Top = 51
    Width = 121
    Height = 19
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 41
  end
  object OrdList: TStringGrid
    Left = 319
    Top = 280
    Width = 602
    Height = 129
    ColCount = 8
    RowCount = 30
    TabOrder = 42
  end
  object Button6: TButton
    Left = 936
    Top = 299
    Width = 71
    Height = 36
    Caption = #51452#47928#48120#52404#44208
    TabOrder = 43
    OnClick = Button6Click
  end
  object ListBox1: TListBox
    Left = 725
    Top = 30
    Width = 69
    Height = 224
    ItemHeight = 11
    TabOrder = 44
  end
  object ListBox3: TListBox
    Left = 904
    Top = 30
    Width = 74
    Height = 224
    ItemHeight = 11
    TabOrder = 45
  end
  object ListBox2: TListBox
    Left = 800
    Top = 30
    Width = 98
    Height = 224
    ItemHeight = 11
    TabOrder = 46
  end
  object ListBox4: TListBox
    Left = 984
    Top = 30
    Width = 66
    Height = 224
    ItemHeight = 11
    TabOrder = 47
  end
  object ListBox5: TListBox
    Left = 1013
    Top = 299
    Width = 69
    Height = 163
    ItemHeight = 11
    TabOrder = 48
  end
  object ListBox6: TListBox
    Left = 1088
    Top = 299
    Width = 98
    Height = 163
    ItemHeight = 11
    TabOrder = 49
  end
  object ListBox7: TListBox
    Left = 1192
    Top = 299
    Width = 85
    Height = 163
    ItemHeight = 11
    TabOrder = 50
  end
  object ListBox8: TListBox
    Left = 1283
    Top = 299
    Width = 85
    Height = 163
    ItemHeight = 11
    TabOrder = 51
  end
  object CheckBox1: TCheckBox
    Left = 598
    Top = 204
    Width = 82
    Height = 31
    Caption = 'TIME STOP'
    TabOrder = 52
    OnClick = CheckBox1Click
  end
  object Memo1: TMemo
    Left = 1283
    Top = 32
    Width = 84
    Height = 34
    TabOrder = 53
  end
  object NONE: TButton
    Left = 8
    Top = 667
    Width = 61
    Height = 17
    Caption = 'NONE'
    TabOrder = 54
    OnClick = NONEClick
  end
  object ListBox10: TListBox
    Left = 1013
    Top = 491
    Width = 69
    Height = 206
    ItemHeight = 11
    TabOrder = 55
  end
  object ListBox9: TListBox
    Left = 1056
    Top = 30
    Width = 58
    Height = 224
    ItemHeight = 11
    TabOrder = 58
  end
  object ListBox11: TListBox
    Left = 1088
    Top = 491
    Width = 98
    Height = 206
    ItemHeight = 11
    TabOrder = 60
  end
  object ListBox12: TListBox
    Left = 1192
    Top = 491
    Width = 85
    Height = 206
    ItemHeight = 11
    TabOrder = 56
  end
  object ListBox13: TListBox
    Left = 1283
    Top = 491
    Width = 85
    Height = 206
    ItemHeight = 11
    TabOrder = 57
  end
  object Memo2: TMemo
    Left = 1373
    Top = 32
    Width = 175
    Height = 667
    ScrollBars = ssBoth
    TabOrder = 59
  end
  object Edit1: TEdit
    Left = 598
    Top = 242
    Width = 107
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 61
    Text = '200000'
  end
  object Edit3: TEdit
    Left = 8
    Top = 550
    Width = 57
    Height = 19
    TabOrder = 62
  end
  object Edit4: TEdit
    Left = 240
    Top = 550
    Width = 57
    Height = 19
    TabOrder = 63
  end
  object ListBox14: TListBox
    Left = 1120
    Top = 30
    Width = 73
    Height = 224
    ItemHeight = 11
    TabOrder = 64
  end
  object Button4: TButton
    Left = 1292
    Top = 264
    Width = 75
    Height = 29
    Caption = #49884#51109#49345#54889
    TabOrder = 65
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 1232
    Top = 113
    Width = 135
    Height = 136
    Caption = '0'
    Color = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 66
  end
  object Panel11: TPanel
    Left = 1232
    Top = 72
    Width = 135
    Height = 35
    Caption = '0'
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 67
  end
  object ADOConnection1: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 424
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 392
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDE' +
        'R BY DDATE DESC) AS ROW, *  '
      
        'FROM DAILY_KOSP WHERE CCODE='#39'010140'#39'  AND DDATE <= convert(varch' +
        'ar, getdate(), 112) ) A  '
      'WHERE A.ROW < 20 order by ddate ')
    Left = 456
    Top = 8
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDE' +
        'R BY DDATE DESC) AS ROW, *  '
      
        'FROM DAILY_KOSP WHERE CCODE='#39'010140'#39'  AND DDATE <= convert(varch' +
        'ar, getdate(), 112) ) A  '
      'WHERE A.ROW < 20 order by ddate ')
    Left = 496
    Top = 8
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDE' +
        'R BY DDATE DESC) AS ROW, *  '
      
        'FROM DAILY_KOSP WHERE CCODE='#39'010140'#39'  AND DDATE <= convert(varch' +
        'ar, getdate(), 112) ) A  '
      'WHERE A.ROW < 20 order by ddate ')
    Left = 520
    Top = 8
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 16
    Top = 16
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=sa'
      'Password=Link2sky'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=localhost'
      'MARS=yes'
      'Database=STOCK_INFO'
      'DriverID=MSSQL')
    Left = 72
    Top = 24
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 160
    Top = 32
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Button3Click
    Left = 528
    Top = 208
  end
end
