unit UBaseController;

interface

uses
  UBaseView, UBaseModel;

type
  TBaseController = class
  private
    FView: TBaseView;
    FModel: TBaseModel;
  public
    constructor Create(AModel: TBaseModel; AView: TBaseView); virtual;
    property Model: TBaseModel read FModel;
    property View: TBaseView read FView;
  end;

implementation

{ TBaseController }

constructor TBaseController.Create(AModel: TBaseModel; AView: TBaseView);
begin
  FModel := AModel;
  FView  := AView;
end;

end.
