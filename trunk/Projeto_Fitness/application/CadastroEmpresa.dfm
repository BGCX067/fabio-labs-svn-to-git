inherited FCadastroEmpresa: TFCadastroEmpresa
  Caption = 'Cadastro Empresa'
  ClientHeight = 481
  ClientWidth = 646
  ExplicitWidth = 654
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 19
  inherited PageControl1: TPageControl
    Width = 646
    Height = 481
    ActivePage = tsCadastro
    ExplicitWidth = 643
    ExplicitHeight = 396
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 635
      ExplicitHeight = 362
      inherited pnPesquisa: TPanel
        Width = 638
        ExplicitWidth = 635
      end
      inherited DBGrid1: TDBGrid
        Width = 638
        Height = 390
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 635
      ExplicitHeight = 362
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 37
        Height = 19
        Caption = 'CNPJ'
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 80
        Width = 88
        Height = 19
        Caption = 'Raz'#227'o Social'
      end
      object Label3: TLabel [2]
        Left = 328
        Top = 80
        Width = 104
        Height = 19
        Caption = 'Nome Fantasia'
      end
      object Label4: TLabel [3]
        Left = 16
        Top = 144
        Width = 61
        Height = 19
        Caption = 'Telefone'
      end
      object Label5: TLabel [4]
        Left = 16
        Top = 208
        Width = 28
        Height = 19
        Caption = 'CEP'
      end
      object Label6: TLabel [5]
        Left = 144
        Top = 208
        Width = 82
        Height = 19
        Caption = 'Logradouro'
      end
      object Label7: TLabel [6]
        Left = 584
        Top = 208
        Width = 19
        Height = 19
        Caption = 'N'#186
      end
      object Label8: TLabel [7]
        Left = 16
        Top = 264
        Width = 42
        Height = 19
        Caption = 'Bairro'
      end
      object Label9: TLabel [8]
        Left = 328
        Top = 264
        Width = 48
        Height = 19
        Caption = 'Cidade'
      end
      inherited Panel: TPanel
        Top = 397
        Width = 638
        ExplicitTop = 312
        ExplicitWidth = 635
      end
      object edCNPJ: TDBEdit
        Left = 16
        Top = 41
        Width = 237
        Height = 27
        DataField = 'EMPRESA_CNPJ'
        DataSource = DataSource
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 105
        Width = 300
        Height = 27
        DataField = 'EMPRESA_RAZAO'
        DataSource = DataSource
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 169
        Width = 156
        Height = 27
        DataField = 'EMPRESA_TELEFONE'
        DataSource = DataSource
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 233
        Width = 113
        Height = 27
        DataField = 'EMPRESA_CEP'
        DataSource = DataSource
        TabOrder = 4
      end
      object DBEdit9: TDBEdit
        Left = 16
        Top = 289
        Width = 300
        Height = 27
        DataField = 'EMPRESA_BAIRRO'
        DataSource = DataSource
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 144
        Top = 233
        Width = 69
        Height = 27
        DataField = 'EMPRESA_TIPO_LOGRADOURO'
        DataSource = DataSource
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 224
        Top = 233
        Width = 345
        Height = 27
        DataField = 'EMPRESA_LOGRADOURO'
        DataSource = DataSource
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 328
        Top = 289
        Width = 300
        Height = 27
        DataField = 'EMPRESA_CIDADE'
        DataSource = DataSource
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 584
        Top = 233
        Width = 44
        Height = 27
        DataField = 'EMPRESA_NUMERO'
        DataSource = DataSource
        TabOrder = 9
      end
      object DBEdit3: TDBEdit
        Left = 328
        Top = 105
        Width = 300
        Height = 27
        DataField = 'EMPRESA_FANTASIA'
        DataSource = DataSource
        TabOrder = 10
      end
    end
  end
  inherited DataSource: TDataSource
    DataSet = Empresa.CDSEmpresa
    Left = 592
    Top = 16
  end
end
