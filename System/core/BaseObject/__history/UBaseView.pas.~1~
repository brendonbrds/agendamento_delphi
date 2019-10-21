unit UBaseView;

interface

uses
  Vcl.Forms, UBaseModel, System.Classes;

type
  TBaseView = class(TForm)
  private
    FDataSet: TBaseModel;
  public
    constructor Create(ADataSet: TBaseModel); overload;
    property DataSet: TBaseModel read FDataSet;
    procedure Show(sParam: string); overload;
  end;

implementation

{ TBaseView }

constructor TBaseView.Create(ADataSet: TBaseModel);
begin
  inherited Create(nil);
  Self.FDataSet := ADataSet;
end;

procedure TBaseView.Show(sParam: string);
begin
  if sParam <> '' then
  begin
    Self.DataSet.GET(sParam);
  end;
  inherited ShowModal;
end;

end.
