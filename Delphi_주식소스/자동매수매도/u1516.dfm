object frm1516: Tfrm1516
  Left = 383
  Top = 142
  Caption = '[1516] '#50629#51333#48324#51333#47785#49884#49464
  ClientHeight = 507
  ClientWidth = 787
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
    Width = 787
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
    object Button1: TButton
      Left = 217
      Top = 7
      Width = 58
      Height = 25
      Caption = #51312#54924
      TabOrder = 0
      OnClick = Button1Click
    end
    object edtCode: TEdit
      Left = 60
      Top = 9
      Width = 53
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 1
      Text = '001'
    end
    object cmbType: TComboBox
      Left = 128
      Top = 8
      Width = 81
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
      Items.Strings = (
        '1.'#53076#49828#54588#50629#51333
        '2.'#53076#49828#45797#50629#51333
        '3.'#49465#53552#51648#49688)
    end
    object btnNext: TButton
      Left = 281
      Top = 7
      Width = 58
      Height = 25
      Caption = #45796#51020
      TabOrder = 3
      OnClick = btnNextClick
    end
    object XAQuery1: TXAQuery
      Left = 416
      Top = 8
      Width = 0
      Height = 0
      OnReceiveData = XAQuery1ReceiveData
      OnReceiveMessage = XAQuery1ReceiveMessage
      ControlData = {00030000D8130000D81300000800020000000000}
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 787
    Height = 441
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 1
    object sgResult: TStringGrid
      Left = 1
      Top = 100
      Width = 785
      Height = 340
      Align = alClient
      ColCount = 18
      DefaultColWidth = 70
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 93
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
    end
    object sgInfo: TStringGrid
      Left = 1
      Top = 1
      Width = 785
      Height = 99
      Align = alTop
      ColCount = 2
      DefaultColWidth = 120
      DefaultRowHeight = 18
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 1
    end
  end
  object pnlMessage: TPanel
    Left = 0
    Top = 482
    Width = 787
    Height = 25
    Align = alBottom
    TabOrder = 2
  end
end
