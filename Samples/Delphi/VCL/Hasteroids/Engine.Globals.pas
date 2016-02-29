unit Engine.Globals;
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
  PXL.Types, PXL.SwapChains, PXL.Canvas, PXL.Images, PXL.Fonts, PXL.Archives;

var
  DisplaySize: TPoint2px;

  EngineDevice: TCustomSwapChainDevice = nil;
  EngineCanvas: TCustomCanvas = nil;
  EngineImages: TAtlasImages = nil;
  EngineFonts: TBitmapFonts = nil;
  EngineArchive: TArchive = nil;

  ImageBackground: Integer = -1;
  ImageShipArmor: Integer = -1;
  ImageCShineLogo: Integer = -1;
  ImageBandLogo: Integer = -1;
  ImageLogo: Integer = -1;
  ImageShip: Integer = -1;
  ImageRock: Integer = -1;
  ImageTorpedo: Integer = -1;
  ImageExplode: Integer = -1;
  ImageCombust: Integer = -1;

  FontArialBlack: Integer = -1;
  FontTimesRoman: Integer = -1;
  FontImpact: Integer = -1;

implementation

end.
