unit StartFm;
{
  This file is part of Asphyre Framework, also known as Platform eXtended Library (PXL).
  Copyright (c) 2000 - 2016  Yuriy Kotsarenko

  The contents of this file are subject to the Mozilla Public License Version 2.0 (the "License");
  you may not use this file except in compliance with the License. You may obtain a copy of the
  License at http://www.mozilla.org/MPL/

  Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
  KIND, either express or implied. See the License for the specific language governing rights and
  limitations under the License.
}
interface

{$INCLUDE PXL.Config.inc}

{ Special note: this code was ported multiple times from earliest framework releases predating Asphyre. }

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, PXL.TypeDef, PXL.Providers;

type
  TStartForm = class(TForm)
    LogoImage: TImage;
    TopBevel: TBevel;
    NameGroup: TGroupBox;
    NameEdit: TEdit;
    ConfigGroup: TGroupBox;
    PlayButton: TBitBtn;
    CloseButton: TBitBtn;
    VSyncBox: TCheckBox;
    ProviderBox: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetVSync: Boolean;
    function GetPlayerName: UniString;
  public
    { Public declarations }
    function CreateProvider: TGraphicsDeviceProvider;

    property VSync: Boolean read GetVSync;
    property PlayerName: UniString read GetPlayerName;
  end;

var
  StartForm: TStartForm;

implementation
{$R *.dfm}

uses
  {$IFDEF CPUX86}PXL.Providers.DX7,{$ENDIF} PXL.Providers.DX9, PXL.Providers.DX11, PXL.Providers.GL;

procedure TStartForm.FormCreate(Sender: TObject);
begin
  ProviderBox.Items.Add('DirectX 11');
  ProviderBox.Items.Add('DirectX 9');
  ProviderBox.Items.Add('OpenGL');
  {$IFDEF CPUX86}
    ProviderBox.Items.Add('DirectX 7');
  {$ENDIF}
  ProviderBox.ItemIndex := 0;
end;

function TStartForm.GetVSync: Boolean;
begin
  Result := VSyncBox.Checked;
end;

function TStartForm.GetPlayerName: UniString;
begin
  Result := NameEdit.Text;
end;

function TStartForm.CreateProvider: TGraphicsDeviceProvider;
begin
  case ProviderBox.ItemIndex of
    0: Result := TDX11Provider.Create(nil);
    1: Result := TDX9Provider.Create(nil);
    2: Result := TGLProvider.Create(nil);
  {$IFDEF CPUX86}
    3: Result := TDX7Provider.Create(nil);
  {$ENDIF}
  end;
end;

end.
