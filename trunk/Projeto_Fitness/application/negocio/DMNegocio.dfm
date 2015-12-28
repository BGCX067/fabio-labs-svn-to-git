object Negocio: TNegocio
  OldCreateOrder = False
  Height = 263
  Width = 401
  object CDSUsuario: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_usuario'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 144
    Top = 24
  end
  object DataSetProvider: TDataSetProvider
    DataSet = Persistencia.SQLDataSet
    Left = 40
    Top = 24
  end
  object CDSEmpresa: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_empresa'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 144
    Top = 80
  end
  object CDSAluno: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_aluno'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 144
    Top = 144
  end
  object CDSMatricula: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_matricula'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 224
    Top = 24
  end
  object CDSProduto: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_produto'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 224
    Top = 80
  end
end
