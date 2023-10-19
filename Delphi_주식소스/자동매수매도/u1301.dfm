object frm1301: Tfrm1301
  Left = 261
  Top = 123
  Caption = '[1301] '#51452#49885#49884#44036#45824#48324#52404#44208#51312#54924
  ClientHeight = 527
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 44
      Height = 13
      Caption = #51333#47785#53076#46300
    end
    object btnQuery: TButton
      Left = 185
      Top = 7
      Width = 58
      Height = 25
      Caption = #51312#54924
      TabOrder = 0
      OnClick = btnQueryClick
    end
    object edtCode: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 1
      Text = '000020'
    end
    object btnNext: TButton
      Left = 249
      Top = 7
      Width = 58
      Height = 25
      Caption = #45796#51020
      Enabled = False
      TabOrder = 2
      OnClick = btnNextClick
    end
    object XAQuery1: TXAQuery
      Left = 392
      Top = 8
      Width = 0
      Height = 0
      OnReceiveData = XAQuery1ReceiveData
      OnReceiveMessage = XAQuery1ReceiveMessage
      ControlData = {
        00030000D8130000D81300000800220000002E002F0049004F002F0074003100
        3300300031005F0032002E007200650073000000}
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 785
    Height = 461
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 1
    object sgResult: TStringGrid
      Left = 1
      Top = 42
      Width = 783
      Height = 418
      Align = alClient
      ColCount = 13
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 93
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      ColWidths = (
        62
        66
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 783
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 20
        Top = 14
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #49884#51089#49884#44036
      end
      object Label3: TLabel
        Left = 168
        Top = 15
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #51333#47308#49884#44036
      end
      object edtStTime: TEdit
        Left = 79
        Top = 10
        Width = 81
        Height = 21
        ImeName = 'Microsoft IME 2003'
        TabOrder = 0
        Text = '0900'
      end
      object edtEndTime: TEdit
        Left = 227
        Top = 11
        Width = 81
        Height = 21
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
        Text = '1500'
      end
    end
  end
  object pnlMessage: TPanel
    Left = 0
    Top = 502
    Width = 785
    Height = 25
    Align = alBottom
    TabOrder = 2
  end
end
