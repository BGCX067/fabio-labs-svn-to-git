unit Reaproveitamento.Extintor.Excecoes;

interface

uses
  SysUtils;

type
  TExcecaoAdicionar = class(Exception)

  end;

  TExcecaoObter = class(Exception)

  end;

  TExcecaoProximoId = class(Exception)

  end;

  TExcexaoLazyLoad = class(Exception)

  end;

  TExcecaoModificar = class(Exception)

  end;

  TExcecaoRemover = class(Exception)

  end;

implementation

end.
