object Usuario: TUsuario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object DataSetProvider: TDataSetProvider
    DataSet = Persistencia.SQLDataSet
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 40
    Top = 24
  end
  object CDSUsuario: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_usuario'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    BeforePost = CDSUsuarioBeforePost
    Left = 144
    Top = 24
  end
end
