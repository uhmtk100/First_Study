object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 885
  ClientWidth = 2114
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1765
    Top = 284
    Width = 14
    Height = 16
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 1574
    Top = 170
    Width = 27
    Height = 13
    Caption = 'DATA'
  end
  object Label3: TLabel
    Left = 1510
    Top = 339
    Width = 22
    Height = 13
    Caption = #52572#51333
  end
  object Label4: TLabel
    Left = 1513
    Top = 367
    Width = 22
    Height = 13
    Caption = #52572#49345
  end
  object Label5: TLabel
    Left = 1601
    Top = 342
    Width = 33
    Height = 13
    Caption = #44144#47000#47049
  end
  object Label6: TLabel
    Left = 1568
    Top = 218
    Width = 22
    Height = 13
    Caption = #50672#49549
  end
  object Label7: TLabel
    Left = 1596
    Top = 218
    Width = 44
    Height = 13
    Caption = #44144#47000#48708#51473
  end
  object Label8: TLabel
    Left = 1646
    Top = 218
    Width = 22
    Height = 13
    Caption = #54200#52264
  end
  object Label9: TLabel
    Left = 1534
    Top = 215
    Width = 33
    Height = 13
    Caption = #44553#46321'%'
  end
  object Label10: TLabel
    Left = 1674
    Top = 218
    Width = 33
    Height = 13
    Caption = #45209#54253'%'
  end
  object Label11: TLabel
    Left = 1524
    Top = 192
    Width = 44
    Height = 13
    Caption = #44144#47000#44592#44036
  end
  object DBChart1: TDBChart
    Left = -8
    Top = 2
    Width = 697
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 0
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      39
      15
      39)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clRed
      Title = #51333#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'ENDPRICE'
    end
    object Series2: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clGreen
      Title = #49884#51089#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'STARTPRICE'
    end
    object Series3: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = 4227327
      Title = #52572#44256#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'HIGHPRICE'
    end
    object Series4: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clBlue
      Title = #52572#51200#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'LOWPRICE'
    end
    object Series5: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clBlack
      Title = '20'#54217#44512
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'DAY20'
    end
  end
  object Button1: TButton
    Left = 1514
    Top = 430
    Width = 36
    Height = 31
    Caption = #48516#49437'1'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 1514
    Top = 307
    Width = 73
    Height = 24
    TabOrder = 2
    Text = '900280'
    OnKeyUp = Edit1KeyUp
  end
  object Button2: TButton
    Left = 1718
    Top = 396
    Width = 44
    Height = 33
    Caption = #44553#46321#51333#47785
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object Edit2: TEdit
    Left = 1593
    Top = 306
    Width = 116
    Height = 24
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 2152
    Top = 254
    Width = 73
    Height = 25
    Caption = #53945#51221#51333#47785
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object DBChart5: TDBChart
    Left = -116
    Top = 198
    Width = 805
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 1
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 6
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object LineSeries10: TBarSeries
      BarBrush.BackColor = clDefault
      Marks.Visible = False
      Marks.Callout.Length = 8
      DataSource = ADOQuery1
      SeriesColor = clRed
      Title = #44144#47000#47049
      XLabelsSource = 'DDATE'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAE'
    end
    object Series6: TLineSeries
      DataSource = ADOQuery1
      Title = #44032#51473#52824
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAEWEIGHT'
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 1514
    Top = 279
    Width = 92
    Height = 24
    Date = 42506.000000000000000000
    Time = 0.049598368052102160
    TabOrder = 7
  end
  object Memo1: TMemo
    Left = 761
    Top = 856
    Width = 31
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 8
  end
  object ListBox1: TListBox
    Left = 815
    Top = 800
    Width = 69
    Height = 41
    ItemHeight = 13
    TabOrder = 9
  end
  object ListBox2: TListBox
    Left = 890
    Top = 800
    Width = 161
    Height = 41
    ItemHeight = 13
    TabOrder = 10
  end
  object Button3: TButton
    Left = 1514
    Top = 399
    Width = 65
    Height = 30
    Caption = #44592#50629#51221#48372
    TabOrder = 11
  end
  object Button4: TButton
    Left = 1585
    Top = 399
    Width = 68
    Height = 30
    Caption = #51452#44032#51221#48372
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object Edit3: TEdit
    Left = 1703
    Top = 279
    Width = 27
    Height = 24
    TabOrder = 13
    Text = '1'
  end
  object Button5: TButton
    Left = 1585
    Top = 430
    Width = 52
    Height = 31
    Caption = #49345#50948#44160#49353
    TabOrder = 14
  end
  object Edit4: TEdit
    Left = 1728
    Top = 279
    Width = 31
    Height = 24
    TabOrder = 15
    Text = '29'
  end
  object ListBox3: TListBox
    Left = 1056
    Top = 800
    Width = 65
    Height = 41
    ItemHeight = 13
    TabOrder = 16
  end
  object Edit5: TEdit
    Left = 1538
    Top = 337
    Width = 49
    Height = 24
    TabOrder = 17
  end
  object Edit6: TEdit
    Left = 1643
    Top = 369
    Width = 69
    Height = 24
    TabOrder = 18
  end
  object ListBox5: TListBox
    Left = 1589
    Top = 31
    Width = 76
    Height = 124
    AutoComplete = False
    Color = clSilver
    ItemHeight = 13
    Items.Strings = (
      #50808#44397#51064
      #50689#50629#51060#51061
      #51452#45817#51060#51061
      #47588#52636#50529'('#48512#52292') '
      'PER(PBR)'
      'ROE(ROA)'
      #52509#51452#49885#49688)
    TabOrder = 19
  end
  object ListBox6: TListBox
    Left = 1664
    Top = 32
    Width = 120
    Height = 150
    Color = clCream
    ItemHeight = 13
    TabOrder = 20
  end
  object Button6: TButton
    Left = 1638
    Top = 430
    Width = 70
    Height = 31
    Caption = #48372#47932#52286#44592'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
  end
  object Edit7: TEdit
    Left = 1581
    Top = 234
    Width = 25
    Height = 24
    TabOrder = 22
    Text = '15'
  end
  object Edit8: TEdit
    Left = 1643
    Top = 234
    Width = 25
    Height = 24
    TabOrder = 23
    Text = '6'
  end
  object CheckBox2: TCheckBox
    Left = 2152
    Top = 292
    Width = 78
    Height = 31
    Caption = #54620#52280#46504#50612#51652
    Checked = True
    State = cbChecked
    TabOrder = 24
  end
  object Memo2: TMemo
    Left = 1238
    Top = 800
    Width = 79
    Height = 40
    ScrollBars = ssVertical
    TabOrder = 25
  end
  object CheckBox3: TCheckBox
    Left = 2152
    Top = 273
    Width = 73
    Height = 25
    Caption = #50864#47049#51452
    Checked = True
    State = cbChecked
    TabOrder = 26
  end
  object Button7: TButton
    Left = 1764
    Top = 429
    Width = 68
    Height = 32
    Caption = #48372#47932#52286#44592'3'
    TabOrder = 27
  end
  object Edit9: TEdit
    Left = 1640
    Top = 336
    Width = 69
    Height = 24
    TabOrder = 28
  end
  object Edit10: TEdit
    Left = 1541
    Top = 369
    Width = 49
    Height = 24
    TabOrder = 29
  end
  object Edit11: TEdit
    Left = 1715
    Top = 306
    Width = 42
    Height = 24
    TabOrder = 30
  end
  object Button10: TButton
    Left = 1643
    Top = 399
    Width = 74
    Height = 29
    Caption = #48516#45817#51221#48372
    TabOrder = 31
  end
  object CheckBox4: TCheckBox
    Left = 1718
    Top = 363
    Width = 47
    Height = 31
    Caption = 'TIME'
    TabOrder = 32
  end
  object Button11: TButton
    Left = 1709
    Top = 430
    Width = 58
    Height = 31
    Caption = #48372#47932#52286#44592'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 33
  end
  object CheckBox5: TCheckBox
    Left = 2155
    Top = 333
    Width = 65
    Height = 31
    Caption = '52'#51452#52572#45824
    Checked = True
    State = cbChecked
    TabOrder = 34
  end
  object ListBox4: TListBox
    Left = 1126
    Top = 800
    Width = 109
    Height = 41
    ItemHeight = 13
    TabOrder = 35
  end
  object DBChart2: TDBChart
    Left = -116
    Top = 592
    Width = 805
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 1
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 36
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object LineSeries1: TBarSeries
      BarBrush.BackColor = clDefault
      Marks.Visible = False
      Marks.Callout.Length = 8
      DataSource = ADOQuery3
      SeriesColor = clRed
      Title = #44144#47000#47049
      XLabelsSource = 'DDATE'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAE'
    end
    object LineSeries2: TLineSeries
      DataSource = ADOQuery3
      Title = #44032#51473#52824
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAEWEIGHT'
    end
  end
  object DBChart3: TDBChart
    Left = -91
    Top = 395
    Width = 780
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 0
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    Legend.Title.Alignment = taCenter
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 37
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object LineSeries3: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clRed
      Title = #51333#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'ENDPRICE'
    end
    object LineSeries4: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clGreen
      Title = #49884#51089#44032
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'STARTPRICE'
    end
    object LineSeries5: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = 4227327
      Title = #52572#44256#44032
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'HIGHPRICE'
    end
    object LineSeries6: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clBlue
      Title = #52572#51200#44032
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'LOWPRICE'
    end
    object LineSeries7: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clBlack
      Title = '20'#54217#44512
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'DAY20'
    end
  end
  object Edit12: TEdit
    Left = 1674
    Top = 235
    Width = 29
    Height = 24
    TabOrder = 38
    Text = '-21'
  end
  object Edit13: TEdit
    Left = 1612
    Top = 234
    Width = 25
    Height = 24
    TabOrder = 39
    Text = '6'
  end
  object Edit14: TEdit
    Left = 1534
    Top = 234
    Width = 32
    Height = 24
    TabOrder = 40
    Text = '10'
  end
  object DateTimePicker2: TDateTimePicker
    Left = 1612
    Top = 279
    Width = 85
    Height = 24
    Date = 42506.000000000000000000
    Time = 0.049598368052102160
    TabOrder = 41
  end
  object ListBox7: TListBox
    Left = 718
    Top = 800
    Width = 91
    Height = 42
    ItemHeight = 13
    TabOrder = 42
  end
  object CheckBox6: TCheckBox
    AlignWithMargins = True
    Left = 1715
    Top = 337
    Width = 52
    Height = 25
    Caption = #44592#44036
    TabOrder = 43
  end
  object ScrollBar1: TScrollBar
    AlignWithMargins = True
    Left = 725
    Top = 8
    Width = 97
    Height = 25
    LargeChange = 10
    Max = 40
    Min = -20
    PageSize = 10
    TabOrder = 44
  end
  object Button12: TButton
    Left = 801
    Top = 856
    Width = 65
    Height = 25
    Caption = #48373#49324
    TabOrder = 45
  end
  object Button13: TButton
    Left = 1543
    Top = 430
    Width = 36
    Height = 31
    Caption = #48516#49437'2'
    TabOrder = 46
  end
  object Edit15: TEdit
    Left = 1596
    Top = 369
    Width = 41
    Height = 24
    TabOrder = 47
  end
  object WebBrowser1: TWebBrowser
    Left = 722
    Top = 856
    Width = 33
    Height = 25
    TabOrder = 48
    ControlData = {
      4C00000069030000950200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Button8: TButton
    Left = 1768
    Top = 397
    Width = 47
    Height = 32
    Caption = 'GOLD'
    TabOrder = 49
  end
  object ProgressBar1: TProgressBar
    Left = 876
    Top = 857
    Width = 292
    Height = 25
    Step = 1
    TabOrder = 50
  end
  object Edit16: TEdit
    Left = 1574
    Top = 188
    Width = 34
    Height = 24
    TabOrder = 51
    Text = '15'
  end
  object Button9: TButton
    Left = 1714
    Top = 188
    Width = 70
    Height = 69
    Caption = #52628#52380#51333#47785
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 52
    OnClick = Button9Click
  end
  object Button14: TButton
    Left = 1201
    Top = 857
    Width = 71
    Height = 29
    Caption = #48516#45817#51452#44032#51221#48372
    TabOrder = 53
  end
  object CheckBox7: TCheckBox
    Left = 1646
    Top = 188
    Width = 62
    Height = 31
    Caption = #51204#52404#52376#47532
    Checked = True
    State = cbChecked
    TabOrder = 54
  end
  object DBChart4: TDBChart
    Left = 687
    Top = 2
    Width = 773
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 0
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 55
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      39
      15
      39)
    ColorPaletteIndex = 13
    object LineSeries8: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clRed
      Title = #51333#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'ENDPRICE'
    end
    object LineSeries9: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clGreen
      Title = #49884#51089#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'STARTPRICE'
    end
    object LineSeries11: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = 4227327
      Title = #52572#44256#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'HIGHPRICE'
    end
    object LineSeries12: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clBlue
      Title = #52572#51200#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'LOWPRICE'
    end
    object LineSeries13: TLineSeries
      DataSource = ADOQuery1
      SeriesColor = clBlack
      Title = '20'#54217#44512
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'DAY20'
    end
  end
  object DBChart6: TDBChart
    Left = 687
    Top = 198
    Width = 773
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 1
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 56
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object BarSeries1: TBarSeries
      BarBrush.BackColor = clDefault
      Marks.Visible = False
      Marks.Callout.Length = 8
      DataSource = ADOQuery1
      SeriesColor = clRed
      Title = #44144#47000#47049
      XLabelsSource = 'DDATE'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAE'
    end
    object LineSeries14: TLineSeries
      DataSource = ADOQuery1
      Title = #44032#51473#52824
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAEWEIGHT'
    end
  end
  object DBChart7: TDBChart
    Left = 687
    Top = 395
    Width = 773
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 0
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    Legend.Title.Alignment = taCenter
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 57
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object LineSeries15: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clRed
      Title = #51333#44032
      XLabelsSource = 'DDATE'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'ENDPRICE'
    end
    object LineSeries16: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clGreen
      Title = #49884#51089#44032
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'STARTPRICE'
    end
    object LineSeries17: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = 4227327
      Title = #52572#44256#44032
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'HIGHPRICE'
    end
    object LineSeries18: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clBlue
      Title = #52572#51200#44032
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'LOWPRICE'
    end
    object LineSeries19: TLineSeries
      DataSource = ADOQuery3
      SeriesColor = clBlack
      Title = '20'#54217#44512
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'DAY20'
    end
  end
  object DBChart8: TDBChart
    Left = 687
    Top = 592
    Width = 773
    Height = 202
    BackWall.Brush.Style = bsClear
    MarginBottom = 1
    MarginLeft = 1
    MarginRight = 1
    Title.ClipText = False
    Title.Text.Strings = (
      'TDBChart')
    Legend.Alignment = laTop
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.Perspective = 48
    TabOrder = 58
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object BarSeries2: TBarSeries
      BarBrush.BackColor = clDefault
      Marks.Visible = False
      Marks.Callout.Length = 8
      DataSource = ADOQuery3
      SeriesColor = clRed
      Title = #44144#47000#47049
      XLabelsSource = 'DDATE'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAE'
    end
    object LineSeries20: TLineSeries
      DataSource = ADOQuery3
      Title = #44032#51473#52824
      Brush.BackColor = clDefault
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'GURAEWEIGHT'
    end
  end
  object GroupBox1: TGroupBox
    Left = 806
    Top = 0
    Width = 400
    Height = 44
    TabOrder = 59
    object RadioButton1: TRadioButton
      Left = 9
      Top = 13
      Width = 57
      Height = 25
      Caption = '10'#51068
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 50
      Top = 13
      Width = 44
      Height = 25
      Caption = '20'#51068
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 95
      Top = 13
      Width = 49
      Height = 25
      Caption = '40'#51068
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 140
      Top = 13
      Width = 57
      Height = 25
      Caption = '60'#51068
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 180
      Top = 13
      Width = 57
      Height = 25
      Caption = '120'#51068
      TabOrder = 4
    end
    object RadioButton6: TRadioButton
      Left = 230
      Top = 13
      Width = 49
      Height = 25
      Caption = '240'#51068
      TabOrder = 5
    end
    object RadioButton9: TRadioButton
      Left = 280
      Top = 13
      Width = 39
      Height = 25
      Caption = '3'#45380
      TabOrder = 6
    end
    object RadioButton7: TRadioButton
      Left = 315
      Top = 13
      Width = 39
      Height = 25
      Caption = '5'#45380
      TabOrder = 7
    end
    object RadioButton8: TRadioButton
      Left = 350
      Top = 13
      Width = 39
      Height = 25
      Caption = '8'#45380
      TabOrder = 8
    end
  end
  object ADOConnection1: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 616
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 488
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 664
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
    Left = 720
    Top = 8
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
    Left = 552
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 440
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 280
    Top = 8
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
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
    Left = 696
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
    Left = 760
    Top = 8
  end
  object FDConnectionMysql1: TFDConnection
    Params.Strings = (
      'User_Name=uhmtk'
      'Password=utk0803'
      'Server=localhost'
      'Database=stock_db'
      'DriverID=MySQL')
    Left = 24
    Top = 8
  end
  object FDQueryMysql1: TFDQuery
    Connection = FDConnectionMysql1
    Left = 80
    Top = 8
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 584
  end
end
