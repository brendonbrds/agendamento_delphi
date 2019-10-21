unit UDMConnector;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, USDServerJSClient,
  Vcl.Forms;

type
  TTDMConnector = class(TDataModule)
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SDClient: TSDServerJSClient;
  end;

var
  DMConnector: TTDMConnector;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

procedure TTDMConnector.DataModuleCreate(Sender: TObject);
begin

  SDClient := TSDServerJSClient.Create('167.71.177.248', '3333', RESTClient1,
    RESTRequest1, RESTResponse1, RESTResponseDataSetAdapter1);

  if SDClient = nil then
  begin
    raise Exception.Create('Erro ao conectar ao tentar conectar API');
    Application.Terminate;
  end;

end;

end.
