inherited FMatricula: TFMatricula
  Left = 240
  Caption = 'Matr'#237'cula'
  ClientHeight = 565
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 471
  ExplicitHeight = 603
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 52
    Height = 16
    Caption = 'Matr'#237'cula'
  end
  object Label2: TLabel [1]
    Left = 72
    Top = 8
    Width = 26
    Height = 16
    Caption = 'Data'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 56
    Width = 32
    Height = 16
    Caption = 'Aluno'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 106
    Width = 113
    Height = 16
    Caption = 'Produtos e Servi'#231'os'
  end
  inherited pnButtons: TPanel
    Top = 524
    ExplicitTop = 524
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  object EdMatricula: TEdit
    Left = 8
    Top = 30
    Width = 52
    Height = 24
    TabOrder = 1
  end
  object edData: TDateEdit
    Left = 72
    Top = 30
    Width = 105
    Height = 24
    NumGlyphs = 2
    TabOrder = 2
  end
  object cbAlunos: TComboBox
    Left = 8
    Top = 78
    Width = 433
    Height = 24
    TabOrder = 3
    Text = 'cbAlunos'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 259
    Width = 433
    Height = 255
    Caption = ' Pagamentos Realizados '
    TabOrder = 4
    object StringGrid1: TStringGrid
      Left = 16
      Top = 24
      Width = 401
      Height = 217
      ColCount = 3
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 12
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      ColWidths = (
        199
        71
        101)
    end
  end
  object clbProdutos: TCheckListBox
    Left = 8
    Top = 128
    Width = 433
    Height = 113
    TabOrder = 5
  end
end
