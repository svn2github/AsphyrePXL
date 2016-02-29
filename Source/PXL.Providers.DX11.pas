unit PXL.Providers.DX11;
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

uses
  PXL.Devices, PXL.Textures, PXL.Canvas, PXL.Providers;

type
  TDX11Provider = class(TGraphicsDeviceProvider)
  public
    function CreateDevice: TCustomDevice; override;
    function CreateCanvas(const Device: TCustomDevice): TCustomCanvas; override;
    function CreateLockableTexture(const Device: TCustomDevice;
      const AutoSubscribe: Boolean): TCustomLockableTexture; override;
    function CreateDrawableTexture(const Device: TCustomDevice;
      const AutoSubscribe: Boolean): TCustomDrawableTexture; override;
  end;

implementation

uses
  PXL.Devices.DX11, PXL.Textures.DX11, PXL.Canvas.DX11;

function TDX11Provider.CreateDevice: TCustomDevice;
begin
  Result := TDX11Device.Create(Self);
end;

function TDX11Provider.CreateCanvas(const Device: TCustomDevice): TCustomCanvas;
begin
  Result := TDX11Canvas.Create(Device);
end;

function TDX11Provider.CreateLockableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomLockableTexture;
begin
  Result := TDX11LockableTexture.Create(Device, AutoSubscribe);
end;

function TDX11Provider.CreateDrawableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomDrawableTexture;
begin
  Result := TDX11DrawableTexture.Create(Device, AutoSubscribe);
end;

end.
