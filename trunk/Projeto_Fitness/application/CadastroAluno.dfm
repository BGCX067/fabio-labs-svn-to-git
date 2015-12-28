inherited FCadastroAluno: TFCadastroAluno
  Caption = 'Cadastro Aluno'
  ClientHeight = 449
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 19
  inherited PageControl1: TPageControl
    Height = 449
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 30
      ExplicitWidth = 630
      ExplicitHeight = 377
      inherited DBGrid1: TDBGrid
        Height = 358
      end
    end
    inherited tsCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 42
        Height = 19
        Caption = 'Nome'
      end
      object Label2: TLabel [1]
        Left = 344
        Top = 16
        Width = 82
        Height = 19
        Caption = 'Nascimento'
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 72
        Width = 27
        Height = 19
        Caption = 'CPF'
      end
      object Label4: TLabel [3]
        Left = 184
        Top = 72
        Width = 43
        Height = 19
        Caption = 'E-Mail'
      end
      object Label5: TLabel [4]
        Left = 16
        Top = 128
        Width = 61
        Height = 19
        Caption = 'Telefone'
      end
      object Shape1: TShape [5]
        Left = 18
        Top = 234
        Width = 446
        Height = 1
      end
      object Label6: TLabel [6]
        Left = 16
        Top = 248
        Width = 28
        Height = 19
        Caption = 'CEP'
      end
      object Label7: TLabel [7]
        Left = 144
        Top = 248
        Width = 82
        Height = 19
        Caption = 'Logradouro'
      end
      object Label8: TLabel [8]
        Left = 584
        Top = 248
        Width = 25
        Height = 19
        Caption = 'N'#186
      end
      object Label9: TLabel [9]
        Left = 16
        Top = 304
        Width = 42
        Height = 19
        Caption = 'Bairro'
      end
      object Label10: TLabel [10]
        Left = 328
        Top = 304
        Width = 48
        Height = 19
        Caption = 'Cidade'
      end
      inherited Panel: TPanel
        Top = 365
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 40
        Width = 317
        Height = 27
        DataField = 'ALUNO_NOME'
        DataSource = DataSource
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 344
        Top = 40
        Width = 120
        Height = 27
        DataField = 'ALUNO_NASCIMENTO'
        DataSource = DataSource
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 96
        Width = 156
        Height = 27
        DataField = 'ALUNO_CPF'
        DataSource = DataSource
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 184
        Top = 96
        Width = 280
        Height = 27
        DataField = 'ALUNO_EMAIL'
        DataSource = DataSource
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 152
        Width = 156
        Height = 27
        DataField = 'ALUNO_TELEFONE'
        DataSource = DataSource
        TabOrder = 5
      end
      object pnFoto: TPanel
        Left = 470
        Top = 40
        Width = 155
        Height = 195
        BevelInner = bvSpace
        BevelKind = bkSoft
        TabOrder = 6
        object DBImage1: TDBImage
          Left = 0
          Top = 0
          Width = 148
          Height = 188
          DataField = 'ALUNO_FOTO'
          DataSource = DataSource
          TabOrder = 0
          OnDblClick = DBImage1DblClick
        end
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 273
        Width = 113
        Height = 27
        DataField = 'ALUNO_CEP'
        DataSource = DataSource
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 16
        Top = 329
        Width = 300
        Height = 27
        DataField = 'ALUNO_BAIRRO'
        DataSource = DataSource
        TabOrder = 8
      end
      object DBEdit7: TDBEdit
        Left = 144
        Top = 273
        Width = 69
        Height = 27
        DataField = 'ALUNO_TIPO_LOGRADOURO'
        DataSource = DataSource
        TabOrder = 9
      end
      object DBEdit8: TDBEdit
        Left = 224
        Top = 273
        Width = 347
        Height = 27
        DataField = 'ALUNO_LOGRADOURO'
        DataSource = DataSource
        TabOrder = 10
      end
      object DBEdit10: TDBEdit
        Left = 328
        Top = 329
        Width = 297
        Height = 27
        DataField = 'ALUNO_CIDADE'
        DataSource = DataSource
        TabOrder = 11
      end
      object DBEdit11: TDBEdit
        Left = 584
        Top = 273
        Width = 41
        Height = 27
        DataField = 'ALUNO_NUMERO'
        DataSource = DataSource
        TabOrder = 12
      end
    end
  end
  inherited DataSource: TDataSource
    DataSet = Aluno.CDSAluno
  end
  object OpenDialog: TOpenDialog
    Left = 312
    Top = 232
  end
end
