unit PXL.Textures.SRT;
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
  PXL.Types, PXL.Surfaces, PXL.Textures;

type
  TSRTLockableTexture = class(TCustomLockableTexture)
  private
    FSurface: TPixelSurface;
  protected
    function DoInitialize: Boolean; override;
    procedure DoFinalize; override;
  public
    function DoLock(const Rect: TIntRect; out LockedPixels: TLockedPixels): Boolean; override;
    function DoUnlock: Boolean; override;

    property Surface: TPixelSurface read FSurface;
  end;

implementation

uses
  SysUtils;

function TSRTLockableTexture.DoInitialize: Boolean;
begin
  if (Width < 1) or (Height < 1) then
    Exit(False);

  if FSurface = nil then
    FSurface := TPixelSurface.Create;

  FSurface.SetSize(Width, Height, FPixelFormat);

  FPixelFormat := FSurface.PixelFormat;
  FBytesPerPixel := FSurface.BytesPerPixel;

  FSurface.Clear(0);
  Result := True;
end;

procedure TSRTLockableTexture.DoFinalize;
begin
  FreeAndNil(FSurface);
end;

function TSRTLockableTexture.DoLock(const Rect: TIntRect; out LockedPixels: TLockedPixels): Boolean;
begin
  Result := LockSurface(FSurface, Rect, LockedPixels);
end;

function TSRTLockableTexture.DoUnlock: Boolean;
begin
  Result := True;
end;

end.
