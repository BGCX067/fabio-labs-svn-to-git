unit Reaproveitamento.Hospitalar.Repositorio;

interface

uses
  Reaproveitamento.Hospitalar.Negocio,
  generics.Collections;

type
  IRepositorio<T> = Interface
    function obterLista():TList<T>;
  end;

  TRepositorioProfissional = class(TInterfacedObject, IRepositorio<TProfissional>)
  public
    function obterLista():TList<TProfissional>;
  end;

  TRepositorioMedicamento = class(TInterfacedObject, IRepositorio<TMedicamento>)
  public
    function obterLista():TList<TMedicamento>;
  end;

implementation

{ TRepositorio }

function TRepositorioMedicamento.obterLista: TList<TMedicamento>;
var
  Membendazol,
  Aspirina,
  Aciclovir,
  SoroFisiologico,
  DipironaComp,
  DipironaAmp : TMedicamento;
begin
  Result := TList<TMedicamento>.Create();
  try
    // Medicamentos
    Membendazol := TMedicamento.Create;
    Membendazol.Id := 1;
    Membendazol.Descricao := 'MEMBENDAZOL';

    Aspirina := TMedicamento.Create;
    Aspirina.Id := 2;
    Aspirina.Descricao := 'ASPIRINA';
    Aspirina.Intervalo :=  '12H';
    Aspirina.Dose := '2';
    Aspirina.Unidade := 'COMP';
    Aspirina.Via := 'ORAL';

    SoroFisiologico := TMedicamento.Create;
    SoroFisiologico.Id := 3;
    SoroFisiologico.Descricao := 'SORO FISIOLOGICO FR 1000ML 0,9%';
    SoroFisiologico.Intervalo :=  '12H';
    SoroFisiologico.Dose := '2';
    SoroFisiologico.Unidade := 'FR';
    SoroFisiologico.Via := 'ENDOVENOSA';

    Aciclovir := TMedicamento.Create;
    Aciclovir.Id := 4;
    Aciclovir.Descricao := 'ACICLOVIR COMP 200 MG';
    Aciclovir.Intervalo :=  '12H';
    Aciclovir.Dose := '2';
    Aciclovir.Unidade := 'COMP';
    Aciclovir.Via := 'ORAL';

    DipironaComp := TMedicamento.Create;
    DipironaComp.Id := 5;
    DipironaComp.Descricao := 'DIPIRONA COMP 125MG';
    DipironaComp.Unidade := 'COMP';
    DipironaComp.Intervalo :=  '12H';
    DipironaComp.Dose := '2';
    DipironaComp.Unidade := 'COMP';
    DipironaComp.Via := 'ORAL';

    DipironaAmp := TMedicamento.create;
    DipironaAmp.Id := 6;
    DipironaAmp.Descricao := 'DIPIRONA AMP 1 G/2 ML';
    DipironaAmp.Unidade := 'AMP';
    DipironaAmp.Intervalo :=  '12H';
    DipironaAmp.Dose := '2';
    DipironaAmp.Unidade := 'COMP';
    DipironaAmp.Via := 'ORAL';

    Result.Add(Membendazol);
    Result.Add(Aspirina);
    Result.Add(SoroFisiologico);
    Result.Add(Aciclovir);
    Result.Add(DipironaComp);
    Result.Add(DipironaAmp);
  finally
  end;
end;

function TRepositorioProfissional.obterLista: TList<TProfissional>;
var
  DrMario, DrMaria : TProfissional;
begin
  Result := TList<TProfissional>.Create();
  try
    // Médicos
    DrMario := TProfissional.Create;
    DrMario.Id := 1;
    DrMario.Name := 'RESPONSÁVEL: MÁRIO MELO DA SILVA';

    DrMaria := TProfissional.Create;
    DrMaria.Id := 2;
    DrMaria.Name := 'RESPONSÁVEL: KATIA MARA R ROCATTO';

    Result.Add(DrMario);
    Result.Add(DrMaria);
  finally
  end;
end;

//class function TRepositorio.obterPrescricoes: TList<TObject>;
//var
//  Prescricao1, Prescricao2, Prescricao3, Prescricao4: TMedicamento;
//begin
//  // Prescrições
//  Result := TList<TObject>.Create();
//
//  Prescricao1 := TMedicamento.Create;
//  Prescricao1.Id := 2;
//  Prescricao1.Descricao := 'DIPIRONA AMP 1 G/2 ML';
//  Prescricao1.Dose := '1';
//  Prescricao1.Unidade := 'COMP';
//  Prescricao1.Intervalo := '10/10 HORAS';
//  Prescricao1.Via := 'ENDOVENOSA';
//  Prescricao1.Medico := TRepositorio.obterMedicos[1];
//  Prescricao1.Horarios := '00:00';
//  Prescricao1.Itens.Add( TMedicamento.Create(2, TRepositorio.obterMedicamentos[3].Descricao, '12H', '2', 'COMP', 'ORAL') );
//  Prescricao1.Itens.Add( TMedicamento.Create(2, TRepositorio.obterMedicamentos[2].Descricao, '12H', '2', 'FR', 'ORAL') );
////
//  Prescricao2 := TMedicamento.Create;
//  Prescricao2.Id := 3;
//  Prescricao2.Descricao := 'DIPIRONA COMP 125MG';
//  Prescricao2.Dose := '1';
//  Prescricao2.Unidade := 'COMP';
//  Prescricao2.Intervalo := '10/10hs';
//  Prescricao2.Via := 'ORAL';
//  Prescricao2.Medico := TRepositorio.obterMedicos[0];
//  Prescricao2.Horarios := '12:00';
//
//  Prescricao3 := TMedicamento.Create;
//  Prescricao3.Id := 4;
//  Prescricao3.Descricao := 'DIPIRONA COMP 125MG';
//  Prescricao3.Dose := '1';
//  Prescricao3.Unidade := 'COMP';
//  Prescricao3.Intervalo := '10/10hs';
//  Prescricao3.Via := 'ORAL';
//  Prescricao3.Medico := TRepositorio.obterMedicos[0];
//  Prescricao3.Horarios := '00:00';
//  Prescricao3.Itens.Add( TMedicamento.Create(4, TRepositorio.obterMedicamentos[3].Descricao, '12H', '2', 'COMP', 'ORAL') );
//  Prescricao3.Itens.Add( TMedicamento.Create(4, TRepositorio.obterMedicamentos[2].Descricao, '12H', '2', 'FR', 'ORAL') );
//  Prescricao3.Itens.Add( TMedicamento.Create(4, TRepositorio.obterMedicamentos[0].Descricao, '12H', '2', 'FR', 'ORAL') );
//  Prescricao3.Itens.Add( TMedicamento.Create(4, TRepositorio.obterMedicamentos[1].Descricao, '12H', '2', 'FR', 'ORAL') );
//
//  Result.Add(Prescricao1);
//  Result.Add(Prescricao2);
//  Result.Add(Prescricao3);
//end;

end.
