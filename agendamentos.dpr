program agendamentos;

uses
  Vcl.Forms,
  UAgendamentos in 'System\view\Main\UAgendamentos.pas' {Form1},
  UListaMedicos in 'System\view\Medicos\UListaMedicos.pas' {Form2},
  UListaPacientes in 'System\view\Pacientes\UListaPacientes.pas' {Form3},
  UDMConnector in 'System\core\Connector\UDMConnector.pas',
  USDServerJSClient in 'System\core\Connector\USDServerJSClient.pas',
  CAtribEntity in 'System\core\DAO\CAtribEntity.pas',
  UEntity in 'System\core\DAO\UEntity.pas',
  SD5.Fields.Types in 'System\core\DAO\SD5.Fields.Types.pas',
  UBaseView in 'System\core\BaseObject\UBaseView.pas',
  UBaseModel in 'System\core\BaseObject\UBaseModel.pas',
  UBaseController in 'System\core\BaseObject\UBaseController.pas',
  UAgendamentoController in 'System\controller\Agendamento\UAgendamentoController.pas',
  UAgendamentoModel in 'System\model\Agendamento\UAgendamentoModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTDMConnector, DMConnector);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
