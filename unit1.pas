unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, INIFiles, Forms, Controls, Graphics, Dialogs,
  EditBtn, LResources, StdCtrls, ExtCtrls, ExtDlgs, LCLType, LCLIntf, Buttons,
  Menus, ComCtrls, prAdditional, CrpImg, prProgressForm, types,
  dateutils, Clipbrd, LCLProc;

type

  { TForm1 }
  TForm1 = class(TForm)
    prPPMenuGetFileDate: TMenuItem;
    prPopupMenuFile: TPopupMenu;
    prPPMenuGetRefDate: TMenuItem;
    prCheckBoxCopyPrName: TCheckBox;
    prCheckBoxCutPrName30: TCheckBox;
    prMemoTemp: TMemo;
    prBitBtn_donate: TBitBtn;
    prCheckBox_OneReleasePerFile: TCheckBox;
    prBitBtn_Help: TBitBtn;
    prPPMenuReset: TMenuItem;
    prImage3: TImage;
    prPPMenuRotate: TMenuItem;
    prPPMenuItemRotateYES90: TMenuItem;
    prPPMenuItemRotateNO90: TMenuItem;
    prPPMenuCrop: TMenuItem;
    prListBoxFile: TListBox;
    prPPMenuDelete: TMenuItem;
    prPanel1: TPanel;
    prPopupMenuRef: TPopupMenu;
    prEditCustomTitle: TEdit;
    prGroupBoxFile: TGroupBox;
    prImage_OSign: TImage;
    prImage_PSign: TImage;
    prImage_WSign: TImage;
    prLabelSelFile: TLabel;
    prButtonCreate: TButton;
    prImage2: TImage;
    prEdit_OPhone: TEdit;
    prEdit_ODate: TDateEdit;
    prEdit_PDate: TDateEdit;
    prEdit_PEmail: TEdit;
    prEdit_OEmail: TEdit;
    prEdit_WDate: TDateEdit;
    prEdit_WName: TEdit;
    prEdit_PZipCode: TEdit;
    prEdit_OZipCode: TEdit;
    prEdit_PPhone: TEdit;
    prCheckBox_Nearly: TCheckBox;
    prCheckBox_Self: TCheckBox;
    Image_temp: TImage;
    prEdit_Name: TEdit;
    prImageFORM: TImage;
    prEdit_PAddress: TEdit;
    prEdit_OwnerName: TEdit;
    prEdit_OAddress: TEdit;
    prEdit_PCity: TEdit;
    prEdit_OCity: TEdit;
    prEdit_PCountry: TEdit;
    prEdit_OCountry: TEdit;
    prSB_ODate: TSpeedButton;
    prSB_WDate: TSpeedButton;
    prSB_PSignature: TSpeedButton;
    prSB_PDate: TSpeedButton;
    prSB_WSignature: TSpeedButton;
    prShape_WDate: TShape;
    prShape_PAddress: TShape;
    prShape_OwnerName: TShape;
    prShape_OAddress: TShape;
    prShape_PCity: TShape;
    prShape_OCity: TShape;
    prShape_PCountry: TShape;
    prShape_OCountry: TShape;
    prShape_OPhone: TShape;
    prShape_ODate: TShape;
    prShape_PEmail: TShape;
    prShape_OEmail: TShape;
    prShape_PDate: TShape;
    prShape_WName: TShape;
    prShape_PZipCode: TShape;
    prShape_OZipCode: TShape;
    prShape_PPhone: TShape;
    prSpeedButtonFile: TSpeedButton;
    prSpeedButtonFileClear: TSpeedButton;
    prSpeedButtonFileDelete: TSpeedButton;
    prScrollBox1: TScrollBox;
    prShape_Name: TShape;
    prSB_OSignature: TSpeedButton;
    prSB_Add: TSpeedButton;
    prStatusBar: TStatusBar;
    pr_SB_DelAllSketches: TSpeedButton;
    procedure FormClick(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure prBitBtn_donateClick(Sender: TObject);
    procedure prBitBtn_HelpClick(Sender: TObject);
    procedure prCheckBox_OneReleasePerFileClick(Sender: TObject);
    procedure prListBoxFileClick(Sender: TObject);
    procedure prListBoxFileContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure prPanel1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure prPanel1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure prPPMenuGetFileDateClick(Sender: TObject);
    procedure prPPMenuGetRefDateClick(Sender: TObject);
    procedure prPPMenuItemRotateYES90Click(Sender: TObject);
    procedure prPPMenuItemRotateNO90Click(Sender: TObject);
    procedure prPPMenuCropClick(Sender: TObject);
    procedure prPanel1DblClick(Sender: TObject);
    procedure prPPMenuDeleteClick(Sender: TObject);
    procedure prButtonCreateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure prEditCustomTitleKeyPress(Sender: TObject; var Key: char);
    procedure prImageFORMClick(Sender: TObject);
    procedure prImageFORMMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure prImageFORMMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure prCheckBox_SelfClick(Sender: TObject);
    procedure prEdit_NameChange(Sender: TObject);
    procedure prEdit_NameClick(Sender: TObject);
    procedure prEdit_NameKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OAddressClick(Sender: TObject);
    procedure prEdit_OAddressKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OCityClick(Sender: TObject);
    procedure prEdit_OCityKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OCountryClick(Sender: TObject);
    procedure prEdit_OCountryKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_ODateChange(Sender: TObject);
    procedure prEdit_ODateClick(Sender: TObject);
    procedure prEdit_ODateKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OEmailClick(Sender: TObject);
    procedure prEdit_OEmailKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OPhoneClick(Sender: TObject);
    procedure prEdit_OPhoneKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OwnerNameClick(Sender: TObject);
    procedure prEdit_OwnerNameKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_OZipCodeClick(Sender: TObject);
    procedure prEdit_OZipCodeKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PAddressChange(Sender: TObject);
    procedure prEdit_PAddressClick(Sender: TObject);
    procedure prEdit_PAddressKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PCityChange(Sender: TObject);
    procedure prEdit_PCityClick(Sender: TObject);
    procedure prEdit_PCityKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PCountryChange(Sender: TObject);
    procedure prEdit_PCountryClick(Sender: TObject);
    procedure prEdit_PCountryKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PDateChange(Sender: TObject);
    procedure prEdit_PDateClick(Sender: TObject);
    procedure prEdit_PDateKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PEmailChange(Sender: TObject);
    procedure prEdit_PEmailClick(Sender: TObject);
    procedure prEdit_PEmailKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PPhoneChange(Sender: TObject);
    procedure prEdit_PPhoneClick(Sender: TObject);
    procedure prEdit_PPhoneKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_PZipCodeChange(Sender: TObject);
    procedure prEdit_PZipCodeClick(Sender: TObject);
    procedure prEdit_PZipCodeKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_WDateChange(Sender: TObject);
    procedure prEdit_WDateClick(Sender: TObject);
    procedure prEdit_WDateKeyPress(Sender: TObject; var Key: char);
    procedure prEdit_WNameClick(Sender: TObject);
    procedure prEdit_WNameKeyPress(Sender: TObject; var Key: char);
    procedure prImage_OSignDblClick(Sender: TObject);
    procedure prImage_PSignDblClick(Sender: TObject);
    procedure prImage_WSignDblClick(Sender: TObject);
    procedure prListBoxFileDblClick(Sender: TObject);
    procedure prListBoxFileDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure prListBoxFileDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure prListBoxFileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prListBoxFileSelectionChange(Sender: TObject; User: boolean);
    procedure prPPMenuResetClick(Sender: TObject);
    procedure prSB_AddClick(Sender: TObject);
    procedure prSB_ODateClick(Sender: TObject);
    procedure prSB_ODateMouseEnter(Sender: TObject);
    procedure prSB_ODateMouseLeave(Sender: TObject);
    procedure prSB_OSignatureClick(Sender: TObject);
    procedure prSB_PDateClick(Sender: TObject);
    procedure prSB_PDateMouseEnter(Sender: TObject);
    procedure prSB_PDateMouseLeave(Sender: TObject);
    procedure prSB_PSignatureClick(Sender: TObject);
    procedure prSB_WDateClick(Sender: TObject);
    procedure prSB_WDateMouseEnter(Sender: TObject);
    procedure prSB_WDateMouseLeave(Sender: TObject);
    procedure prSB_WSignatureClick(Sender: TObject);
    procedure prShape_NameMouseEnter(Sender: TObject);
    procedure prShape_NameMouseLeave(Sender: TObject);
    procedure prShape_OAddressMouseEnter(Sender: TObject);
    procedure prShape_OAddressMouseLeave(Sender: TObject);
    procedure prShape_OCityMouseEnter(Sender: TObject);
    procedure prShape_OCityMouseLeave(Sender: TObject);
    procedure prShape_OCountryMouseEnter(Sender: TObject);
    procedure prShape_OCountryMouseLeave(Sender: TObject);
    procedure prShape_ODateMouseEnter(Sender: TObject);
    procedure prShape_ODateMouseLeave(Sender: TObject);
    procedure prShape_OEmailMouseEnter(Sender: TObject);
    procedure prShape_OEmailMouseLeave(Sender: TObject);
    procedure prShape_OPhoneMouseEnter(Sender: TObject);
    procedure prShape_OPhoneMouseLeave(Sender: TObject);
    procedure prShape_OwnerNameMouseEnter(Sender: TObject);
    procedure prShape_OwnerNameMouseLeave(Sender: TObject);
    procedure prShape_OZipCodeMouseEnter(Sender: TObject);
    procedure prShape_OZipCodeMouseLeave(Sender: TObject);
    procedure prShape_PAddressMouseEnter(Sender: TObject);
    procedure prShape_PAddressMouseLeave(Sender: TObject);
    procedure prShape_PCityMouseEnter(Sender: TObject);
    procedure prShape_PCityMouseLeave(Sender: TObject);
    procedure prShape_PCountryMouseEnter(Sender: TObject);
    procedure prShape_PCountryMouseLeave(Sender: TObject);
    procedure prShape_PDateMouseEnter(Sender: TObject);
    procedure prShape_PDateMouseLeave(Sender: TObject);
    procedure prShape_PEmailMouseEnter(Sender: TObject);
    procedure prShape_PEmailMouseLeave(Sender: TObject);
    procedure prShape_PPhoneMouseEnter(Sender: TObject);
    procedure prShape_PPhoneMouseLeave(Sender: TObject);
    procedure prShape_PZipCodeMouseEnter(Sender: TObject);
    procedure prShape_PZipCodeMouseLeave(Sender: TObject);
    procedure prShape_WDateMouseEnter(Sender: TObject);
    procedure prShape_WDateMouseLeave(Sender: TObject);
    procedure prShape_WNameMouseEnter(Sender: TObject);
    procedure prShape_WNameMouseLeave(Sender: TObject);
    procedure prSpeedButtonFileDeleteClick(Sender: TObject);
    procedure prSpeedButtonFileClearClick(Sender: TObject);
    procedure prSpeedButtonFileClick(Sender: TObject);
    procedure ClearVisible;
    procedure DateFileToForm;
    procedure DateSketchToForm;
    procedure SetAllText;
    procedure ReadData;
    procedure pr_SB_DelAllSketchesClick(Sender: TObject);
    procedure WriteData;
    procedure UpdateMyF;
    procedure UpdateMyS;
    procedure MovingImage(Img: TImage);
    procedure RunPopupMenuRef(Img: TImage; Button: TMouseButton);
    procedure ScrollDown;
    procedure ScrollUp;
    function CheckLengthFormFields: boolean;


  private
    { private declarations }
  public
    Captured : Boolean;
    Px, Py : Integer;
    procedure MyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure MyMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    { public declarations }
  end;

  myFile = Record
    fullFileName,FileNamePath,FileName,FileNameNoExt,Title: String;
    Date: TDateTime;
  end;

  mySketch = Record
    fullFileName: String;
    Date: TDateTime;
  end;

var
  Form1: TForm1;
  StartingPoint : TPoint;
  SysPath: string;
  myF: array of myFile;
  myS: array of mySketch;
  prFileName: string;
  temporaryImg: Timage;
  FirstStart: boolean;


implementation

{$R *.lfm}

{ TForm1 }


////////////////////////////////////////////////
// Drag&Drop for moving Controls by mouse
procedure TForm1.MyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    begin
      Captured:=True;
      Px:=X; Py:=Y;
      (Sender as TImage).BringToFront;
    end;
end;
procedure TForm1.MyMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Captured then
    with Sender as TImage do
      begin
        Left:= Left-Px+X;
        Top:= Top-Py+Y;
      end;
  MovingImage(Sender as TImage);
end;
procedure TForm1.MyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Captured:= False;
  SetAllText;
  RunPopupMenuRef((Sender as TImage), Button);
end;

procedure TForm1.MovingImage(Img: TImage);
begin
  if Img.Parent=prPanel1 then
    begin
      if Img.Left<=0 then Img.Left:=1;
      if Img.Top<=0 then Img.Top:=1;
      if Img.Left>=prPanel1.Width-Img.Width then
        Img.Left:=prPanel1.Width-Img.Width-3;
      if Img.Top>=prPanel1.Height-Img.Height then
        Img.Top:=prPanel1.Height-Img.Height-4;
    end;
end;
// Drag&Drop for moving Controls by mouse
////////////////////////////////////////////////



////////////////////////////////////////////////
// Resize TControl by mouse
procedure TForm1.MyMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  (Sender as TControl).Width:=(Sender as TControl).Width-10;
  (Sender as TControl).Height:= Proportional_TPictureToTImageSizeHeight((Sender as TImage).Picture, (Sender as TImage));
  SetAllText;
end;
procedure TForm1.MyMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if ((Sender as TControl).Width<prPanel1.Width) and ((Sender as TControl).Height<prPanel1.Height) then
    begin
  (Sender as TControl).Width:=(Sender as TControl).Width+10;
  (Sender as TControl).Height:= Proportional_TPictureToTImageSizeHeight((Sender as TImage).Picture, (Sender as TImage));
  SetAllText;

    end;
end;
// Resize TControl by mouse
////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
/// PopupMenu File
procedure TForm1.prPPMenuGetFileDateClick(Sender: TObject);
begin
  DateFileToForm;
end;
/// PopupMenu File
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
/// PopupMenu Ref
procedure TForm1.RunPopupMenuRef(Img: TImage; Button: TMouseButton);
begin
  if Img.Parent=prPanel1 then
    if Button = mbRight then
      begin
        temporaryImg:= Img;
        prPopupMenuRef.PopUp;
      end;
end;

procedure TForm1.prPPMenuCropClick(Sender: TObject);
begin
  GoToCropIMG(temporaryImg, Form2.prImageCrop);
  Form2.ShowModal;
end;

procedure TForm1.prPPMenuItemRotateYES90Click(Sender: TObject);
begin
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateTImage(temporaryImg);
  SetAllText;
end;

procedure TForm1.prPPMenuItemRotateNO90Click(Sender: TObject);
begin
  RotateBitmap90(temporaryImg.Picture.bitmap);
  RotateTImage(temporaryImg);
  SetAllText;
end;

procedure TForm1.prPPMenuGetRefDateClick(Sender: TObject);
begin
  DateSketchToForm;
end;

procedure TForm1.prPPMenuResetClick(Sender: TObject);
begin
  temporaryImg.Picture.LoadFromFile(temporaryImg.HelpKeyword);
  SetSketchImgProperty(temporaryImg);
  UpdateMyS;
  SetAllText;
end;

procedure TForm1.prPPMenuDeleteClick(Sender: TObject);
begin
  temporaryImg.Free;
  UpdateMyS;
  SetAllText;
end;
/// PopupMenu Ref
////////////////////////////////////////////////////////////////////////////////


procedure TForm1.DateFileToForm;
var
  fDate: TDateTime;
  i: integer;
begin
  if prListBoxFile.SelCount=1 then
    begin
      i:= prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
      fDate:= myF[i].Date;
      prEdit_PDate.Date:= fDate;
      SetAllText;
    end;
end;



procedure TForm1.UpdateMyF;   /// Update File List
var
  i: integer;
begin
  prGroupBoxFile.Caption:='File(s) list:'+' '+'('+IntToStr(prListBoxFile.Count)+')';
  prGroupBoxFile.Repaint;
  if prListBoxFile.Count<>0 then
    begin
      setlength(myF,0);
      Form3.Show;
      Form3.Repaint;
      Form3.prProgressBar.Max:=prListBoxFile.Count;
      setlength(myF,prListBoxFile.Count);
      for i:=0 to Length(myF)-1 do
        begin
          if FileExistsUTF8(prListBoxFile.Items.Strings[i]) then
            begin
              myF[i].fullFileName:= prListBoxFile.Items.Strings[i];
              myF[i].FileNamePath:= ExtractFilePath(prListBoxFile.Items.Strings[i]);
              myF[i].FileName:=ExtractFileName(prListBoxFile.Items.Strings[i]);
              myF[i].FileNameNoExt:= ChangeFileExt(ExtractFileName(prListBoxFile.Items.Strings[i]),'');
              ReadTitleFromFile(myF[i].fullFileName, myF[i].Title);
              myF[i].Date:= GetDateLastGhange(myF[i].fullFileName);

              if  myF[i].Title='' then myF[i].Title:=myF[i].FileNameNoExt; // при отсутствии Title берем из FileName
              Form3.prProgressBar.Position:=i+1;
            end
          else
            begin
              myF[i].fullFileName:= '';
              myF[i].FileNamePath:='';
              myF[i].FileName:='';
              myF[i].FileNameNoExt:=prListBoxFile.Items.Strings[i];
              myF[i].Title:=prListBoxFile.Items.Strings[i];
              myF[i].Date:=Today;
              Form3.prProgressBar.Position:=i+1;
            end;
        end;
      Form3.prProgressBar.Position:=0;
      Form3.Close;
      prListBoxFile.Selected[0]:=true;
      prEdit_PDate.Date:=myF[High(myF)].Date;
    end;
end;

procedure TForm1.DateSketchToForm;
begin
  if prPanel1.ControlCount>0 then
    begin
      prEdit_ODate.Date:= GetDateLastGhange(temporaryImg.HelpKeyword);
      SetAllText;
    end;
end;

procedure TForm1.UpdateMyS; /// Update Referense(Sketch) list
var
  i: integer;
begin
  setlength(myS,0);
  if prPanel1.ControlCount>0 then
    begin
      setlength(myS,prPanel1.ControlCount);
      for i:=0 to Length(myS)-1 do
        if FileExistsUTF8(prPanel1.Controls[i].HelpKeyword) then
          begin
            myS[i].fullFileName:=prPanel1.Controls[i].HelpKeyword;
            myS[i].Date:= GetDateLastGhange(myS[i].fullFileName);
          end;
      if prCheckBox_Self.Checked=false then
        begin
          if myS[High(myS)].Date<>NULL then
            prEdit_ODate.Date:=myS[High(myS)].Date
          else
            prEdit_ODate.Clear;
        end;
    end;
end;


////////////////////////////////////////////////////////////////////////////////
/// Form1
procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  WriteData;
  MyPause(200);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.HintPause:= 50;
  Application.HintHidePause:=10240;
  prListBoxFile.DragMode := dmAutomatic;
  SysPath:= ExtractFilePath(ParamStr(0))+'sys\';
  prPanel1.ControlStyle:= prPanel1.ControlStyle+[csParentBackground];

  ////-> for moving controls by mouse
  Captured:= False;
  prImage_OSign.OnMouseDown := @MyMouseDown;
  prImage_OSign.OnMouseUp := @MyMouseUp;
  prImage_OSign.OnMouseMove := @MyMouseMove;

  prImage_PSign.OnMouseDown := @MyMouseDown;
  prImage_PSign.OnMouseUp := @MyMouseUp;
  prImage_PSign.OnMouseMove := @MyMouseMove;

  prImage_WSign.OnMouseDown := @MyMouseDown;
  prImage_WSign.OnMouseUp := @MyMouseUp;
  prImage_WSign.OnMouseMove := @MyMouseMove;
  //<-

  ReadData;
  SetAllText;
end;

procedure TForm1.prEditCustomTitleKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
    begin
      if (Length(prEditCustomTitle.Text)>0) and (prListBoxFile.Count<40) then
        begin
          prListBoxFile.Items.Add(prEditCustomTitle.Text);
          UpdateMyF;
          SetAllText;
        end;
      prEditCustomTitle.Visible:=false;
      prEditCustomTitle.Clear;
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  ini : TIniFile;
begin
  prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
  if FirstStart=false then
    begin
      ini:= TIniFile.Create(SysPath+'setting.ini');
      try
        ini.WriteBool('setting', 'FirstStart', true);
      finally
        FreeAndNil(ini);
      end;
      prBitBtn_Help.Click;
    end;
end;

procedure TForm1.prBitBtn_donateClick(Sender: TObject);
var
  ppMail,str: string;
begin
  ppMail:= 'apliilam@gmail.com';
  str:='If your working speed increased by this application, you can make a donation via Paypal ('+ppMail+').'+
        #10#13+#10#13+'Copy email to clipboard?';
  if MessageDlg('Donation', str, mtConfirmation, [mbYes, mbNo], 0)=mrYes then Clipboard.AsText:=ppMail;

end;

procedure TForm1.prBitBtn_HelpClick(Sender: TObject);
var
  str: string;
begin
  if FileExistsUTF8(SysPath+'help.txt') then
    begin
      prMemoTemp.Lines.LoadFromFile(SysPath+'help.txt');
      str:=SysToUTF8(prMemoTemp.Text);
      showmessage(str);
    end
  else
  begin
    MessageBox(Self.Handle, PChar('File help not found'), PChar('Error'), MB_OK+MB_ICONERROR);
  end;
end;

procedure TForm1.prCheckBox_OneReleasePerFileClick(Sender: TObject);
begin
  SetAllText;
end;

procedure TForm1.prListBoxFileClick(Sender: TObject);
begin
  prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
end;

procedure TForm1.prListBoxFileContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if prListBoxFile.SelCount=1 then
    begin
      if FileExistsUTF8(prListBoxFile.GetSelectedText) then
        prPopupMenuFile.Items.Items[0].Caption:= 'Get file Date'
      else
        prPopupMenuFile.Items.Items[0].Caption:= 'Get current Date';
      prPopupMenuFile.PopUp;
    end;
end;

procedure TForm1.prPanel1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollDown;
end;

procedure TForm1.prPanel1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollUp;
end;


procedure TForm1.prPanel1DblClick(Sender: TObject);
var
  i: integer;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_Sketches';
  OpenDlg.Options:=[ofAllowMultiselect,ofAutoPreview,ofFileMustExist];
  OpenDlg.Filter :='Only Images|*.jpg;*.png;*.bmp';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      for i := 0 to OpenDlg.Files.Count -1 do
        AddSketchImgToForm(OpenDlg.Files.Strings[i]);
      UpdateMyS;
      SetAllText;
    end;
  OpenDlg.Free;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  SetAllText;
end;




procedure TForm1.FormResize(Sender: TObject);
var
  k, Wmin,Hmin,W2,H2: Integer;
begin
  k:= 5;
  Wmin:= 465+prScrollBox1.Width+2*k;
  Hmin:= prButtonCreate.Top+prButtonCreate.Height+prStatusBar.Height+2*k;
  W2:= Form1.Width;
  H2:= Form1.Height;

  prGroupBoxFile.Width:=prScrollBox1.Left-2*k;

  prStatusBar.Panels.Items[2].Width:=prScrollBox1.Left-
                                     prStatusBar.Panels.Items[0].Width-
                                     prStatusBar.Panels.Items[1].Width;

  prListBoxFile.Width:= prGroupBoxFile.Width-20;

  prBitBtn_donate.Left:=prStatusBar.Panels.Items[0].Width+2;
  prBitBtn_donate.Top:=prStatusBar.Top+2;
  prBitBtn_Help.Left:=prStatusBar.Panels.Items[0].Width+
                      prStatusBar.Panels.Items[1].Width+
                      prStatusBar.Panels.Items[2].Width+2;
  prBitBtn_Help.Top:=prStatusBar.Top+2;

  if W2<Wmin then
    Form1.Width:= Wmin;
  if H2<Hmin then
    Form1.Height:= Hmin;
end;


procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String);
var
  i: Integer;
  p: TPoint;
begin
  GetCursorPos(p);
  if FindDragTarget(p, True) is TListbox then   // drop to Listbox
    begin
      for i := Low(FileNames) to High(FileNames) do
        if (ExtractFileExt(FileNames[i])='.jpg') or
           (ExtractFileExt(FileNames[i])='.JPG') then
             if (FindDragTarget(p, True) as TListbox).Count<40 then
               prListBoxFile.Items.Add(FileNames[i]);
      UpdateMyF;
      SetAllText;
    end;
  if FindDragTarget(p, True) is TPanel then     // drop to Panel
    begin
      Form3.Show;
      Form3.Repaint;
      Form3.prProgressBar.Max:=Length(FileNames);
      for i := Low(FileNames) to High(FileNames) do
        begin
        if (ExtractFileExt(FileNames[i])='.jpg') or
           (ExtractFileExt(FileNames[i])='.JPG') or
           (ExtractFileExt(FileNames[i])='.png') or
           (ExtractFileExt(FileNames[i])='.PNG') or
           (ExtractFileExt(FileNames[i])='.bmp') or
           (ExtractFileExt(FileNames[i])='.BMP') then
            AddSketchImgToForm(FileNames[i]);
        Form3.prProgressBar.Position:=i+1;
        end;
      UpdateMyS;
      SetAllText;
      Form3.prProgressBar.Position:=0;
      Form3.Close;
    end;
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollDown;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollUp;
end;

/// Form1
////////////////////////////////////////////////////////////////////////////////

function TForm1.CheckLengthFormFields: boolean;
begin
  result:=false;
  if (Length(prEdit_Name.Text)=0)      or
     (Length(prEdit_PAddress.Text)=0)  or
     (Length(prEdit_PCity.Text)=0)     or
     (Length(prEdit_PCountry.Text)=0)  or
     (Length(prEdit_PZipCode.Text)=0)  or
     (Length(prEdit_PPhone.Text)=0)    or
     (Length(prEdit_PEmail.Text)=0)    or
     (Length(prEdit_PDate.Text)=0)     or

     (Length(prEdit_OwnerName.Text)=0) or
     (Length(prEdit_OAddress.Text)=0)  or
     (Length(prEdit_OCity.Text)=0)     or
     (Length(prEdit_OCountry.Text)=0)  or
     (Length(prEdit_OZipCode.Text)=0)  or
     (Length(prEdit_OPhone.Text)=0)    or
     (Length(prEdit_OEmail.Text)=0)    or
     (Length(prEdit_ODate.Text)=0)     or

     (Length(prEdit_WName.Text)=0)     or
     (Length(prEdit_WDate.Text)=0)     then result:=true;
end;

procedure TForm1.prButtonCreateClick(Sender: TObject);
var
  pref, SName: string;
  SavePicDlg: TSavePictureDialog;
  SelDirDlg: TSelectDirectoryDialog;
  i, m: integer;
begin
  m:=30;//если отмечен чекбокс, то обрезать PRfile name до этого кол-ва символов(для Сабмиттера)
  //добавлены ли файлы в листбокс
  if prListBoxFile.Count=0 then
    begin
      MessageBox(Self.Handle, PChar(UTF8ToSys('You need to add file(s) to the list')), PChar(UTF8ToSys('Information')), MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  //проверка на пустые поля
  if CheckLengthFormFields=true then
    begin
      MessageBox(Self.Handle, PChar(UTF8ToSys('You must be fill all fields')), PChar(UTF8ToSys('Information')), MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  //сверка даты
  If prEdit_PDate.Date<prEdit_ODate.Date then
    begin
      Showmessage('"Photographer Date" can not be earlier than "Owner Date"');
      Exit;
    end;

  //добавлены ли скетчи
  If prPanel1.ControlCount=0 then
    if MessageDlg('Confirmation', 'Sketches (references of) has not been added.'+#10#13+'Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

  pref:= 'PR';


  if prCheckBox_OneReleasePerFile.Checked=true then   /// если на один файл - один релиз
    begin
      SelDirDlg := TSelectDirectoryDialog.Create(self);
      SelDirDlg.InitialDir:=GetCurrentDir;
      if SelDirDlg.Execute then
        for i:=0 to prListBoxFile.Count-1 do
          begin
            if  myF[i].FileNameNoExt='' then SName:= myF[i].Title
            else SName:= myF[i].FileNameNoExt;
            //Showmessage(SName);

            prListBoxFile.Selected[i]:=true;
            SName:=CutStringUpTo(SName,m-Length(pref));

            if FileExistsUTF8(SelDirDlg.FileName+'\'+SName+pref+'.jpg') then
              begin
                if MessageDlg('Confirmation', 'File '+SName+pref+'.jpg'+' already exists.'+#10#13+'Overwrite file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  SaveBitmapToJPG(prImageFORM.Picture.Bitmap, SelDirDlg.FileName+'\'+SName+pref+'.jpg', 85);
              end
            else
              SaveBitmapToJPG(prImageFORM.Picture.Bitmap, SelDirDlg.FileName+'\'+SName+pref+'.jpg', 85);
            MyPause(500);
          end;
      FreeAndNil(SelDirDlg);
    end
  else  /// если на все файлы - один релиз
    begin
      if prListBoxFile.SelCount=1 then
        i:= prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
      if (prCheckBox_Nearly.Checked=true) and (Length(myF[i].FileNamePath)>1) then
         begin
           SName:=myF[i].FileNameNoExt;
           SName:=CutStringUpTo(SName,m-Length(pref));

           if FileExistsUTF8(myF[i].FileNamePath+SName+pref+'.jpg') then
             begin
               if MessageDlg('Confirmation', 'File '+SName+pref+'.jpg'+' already exists.'+#10#13+'Overwrite file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 SaveBitmapToJPG(prImageFORM.Picture.Bitmap, myF[i].FileNamePath+SName+pref+'.jpg', 85);
             end
           else
             SaveBitmapToJPG(prImageFORM.Picture.Bitmap, myF[i].FileNamePath+SName+pref+'.jpg', 85);
         end
      else
        begin
          SavePicDlg:= TSavePictureDialog.Create(self);
          SavePicDlg.Name:='SavePictureDialog_PSignature';
          SavePicDlg.Options:=[ofEnableSizing,ofViewDetail];
          SavePicDlg.Filter :='JPG image file only|*.jpg';
          if  myF[i].FileNameNoExt='' then SName:= myF[i].Title
          else SName:= myF[i].FileNameNoExt;
          SName:=CutStringUpTo(SName,m-Length(pref));
          SavePicDlg.FileName:=SName+pref;

          if SavePicDlg.Execute then
            begin
              if FileExistsUTF8(SavePicDlg.FileName) then
                begin
                  if MessageDlg('Confirmation', 'File '+SavePicDlg.FileName+' already exists.'+#10#13+'Overwrite file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                    SaveBitmapToJPG(prImageFORM.Picture.Bitmap, SavePicDlg.FileName, 85);
                end
              else
                SaveBitmapToJPG(prImageFORM.Picture.Bitmap, SavePicDlg.FileName, 85);
            end;
          SavePicDlg.Free;
        end;
      if prCheckBoxCopyPrName.Checked=true then Clipboard.AsText:=SName+pref;
    end;
end;

procedure TForm1.prImageFORMClick(Sender: TObject);
begin
  SetAllText;
end;

procedure TForm1.ScrollUp;
begin
  prScrollBox1.VertScrollBar.Position:= prScrollBox1.VertScrollBar.Position-35;
end;

procedure TForm1.ScrollDown;
begin
  prScrollBox1.VertScrollBar.Position:= prScrollBox1.VertScrollBar.Position+35;
end;

procedure TForm1.prImageFORMMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollDown;
end;

procedure TForm1.prImageFORMMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollUp;
end;

procedure TForm1.prCheckBox_SelfClick(Sender: TObject);
begin

  if prCheckBox_Self.Checked then
    begin
      prEdit_OwnerName.Text:=prEdit_Name.Text;
      prEdit_OAddress.Text:=prEdit_PAddress.Text;
      prEdit_OCity.Text:=prEdit_PCity.Text;
      prEdit_OCountry.Text:=prEdit_PCountry.Text;
      prEdit_OZipCode.Text:=prEdit_PZipCode.Text;
      prEdit_OPhone.Text:=prEdit_PPhone.Text;
      prEdit_OEmail.Text:=prEdit_PEmail.Text;
      prEdit_ODate.Date:=prEdit_PDate.Date;

      if FileExistsUTF8(prImage_PSign.HelpKeyword) then
        begin
          prImage_OSign.HelpKeyword:=prImage_PSign.HelpKeyword;
          prImage_OSign.Picture.LoadFromFile(prImage_OSign.HelpKeyword);
        end
      else
        begin
          prImage_OSign.HelpKeyword:='';
          prImage_OSign.Picture.Clear;
        end;
      SetAllText;
    end;
end;



////////////////////////////////
/// File(s) Controls


///////////////////////////////////////
// DragDrop for ListBox
procedure TForm1.prListBoxFileDragDrop(Sender, Source: TObject; X, Y: Integer) ;
var
   DropPosition, StartPosition: Integer;
   DropPoint: TPoint;
begin
   //zt:=1;
   DropPoint.X:= X;
   DropPoint.Y:= Y;
   with Source as TListBox do
   begin
     StartPosition:= ItemAtPos(StartingPoint,True);
     DropPosition:= ItemAtPos(DropPoint,True);
     Items.Move(StartPosition, DropPosition);
   end;
   UpdateMyF;
   SetAllText;
end;
procedure TForm1.prListBoxFileDragOver(Sender, Source: TObject;
    X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=Source=prListBoxFile;
end;
procedure TForm1.prListBoxFileMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   StartingPoint.X:=X;
   StartingPoint.Y:=Y;
end;
// DragDrop for ListBox
//////////////////////////////////////////


procedure TForm1.prListBoxFileDblClick(Sender: TObject);
begin
  DateFileToForm;
end;

procedure TForm1.prListBoxFileSelectionChange(Sender: TObject; User: boolean);
begin
  prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
  SetAllText;
end;

procedure TForm1.prSpeedButtonFileClick(Sender: TObject);
var
  i: integer;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_Files1';
  OpenDlg.Options:=[ofAllowMultiselect,ofAutoPreview,ofFileMustExist];
  OpenDlg.Filter :='Only JPG-files|*.jpg';   //  'Image files only|*.jpg;*.png';
  //OpenDlg.FilterIndex := 1;
  //OpenDlg.InitialDir := GetCurrentDir;

  if OpenDlg.Execute then
    begin
      for i := 0 to OpenDlg.Files.Count -1 do
        if prListBoxFile.Count<40 then
          prListBoxFile.Items.Add(OpenDlg.Files.Strings[i]);
      UpdateMyF;
      //prListBoxFile.Selected[0]:=true;
      SetAllText;
    end;
  OpenDlg.Free;
end;

procedure TForm1.prSpeedButtonFileClearClick(Sender: TObject);
begin
  prListBoxFile.Clear;
  prLabelSelFile.Caption:='';
  UpdateMyF;
  SetAllText;
end;

procedure TForm1.prSpeedButtonFileDeleteClick(Sender: TObject);
var
  n:integer;
begin
  if prListBoxFile.Count<>0 then
    if prListBoxFile.SelCount > 0 then
      begin
        n:=prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText);
        prListBoxFile.Items.Delete(n);

        if prListBoxFile.Count>0 then
          if prListBoxFile.Count>n then
            prListBoxFile.Selected[n]:=true
          else
            if (prListBoxFile.Count=n) then
              prListBoxFile.Selected[n-1]:=true;

        prLabelSelFile.Caption:=ExtractFileName(prListBoxFile.GetSelectedText);
        UpdateMyF;
        SetAllText;
      end;
end;

procedure TForm1.prSB_AddClick(Sender: TObject);
begin
  prEditCustomTitle.Visible:=true;
  prEditCustomTitle.SetFocus;
end;
///File(s) Controls
/////////////////////////////////////////////////



////////////////////////////////
/// Sketch Controls
procedure TForm1.pr_SB_DelAllSketchesClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to prPanel1.ControlCount-1 do
    (prPanel1.Controls[0]).Free;
  UpdateMyS;
  SetAllText;
end;
///Sketch Controls
/////////////////////////////////////////////////


procedure TForm1.ReadData;
var
  ini : TIniFile;
begin
  ini:= TIniFile.Create(SysPath+'setting.ini');
  try
    FirstStart:=ini.ReadBool('setting', 'FirstStart', false);

    prEdit_Name.Text:= ini.ReadString('main', 'Name', '');
    prEdit_OwnerName.Text:= ini.ReadString('main', 'OwnerName', '');
    prEdit_PAddress.Text:= ini.ReadString('main', 'Address', '');
    prEdit_OAddress.Text:= ini.ReadString('main', 'OwnerAddress', '');
    prEdit_PCity.Text:= ini.ReadString('main', 'City', '');
    prEdit_OCity.Text:= ini.ReadString('main', 'OwnerCity', '');
    prEdit_PCountry.Text:= ini.ReadString('main', 'Country', '');
    prEdit_OCountry.Text:= ini.ReadString('main', 'OwnerCountry', '');
    prEdit_PZipCode.Text:= ini.ReadString('main', 'ZipCode', '');
    prEdit_OZipCode.Text:= ini.ReadString('main', 'OwnerZipCode', '');
    prEdit_PPhone.Text:= ini.ReadString('main', 'Phone', '');
    prEdit_OPhone.Text:= ini.ReadString('main', 'OwnerPhone', '');
    prEdit_PEmail.Text:= ini.ReadString('main', 'Email', '');
    prEdit_OEmail.Text:= ini.ReadString('main', 'OwnerEmail', '');
    prEdit_WName.Text:= ini.ReadString('main', 'WName', '');

    if Length(ini.ReadString('main', 'Date', ''))>1 then
       prEdit_PDate.Date:= StrToDate(ini.ReadString('main', 'Date', ''));
    if Length(ini.ReadString('main', 'OwnerDate', ''))>1 then
       prEdit_ODate.Date:= StrToDate(ini.ReadString('main', 'OwnerDate', ''));
    if Length(ini.ReadString('main', 'WDate', ''))>1 then
       prEdit_WDate.Date:= StrToDate(ini.ReadString('main', 'WDate', ''));

    prCheckBoxCutPrName30.Checked:=ini.ReadBool('setting', 'prCheckBoxCutPrName30', true);
    prCheckBoxCopyPrName.Checked:=ini.ReadBool('setting', 'prCheckBoxCopyPrName', true);
    prCheckBox_OneReleasePerFile.Checked:=ini.ReadBool('setting', 'prCheckBox_OneReleasePerFile', true);
    prCheckBox_Nearly.Checked:=ini.ReadBool('setting', 'CheckBox_Nearly', true);
    prCheckBox_Self.Checked:=ini.ReadBool('setting', 'CheckBox_Self', false);

    prImage_PSign.Left:=ini.ReadInteger('position', 'PSignature_Left', 335);
    prImage_PSign.Top:=ini.ReadInteger('position', 'PSignature_Top', 740);
    prImage_PSign.HelpKeyword:=ini.ReadString('main', 'PSignature_File', '');
    if FileExistsUTF8(prImage_PSign.HelpKeyword) then
      prImage_PSign.Picture.LoadFromFile(prImage_PSign.HelpKeyword);

    prImage_OSign.Left:=ini.ReadInteger('position', 'OSignature_Left', 801);
    prImage_OSign.Top:=ini.ReadInteger('position', 'OSignature_Top', 740);
    prImage_OSign.HelpKeyword:=ini.ReadString('main', 'OSignature_File', '');
    if FileExistsUTF8(prImage_OSign.HelpKeyword) then
      prImage_OSign.Picture.LoadFromFile(prImage_OSign.HelpKeyword);

    prImage_WSign.Left:=ini.ReadInteger('position', 'WSignature_Left', 335);
    prImage_WSign.Top:=ini.ReadInteger('position', 'WSignature_Top', 822);
    prImage_WSign.HelpKeyword:=ini.ReadString('main', 'WSignature_File', '');
    if FileExistsUTF8(prImage_WSign.HelpKeyword) then
      prImage_WSign.Picture.LoadFromFile(prImage_WSign.HelpKeyword);

  finally
    FreeAndNil(ini);
  end;
end;

procedure TForm1.WriteData;
var
  ini : TIniFile;
begin
  ini:= TIniFile.Create(SysPath+'setting.ini');
  try
    ini.WriteString('main', 'Name', prEdit_Name.Text);
    ini.WriteString('main', 'OwnerName', prEdit_OwnerName.Text);
    ini.WriteString('main', 'Address', prEdit_PAddress.Text);
    ini.WriteString('main', 'OwnerAddress', prEdit_OAddress.Text);
    ini.WriteString('main', 'City', prEdit_PCity.Text);
    ini.WriteString('main', 'OwnerCity', prEdit_OCity.Text);
    ini.WriteString('main', 'Country', prEdit_PCountry.Text);
    ini.WriteString('main', 'OwnerCountry', prEdit_OCountry.Text);
    ini.WriteString('main', 'ZipCode', prEdit_PZipCode.Text);
    ini.WriteString('main', 'OwnerZipCode', prEdit_OZipCode.Text);
    ini.WriteString('main', 'Phone', prEdit_PPhone.Text);
    ini.WriteString('main', 'OwnerPhone', prEdit_OPhone.Text);
    ini.WriteString('main', 'Email', prEdit_PEmail.Text);
    ini.WriteString('main', 'OwnerEmail', prEdit_OEmail.Text);
    ini.WriteString('main', 'WName', prEdit_WName.Text);
    ini.WriteString('main', 'Date', prEdit_PDate.Text);
    ini.WriteString('main', 'OwnerDate', prEdit_ODate.Text);
    ini.WriteString('main', 'WDate', prEdit_WDate.Text);

    ini.WriteBool('setting', 'prCheckBoxCutPrName30', prCheckBoxCutPrName30.Checked);
    ini.WriteBool('setting', 'prCheckBoxCopyPrName', prCheckBoxCopyPrName.Checked);
    ini.WriteBool('setting', 'prCheckBox_OneReleasePerFile', prCheckBox_OneReleasePerFile.Checked);
    ini.WriteBool('setting', 'CheckBox_Nearly', prCheckBox_Nearly.Checked);
    ini.WriteBool('setting', 'CheckBox_Self', prCheckBox_Self.Checked);

    ini.WriteInteger('position', 'OSignature_Left', prImage_OSign.Left);
    ini.WriteInteger('position', 'OSignature_Top', prImage_OSign.Top);
    if prImage_OSign.Picture.Graphic=nil then
      ini.WriteString('main', 'OSignature_File', '')
    else
      ini.WriteString('main', 'OSignature_File', prImage_OSign.HelpKeyword);

    //ini.WriteInteger('position', 'PSignature_Left', 303);
    ///ini.WriteInteger('position', 'PSignature_Top', 737);
    ini.WriteInteger('position', 'PSignature_Left', prImage_PSign.Left);
    ini.WriteInteger('position', 'PSignature_Top', prImage_PSign.Top);
    if prImage_PSign.Picture.Graphic=nil then
      ini.WriteString('main', 'PSignature_File', '')
    else
      ini.WriteString('main', 'PSignature_File', prImage_PSign.HelpKeyword);

    ini.WriteInteger('position', 'WSignature_Left', prImage_WSign.Left);
    ini.WriteInteger('position', 'WSignature_Top', prImage_WSign.Top);

    if prImage_WSign.Picture.Graphic=nil then
      ini.WriteString('main', 'WSignature_File', '')
    else
      ini.WriteString('main', 'WSignature_File', prImage_WSign.HelpKeyword);

  finally
    FreeAndNil(ini);
  end;
end;


procedure TForm1.ClearVisible;
begin
  if prEdit_Name.Visible=true then prEdit_Name.Visible:=false;
  if prEdit_OwnerName.Visible=true then prEdit_OwnerName.Visible:=false;
  if prEdit_PAddress.Visible=true then prEdit_PAddress.Visible:=false;
  if prEdit_OAddress.Visible=true then prEdit_OAddress.Visible:=false;
  if prEdit_PCity.Visible=true then prEdit_PCity.Visible:=false;
  if prEdit_OCity.Visible=true then prEdit_OCity.Visible:=false;
  if prEdit_PCountry.Visible=true then prEdit_PCountry.Visible:=false;
  if prEdit_OCountry.Visible=true then prEdit_OCountry.Visible:=false;
  if prEdit_PZipCode.Visible=true then prEdit_PZipCode.Visible:=false;
  if prEdit_OZipCode.Visible=true then prEdit_OZipCode.Visible:=false;
  if prEdit_PPhone.Visible=true then prEdit_PPhone.Visible:=false;
  if prEdit_OPhone.Visible=true then prEdit_OPhone.Visible:=false;
  if prEdit_PEmail.Visible=true then prEdit_PEmail.Visible:=false;
  if prEdit_OEmail.Visible=true then prEdit_OEmail.Visible:=false;
  if prEdit_WName.Visible=true then prEdit_WName.Visible:=false;
  if prEdit_PDate.Visible=true then prEdit_PDate.Visible:=false;
  if prEdit_ODate.Visible=true then prEdit_ODate.Visible:=false;
  if prEdit_WDate.Visible=true then prEdit_WDate.Visible:=false;
end;


procedure TForm1.SetAllText;
var
  bm: TBitmap;
  OldBkMode,i,n,m: integer;
  IndexStr, TitleTemp: string;
begin
  ClearVisible;
  prImageFORM.Canvas.Clear;
  prImageFORM.Canvas.Draw(0, 0, Image_temp.Picture.Graphic);

  bm := TBitmap.Create;
  bm.PixelFormat:=pf24bit;
  bm.Width := prImageFORM.Width;
  bm.Height := prImageFORM.Height;
  bm.Canvas.Draw(0, 0, Image_Temp.Picture.Graphic);
  OldBkMode := SetBkMode(bm.Canvas.Handle, TRANSPARENT);

  bm.Canvas.Draw(prImage_PSign.Left,prImage_PSign.Top,prImage_PSign.Picture.Graphic);
  bm.Canvas.Draw(prImage_OSign.Left,prImage_OSign.Top,prImage_OSign.Picture.Graphic);
  bm.Canvas.Draw(prImage_WSign.Left,prImage_WSign.Top,prImage_WSign.Picture.Graphic);
  BakePanelControlsToForm(prPanel1, bm);

  bm.Canvas.Font.Size:=12;
  bm.Canvas.Font.Style:=[fsBold];
  bm.Canvas.TextOut(120, 84, prEdit_OwnerName.Text);  // Name OwnerName2

  //////////


  if (prListBoxFile.Count>0) then
    if prCheckBox_OneReleasePerFile.Checked=true then
      if prListBoxFile.SelCount<>0 then
        bm.Canvas.TextOut(510, 790, myF[prListBoxFile.Items.IndexOf(prListBoxFile.GetSelectedText)].Title)
    else
      begin
        case prListBoxFile.Count of
          1..3:
            begin
              m:=20;
              bm.Canvas.Font.Size:=12;
            end;
          4..7:
            begin
              m:=17;
              bm.Canvas.Font.Size:=11;
            end;
          8..40:
            begin
              m:=15;
              bm.Canvas.Font.Size:=10;
            end
        else
          Showmessage('CountFilesError: too many files!'+#10#13+'(must be less than 40 files)');
        end;
        n:=790;
        for i:=0 to prListBoxFile.Count-1 do
          begin
            if prListBoxFile.Count=1 then IndexStr:='' else IndexStr:=IntToStr(i+1)+') ';
            TitleTemp:= myF[i].Title;
            bm.Canvas.TextOut(510, n, IndexStr+TitleTemp);
            inc(n,m);
          end;
      end;


  //////////

  bm.Canvas.Font.Size:=12;
  bm.Canvas.TextOut(191, 573, prEdit_Name.Text);  // Name photographer
  bm.Canvas.TextOut(655, 573, prEdit_OwnerName.Text);  // Name OwnerName

  bm.Canvas.Font.Style:=[];
  bm.Canvas.TextOut(191, 599, prEdit_PAddress.Text);  // Address photographer
  bm.Canvas.TextOut(655, 599, prEdit_OAddress.Text);  // Address Owner
  bm.Canvas.TextOut(191, 622, prEdit_PCity.Text);  // City photographer
  bm.Canvas.TextOut(655, 622, prEdit_OCity.Text);  // City Owner
  bm.Canvas.TextOut(191, 645, prEdit_PCountry.Text);  // Country photographer
  bm.Canvas.TextOut(655, 645, prEdit_OCountry.Text);  // Country Owner
  bm.Canvas.TextOut(191, 669, prEdit_PZipCode.Text);  // ZipCode photographer
  bm.Canvas.TextOut(655, 669, prEdit_OZipCode.Text);  // ZipCode Owner
  bm.Canvas.TextOut(191, 692, prEdit_PPhone.Text);  // Phone photographer
  bm.Canvas.TextOut(655, 692, prEdit_OPhone.Text);  // Phone Owner
  bm.Canvas.TextOut(191, 715, prEdit_PEmail.Text);  // Email photographer
  bm.Canvas.TextOut(655, 715, prEdit_OEmail.Text);  // Email Owner
  bm.Canvas.TextOut(191, 800, prEdit_WName.Text);  // Name Witness

  bm.Canvas.TextOut(191, 739, prEdit_PDate.Text);  // Date photographer
  bm.Canvas.TextOut(655, 739, prEdit_ODate.Text);  // Date Owner
  bm.Canvas.TextOut(191, 829, prEdit_WDate.Text);  // Date Witness

  SetBkMode(bm.Canvas.Handle, OldBkMode);
  prImageFORM.Picture.Assign(bm);
  bm.Destroy;
end;




////////////////////////////////////////////////////////////////////////////////
///////////////////////////// Name photographer
procedure TForm1.prShape_NameMouseEnter(Sender: TObject);
begin
  prEdit_Name.Visible:=true;
end;
procedure TForm1.prShape_NameMouseLeave(Sender: TObject);
begin
  if (prEdit_Name.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_Name.Focused=false) then prEdit_Name.Visible:=false;
     end;
end;
procedure TForm1.prEdit_NameClick(Sender: TObject);
begin
  prEdit_Name.SetFocus;
end;
procedure TForm1.prEdit_NameKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_NameChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OwnerName.Text:=prEdit_Name.Text;
end;
//////////


///////////////////////////// Name Owner
procedure TForm1.prShape_OwnerNameMouseEnter(Sender: TObject);
begin
  prEdit_OwnerName.Visible:=true;
end;
procedure TForm1.prShape_OwnerNameMouseLeave(Sender: TObject);
begin
  if (prEdit_OwnerName.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OwnerName.Focused=false) then prEdit_OwnerName.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OwnerNameClick(Sender: TObject);
begin
  prEdit_OwnerName.SetFocus;
end;
procedure TForm1.prEdit_OwnerNameKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;

//////////


///////////////////////////// Address photographer
procedure TForm1.prShape_PAddressMouseEnter(Sender: TObject);
begin
  prEdit_PAddress.Visible:=true;
end;
procedure TForm1.prShape_PAddressMouseLeave(Sender: TObject);
begin
  if (prEdit_PAddress.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_PAddress.Focused=false) then  prEdit_PAddress.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PAddressClick(Sender: TObject);
begin
  prEdit_PAddress.SetFocus;
end;
procedure TForm1.prEdit_PAddressKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_PAddressChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OAddress.Text:=prEdit_PAddress.Text;
end;
//////////

///////////////////////////// Address Owner
procedure TForm1.prShape_OAddressMouseEnter(Sender: TObject);
begin
  prEdit_OAddress.Visible:=true;
end;
procedure TForm1.prShape_OAddressMouseLeave(Sender: TObject);
begin
  if (prEdit_OAddress.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OAddress.Focused=false) then  prEdit_OAddress.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OAddressClick(Sender: TObject);
begin
  prEdit_OAddress.SetFocus;
end;
procedure TForm1.prEdit_OAddressKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
//////////

///////////////////////////// City photographer
procedure TForm1.prShape_PCityMouseEnter(Sender: TObject);
begin
  prEdit_PCity.Visible:=true;
end;
procedure TForm1.prShape_PCityMouseLeave(Sender: TObject);
begin
  if (prEdit_PCity.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_PCity.Focused=false) then  prEdit_PCity.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PCityClick(Sender: TObject);
begin
  prEdit_PCity.SetFocus;
end;
procedure TForm1.prEdit_PCityKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_PCityChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OCity.Text:=prEdit_PCity.Text;
end;
//////////

///////////////////////////// City Owner
procedure TForm1.prShape_OCityMouseEnter(Sender: TObject);
begin
  prEdit_OCity.Visible:=true;
end;
procedure TForm1.prShape_OCityMouseLeave(Sender: TObject);
begin
  if (prEdit_OCity.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OCity.Focused=false) then  prEdit_OCity.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OCityClick(Sender: TObject);
begin
  prEdit_OCity.SetFocus;
end;
procedure TForm1.prEdit_OCityKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
//////////

///////////////////////////// Country photographer
procedure TForm1.prShape_PCountryMouseEnter(Sender: TObject);
begin
  prEdit_PCountry.Visible:=true;
end;
procedure TForm1.prShape_PCountryMouseLeave(Sender: TObject);
begin
  if (prEdit_PCountry.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_PCountry.Focused=false) then  prEdit_PCountry.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PCountryClick(Sender: TObject);
begin
  prEdit_PCountry.SetFocus;
end;
procedure TForm1.prEdit_PCountryKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_PCountryChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OCountry.Text:=prEdit_PCountry.Text;
end;
//////////

///////////////////////////// Country Owner
procedure TForm1.prShape_OCountryMouseEnter(Sender: TObject);
begin
  prEdit_OCountry.Visible:=true;
end;
procedure TForm1.prShape_OCountryMouseLeave(Sender: TObject);
begin
  if (prEdit_OCountry.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OCountry.Focused=false) then  prEdit_OCountry.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OCountryClick(Sender: TObject);
begin
  prEdit_OCountry.SetFocus;
end;
procedure TForm1.prEdit_OCountryKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_ODateChange(Sender: TObject);
begin
  SetAllText;
end;
//////////


///////////////////////////// ZipCode photographer
procedure TForm1.prShape_PZipCodeMouseEnter(Sender: TObject);
begin
  prEdit_PZipCode.Visible:=true;
end;
procedure TForm1.prShape_PZipCodeMouseLeave(Sender: TObject);
begin
  if (prEdit_PZipCode.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_PZipCode.Focused=false) then  prEdit_PZipCode.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PZipCodeClick(Sender: TObject);
begin
  prEdit_PZipCode.SetFocus;
end;
procedure TForm1.prEdit_PZipCodeKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_WDateChange(Sender: TObject);
begin
  SetAllText;
end;
procedure TForm1.prEdit_PZipCodeChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OZipCode.Text:=prEdit_PZipCode.Text;
end;
//////////

///////////////////////////// ZipCode Owner
procedure TForm1.prShape_OZipCodeMouseEnter(Sender: TObject);
begin
  prEdit_OZipCode.Visible:=true;
end;
procedure TForm1.prShape_OZipCodeMouseLeave(Sender: TObject);
begin
  if (prEdit_OZipCode.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OZipCode.Focused=false) then  prEdit_OZipCode.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OZipCodeClick(Sender: TObject);
begin
  prEdit_OZipCode.SetFocus;
end;
procedure TForm1.prEdit_OZipCodeKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
//////////


///////////////////////////// Phone photographer
procedure TForm1.prShape_PPhoneMouseEnter(Sender: TObject);
begin
  prEdit_PPhone.Visible:=true;
end;
procedure TForm1.prShape_PPhoneMouseLeave(Sender: TObject);
begin
  if (prEdit_PPhone.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_PPhone.Focused=false) then  prEdit_PPhone.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PPhoneClick(Sender: TObject);
begin
  prEdit_PPhone.SetFocus;
end;
procedure TForm1.prEdit_PPhoneKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_PPhoneChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OPhone.Text:=prEdit_PPhone.Text;
end;
//////////

///////////////////////////// Phone Owner
procedure TForm1.prShape_OPhoneMouseEnter(Sender: TObject);
begin
  prEdit_OPhone.Visible:=true;
end;
procedure TForm1.prShape_OPhoneMouseLeave(Sender: TObject);
begin
  if (prEdit_OPhone.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OPhone.Focused=false) then  prEdit_OPhone.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OPhoneClick(Sender: TObject);
begin
  prEdit_OPhone.SetFocus;
end;
procedure TForm1.prEdit_OPhoneKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
//////////


///////////////////////////// Email photographer
procedure TForm1.prShape_PEmailMouseEnter(Sender: TObject);
begin
  prEdit_PEmail.Visible:=true;
end;
procedure TForm1.prShape_PEmailMouseLeave(Sender: TObject);
begin
  if (prEdit_PEmail.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_PEmail.Focused=false) then  prEdit_PEmail.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PEmailClick(Sender: TObject);
begin
  prEdit_PEmail.SetFocus;
end;
procedure TForm1.prEdit_PEmailKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_PEmailChange(Sender: TObject);
begin
  if prCheckBox_Self.Checked=true then
  prEdit_OEmail.Text:=prEdit_PEmail.Text;
end;
//////////

///////////////////////////// Email Owner
procedure TForm1.prShape_OEmailMouseEnter(Sender: TObject);
begin
  prEdit_OEmail.Visible:=true;
end;
procedure TForm1.prShape_OEmailMouseLeave(Sender: TObject);
begin
  if (prEdit_OEmail.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_OEmail.Focused=false) then  prEdit_OEmail.Visible:=false;
     end;
end;
procedure TForm1.prEdit_OEmailClick(Sender: TObject);
begin
  prEdit_OEmail.SetFocus;
end;
procedure TForm1.prEdit_OEmailKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
//////////


///////////////////////////// Date photographer
procedure TForm1.prShape_PDateMouseEnter(Sender: TObject);
begin
  prEdit_PDate.Visible:=true;
end;
procedure TForm1.prShape_PDateMouseLeave(Sender: TObject);
begin
  if (prEdit_PDate.MouseEntered=false) then
     begin
       MyPause(300);
       if (prEdit_PDate.Focused=false) then  prEdit_PDate.Visible:=false;
     end;
end;
procedure TForm1.prEdit_PDateClick(Sender: TObject);
begin
  prEdit_PDate.SetFocus;
end;
procedure TForm1.prEdit_PDateKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prEdit_PDateChange(Sender: TObject);
begin
  prEdit_WDate.Date:=prEdit_PDate.Date;  //если нужно потом выключить
  if prCheckBox_Self.Checked then
    prEdit_ODate.Date:=prEdit_PDate.Date;
end;
procedure TForm1.prSB_PDateMouseEnter(Sender: TObject);
begin
  prEdit_PDate.Visible:=true;
end;
procedure TForm1.prSB_PDateMouseLeave(Sender: TObject);
begin
  if (prEdit_PDate.MouseEntered=false) then
     begin
       MyPause(300);
       if (prEdit_PDate.Focused=false) then  prEdit_PDate.Visible:=false;
     end;
end;
procedure TForm1.prSB_PDateClick(Sender: TObject);
begin
  prEdit_PDate.Visible:=true;
  prEdit_PDate.SetFocus;
end;
//////////

///////////////////////////// Date Owner
procedure TForm1.prShape_ODateMouseEnter(Sender: TObject);
begin
  prEdit_ODate.Visible:=true;
end;
procedure TForm1.prShape_ODateMouseLeave(Sender: TObject);
begin
  if (prEdit_ODate.MouseEntered=false) then
     begin
       MyPause(300);
       if (prEdit_ODate.Focused=false) then  prEdit_ODate.Visible:=false;
     end;
end;
procedure TForm1.prEdit_ODateClick(Sender: TObject);
begin
  prEdit_ODate.SetFocus;
end;
procedure TForm1.prEdit_ODateKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prSB_ODateMouseEnter(Sender: TObject);
begin
  prEdit_ODate.Visible:=true;
end;
procedure TForm1.prSB_ODateMouseLeave(Sender: TObject);
begin
  if (prEdit_ODate.MouseEntered=false) then
     begin
       MyPause(300);
       if (prEdit_ODate.Focused=false) then  prEdit_ODate.Visible:=false;
     end;
end;
procedure TForm1.prSB_ODateClick(Sender: TObject);
begin
  prEdit_ODate.Visible:=true;
  prEdit_ODate.SetFocus;
end;
//////////


///////////////////////////// Date Witness
procedure TForm1.prShape_WDateMouseEnter(Sender: TObject);
begin
  prEdit_WDate.Visible:=true;
end;
procedure TForm1.prShape_WDateMouseLeave(Sender: TObject);
begin
  if (prEdit_WDate.MouseEntered=false) then
     begin
       MyPause(300);
       if (prEdit_WDate.Focused=false) then  prEdit_WDate.Visible:=false;
     end;
end;
procedure TForm1.prEdit_WDateClick(Sender: TObject);
begin
  prEdit_WDate.SetFocus;
end;
procedure TForm1.prEdit_WDateKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
procedure TForm1.prSB_WDateMouseEnter(Sender: TObject);
begin
  prEdit_WDate.Visible:=true;
end;
procedure TForm1.prSB_WDateMouseLeave(Sender: TObject);
begin
  if (prEdit_WDate.MouseEntered=false) then
    begin
      MyPause(300);
      if (prEdit_WDate.Focused=false) then  prEdit_WDate.Visible:=false;
    end;
end;
procedure TForm1.prSB_WDateClick(Sender: TObject);
begin
  prEdit_WDate.Visible:=true;
  prEdit_WDate.SetFocus;
end;
//////////


/////////////////////////////// Signature Photographer
procedure TForm1.prSB_PSignatureClick(Sender: TObject);
var
  f: string;
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_PSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   // 'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      f:= OpenDlg.FileName;
      prImage_PSign.Picture.LoadFromFile(f);
      prImage_PSign.HelpKeyword:=f;
      if prCheckBox_Self.Checked=true then
        begin
          prImage_OSign.Picture.LoadFromFile(f);
          prImage_OSign.HelpKeyword:=f;
        end;
      SetAllText;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prImage_PSignDblClick(Sender: TObject);
begin
  prImage_PSign.HelpKeyword:='';
  prImage_PSign.Picture.Clear;
  if prCheckBox_Self.Checked then
    begin
      prImage_OSign.HelpKeyword:='';
      prImage_OSign.Picture.Clear;
    end;
  SetAllText;
end;
///////////


/////////////////////////////// Signature Owner
procedure TForm1.prSB_OSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_OSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      prImage_OSign.Picture.LoadFromFile(OpenDlg.FileName);
      prImage_OSign.HelpKeyword:=OpenDlg.FileName;
      SetAllText;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prImage_OSignDblClick(Sender: TObject);
begin
  prImage_OSign.HelpKeyword:='';
  prImage_OSign.Picture.Clear;
  SetAllText;
end;
///////////


/////////////////////////////// Signature Witness
procedure TForm1.prSB_WSignatureClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg:= TOpenDialog.Create(self);
  OpenDlg.Name:='OpenDialog_WSignature';
  OpenDlg.Options:=[ofAutoPreview];
  OpenDlg.Filter :='Only PNG-files with transparent background|*.png';   //  'Image files only|*.jpg;*.png';
  if OpenDlg.Execute then
    begin
      prImage_WSign.Picture.LoadFromFile(OpenDlg.FileName);
      prImage_WSign.HelpKeyword:=OpenDlg.FileName;
      SetAllText;
    end;
  OpenDlg.Free;
end;
procedure TForm1.prImage_WSignDblClick(Sender: TObject);
begin
  prImage_WSign.HelpKeyword:='';
  prImage_WSign.Picture.Clear;
  SetAllText;
end;
///////////


///////////////////////////// Name Witness
procedure TForm1.prShape_WNameMouseEnter(Sender: TObject);
begin
  prEdit_WName.Visible:=true;
end;
procedure TForm1.prShape_WNameMouseLeave(Sender: TObject);
begin
  if (prEdit_WName.MouseEntered=false) then
     begin
       MyPause(100);
       if (prEdit_WName.Focused=false) then  prEdit_WName.Visible:=false;
     end;
end;
procedure TForm1.prEdit_WNameClick(Sender: TObject);
begin
  prEdit_WName.SetFocus;
end;
procedure TForm1.prEdit_WNameKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then SetAllText;
end;
//////////



end.


