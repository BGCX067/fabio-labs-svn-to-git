object FMenu: TFMenu
  Left = 0
  Top = 0
  Caption = 'FMenu'
  ClientHeight = 426
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ActionMainMenuBar: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 672
    Height = 25
    UseSystemFont = False
    ActionManager = ActionManager
    Caption = 'ActionMainMenuBar'
    Color = clMenuBar
    ColorMap.HighlightColor = clWhite
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Spacing = 0
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = Aluno
                Caption = '&Aluno'
              end
              item
                Action = actCadastroProdutos
                Caption = '&Produtos e Servi'#231'os'
              end>
            Caption = '&Cadastros'
          end
          item
            Action = Matricula
            Caption = '&Matricula'
          end
          item
            Action = Sair
            Caption = '&Sair'
          end>
        ActionBar = ActionMainMenuBar
      end>
    Left = 120
    Top = 144
    StyleName = 'Platform Default'
    object Aluno: TAction
      Category = 'Cadastros'
      Caption = 'Aluno'
      OnExecute = AlunoExecute
    end
    object Matricula: TAction
      Caption = 'Matricula'
      OnExecute = MatriculaExecute
    end
    object Sair: TAction
      Caption = 'Sair'
      OnExecute = SairExecute
    end
    object actCadastroProdutos: TAction
      Category = 'Cadastros'
      Caption = 'Produtos e Servi'#231'os'
      OnExecute = actCadastroProdutosExecute
    end
  end
end
