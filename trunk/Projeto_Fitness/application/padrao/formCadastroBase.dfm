inherited FformCadastroBase: TFformCadastroBase
  Caption = 'FformCadastroBase'
  ClientHeight = 411
  ClientWidth = 638
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 646
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 19
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 638
    Height = 411
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    object tsPesquisa: TTabSheet
      Caption = '&Pesquisa'
      ExplicitHeight = 327
      object pnPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 630
        Height = 57
        Align = alTop
        TabOrder = 0
        object edPesquisa: TEdit
          Left = 104
          Top = 16
          Width = 433
          Height = 27
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 57
        Width = 630
        Height = 320
        Align = alClient
        DataSource = DataSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsCadastro: TTabSheet
      Caption = '&Cadastro'
      ImageIndex = 1
      ExplicitHeight = 327
      object Panel: TPanel
        Left = 0
        Top = 327
        Width = 630
        Height = 50
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 152
        ExplicitWidth = 455
        object btnNovo: TButton
          Left = 16
          Top = 16
          Width = 75
          Height = 25
          Caption = '&Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnEditar: TButton
          Left = 97
          Top = 16
          Width = 75
          Height = 25
          Caption = '&Editar'
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object btnCancelar: TButton
          Left = 258
          Top = 16
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
        object btnGravar: TButton
          Left = 339
          Top = 16
          Width = 75
          Height = 25
          Caption = '&Gravar'
          TabOrder = 3
          OnClick = btnGravarClick
        end
        object btnExcluir: TButton
          Left = 178
          Top = 16
          Width = 75
          Height = 25
          Caption = 'E&xcluir'
          TabOrder = 4
          OnClick = btnExcluirClick
        end
      end
    end
  end
  object DataSource: TDataSource
    OnStateChange = DataSourceStateChange
    Left = 472
    Top = 272
  end
end
