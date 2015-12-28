unit Afga.API.Core.ProgressListener;

interface

type
  IProgressListener = interface
    procedure setMax(value : integer);
    procedure setPosition(value : integer);
  end;

implementation

end.
