unit PXL.Providers.GLES;
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
  TGLESProvider = class(TGraphicsDeviceProvider)
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
{$IFDEF SINGLEBOARD}
  PXL.Devices.GLES.RPi,
{$ELSE}
  {$IFNDEF ANDROID}
    PXL.Devices.GLES.X,
  {$ENDIF}
{$ENDIF}

  PXL.Textures.GLES, PXL.Canvas.GLES;

function TGLESProvider.CreateDevice: TCustomDevice;
begin
{$IFNDEF ANDROID}
  Result := TGLESDevice.Create(Self);
{$ELSE}
  Result := nil;
{$ENDIF}
end;

function TGLESProvider.CreateCanvas(const Device: TCustomDevice): TCustomCanvas;
begin
  Result := TGLESCanvas.Create(Device);
end;

function TGLESProvider.CreateLockableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomLockableTexture;
begin
  Result := TGLESLockableTexture.Create(Device, AutoSubscribe);
end;

function TGLESProvider.CreateDrawableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomDrawableTexture;
begin
  Result := TGLESDrawableTexture.Create(Device, AutoSubscribe);
end;

end.
