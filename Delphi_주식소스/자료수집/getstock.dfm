object Form1: TForm1
  Left = 237
  Top = 233
  Width = 904
  Height = 312
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 72
    Top = 240
    Width = 17
    Height = 17
    TabOrder = 0
    ControlData = {
      4C000000C2010000C20100000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Button1: TButton
    Left = 64
    Top = 96
    Width = 97
    Height = 57
    Caption = #54924#49324#44592#48376#51088#47308
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 16
    Width = 441
    Height = 21
    TabOrder = 2
    Text = 'http://finance.naver.com/sise/sise_market_sum.nhn?'
  end
  object Memo1: TMemo
    Left = 448
    Top = 72
    Width = 409
    Height = 177
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 64
    Top = 40
    Width = 441
    Height = 21
    TabOrder = 4
    Text = 'Edit2'
  end
  object GroupBox1: TGroupBox
    Left = 168
    Top = 96
    Width = 97
    Height = 57
    TabOrder = 5
    object RadioButton1: TRadioButton
      Left = 8
      Top = 8
      Width = 81
      Height = 25
      Caption = 'KOSPI'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 24
      Width = 65
      Height = 25
      Caption = 'KOSDAC'
      TabOrder = 1
    end
  end
  object Button2: TButton
    Left = 64
    Top = 160
    Width = 97
    Height = 57
    Caption = 'Daily Price'
    TabOrder = 6
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 64
    Top = 64
    Width = 89
    Height = 25
    CalAlignment = dtaLeft
    Date = 42478.6624632639
    Time = 42478.6624632639
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
  end
  object Edit3: TEdit
    Left = 160
    Top = 64
    Width = 65
    Height = 21
    TabOrder = 8
    Text = '1'
  end
  object Button3: TButton
    Left = 200
    Top = 160
    Width = 145
    Height = 73
    Caption = 'Button3'
    TabOrder = 9
    OnClick = Button3Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Passw' +
      'ord='#39'Link2sky'#39';Initial Catalog=STOCK_INFO;Data Source=localhost'
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 8
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 80
  end
end
