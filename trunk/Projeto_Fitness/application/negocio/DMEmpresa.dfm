object Empresa: TEmpresa
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
  object CDSEmpresa: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_empresa'
    Params = <>
    ProviderName = 'DataSetProvider'
    BeforePost = CDSEmpresaBeforePost
    Left = 128
    Top = 24
  end
end
