object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'PDV'
  ClientHeight = 591
  ClientWidth = 981
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
    Left = 17
    Top = 575
    Width = 98
    Height = 13
    Caption = 'Finalizar Venda = F7'
  end
  object pnDescricaoItem: TPanel
    Left = 16
    Top = 472
    Width = 945
    Height = 97
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Panel12: TPanel
      Left = 1
      Top = 1
      Width = 943
      Height = 24
      Align = alTop
      Caption = 'DESCRI'#199#195'O DO ITEM'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnTotalVenda: TPanel
    Left = 16
    Top = 264
    Width = 528
    Height = 97
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 526
      Height = 24
      Align = alTop
      Caption = 'TOTAL VENDA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnQTD: TPanel
    Left = 284
    Top = 368
    Width = 173
    Height = 97
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Panel9: TPanel
      Left = 1
      Top = 1
      Width = 171
      Height = 24
      Align = alTop
      Caption = 'QTD.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnPrecoUnitario: TPanel
    Left = 463
    Top = 368
    Width = 219
    Height = 97
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Panel10: TPanel
      Left = 1
      Top = 1
      Width = 217
      Height = 24
      Align = alTop
      Caption = 'PRE'#199'O UNIT'#193'RIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnTotalItem: TPanel
    Left = 688
    Top = 368
    Width = 273
    Height = 97
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 271
      Height = 24
      Align = alTop
      Caption = 'TOTAL ITEM'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnInfoGeral: TPanel
    Left = 16
    Top = 8
    Width = 529
    Height = 97
    TabOrder = 5
  end
  object pnCodigo: TPanel
    Left = 17
    Top = 368
    Width = 263
    Height = 97
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -67
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Panel15: TPanel
      Left = 1
      Top = 1
      Width = 261
      Height = 24
      Align = alTop
      Caption = 'CODIGO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edCodigo: TEdit
      Left = 1
      Top = 25
      Width = 261
      Height = 71
      Align = alClient
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edCodigoExit
      ExplicitHeight = 66
    end
  end
  object pnCumpoFiscal: TPanel
    Left = 551
    Top = 8
    Width = 410
    Height = 353
    TabOrder = 7
    object Panel13: TPanel
      Left = 1
      Top = 1
      Width = 408
      Height = 24
      Align = alTop
      Caption = 'CUPOM FISCAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object reCupomFiscal: TRichEdit
      Left = 4
      Top = 26
      Width = 402
      Height = 324
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnLogo: TPanel
    Left = 16
    Top = 111
    Width = 529
    Height = 146
    TabOrder = 8
    object imLogo: TImage
      Left = 1
      Top = 1
      Width = 527
      Height = 144
      Align = alClient
      ExplicitLeft = 168
      ExplicitTop = 56
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object ActionList: TActionList
    Left = 480
    Top = 56
    object acFinalizarVenda: TAction
      Caption = 'acFinalizarVenda'
      ShortCut = 118
      OnExecute = acFinalizarVendaExecute
    end
  end
end
