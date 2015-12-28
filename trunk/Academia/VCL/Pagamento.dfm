inherited FPagamento: TFPagamento
  Caption = 'Pagamentos'
  OnShow = FormShow
  ExplicitWidth = 471
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 8
    Top = 40
    Width = 87
    Height = 16
    Caption = 'Referente '#224': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbDescricao: TLabel [1]
    Left = 97
    Top = 40
    Width = 74
    Height = 16
    Caption = 'lbDescricao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [2]
    Left = 8
    Top = 72
    Width = 43
    Height = 16
    Caption = 'Valor: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnInfoMatricula: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 34
    Align = alTop
    TabOrder = 1
    object lbMatricula: TLabel
      Left = 16
      Top = 8
      Width = 123
      Height = 16
      Caption = 'Matr'#237'cula: XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAluno: TLabel
      Left = 156
      Top = 8
      Width = 289
      Height = 16
      Caption = 'Aluno: XXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edValor: TRxCalcEdit
    Left = 55
    Top = 72
    Width = 121
    Height = 24
    Margins.Left = 1
    Margins.Top = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
end
