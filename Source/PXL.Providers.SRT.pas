unit PXL.Providers.SRT;
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
  TSRTProvider = class(TGraphicsDeviceProvider)
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
  PXL.Devices.SRT, PXL.Textures.SRT, PXL.Canvas.SRT;

function TSRTProvider.CreateDevice: TCustomDevice;
begin
  Result := TSRTDevice.Create(Self);
end;

function TSRTProvider.CreateCanvas(const Device: TCustomDevice): TCustomCanvas;
begin
  Result := TSRTCanvas.Create(Device);
end;

function TSRTProvider.CreateLockableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomLockableTexture;
begin
  Result := TSRTLockableTexture.Create(Device, AutoSubscribe);
end;

function TSRTProvider.CreateDrawableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomDrawableTexture;
begin
  Result := nil;
end;

end.
