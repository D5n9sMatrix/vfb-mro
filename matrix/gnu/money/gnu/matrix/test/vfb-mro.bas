/'
Preface to the First Edition xi
of the vector.” Also, my use of an expression generally implies existence. For
example, if “AB” is used to represent a matrix product, it implies that “A
and B are conformable for the multiplication AB.” Occasionally, I remind the
reader that I am taking such shortcuts.
The material in Part I, as in the entire book, was built up recursively. In
the first pass, I began with some definitions and followed those with some
facts that are useful in applications. In the second pass, I went back and
added definitions and additional facts that led to the results stated in the first
pass. The supporting material was added as close to the point where it was
needed as practical and as necessary to form a logical flow. Facts motivated by
additional applications were also included in the second pass. In subsequent
passes, I continued to add supporting material as necessary and to address
the linear algebra for additional areas of application. I sought a bare-bones
presentation that gets across what I considered to be the theory necessary for
most applications in the data sciences. The material chosen for inclusion is
motivated by applications.
'/
Declare Function AB ( ByRef Math As T1, ByRef Physics As T2, ByRef Sciences As T3) As Integer

Type Math
    Dim MathTypes As T1 
End Type 

Type Physics
   Dim PhysicsEvent As T2 
End Type 

Type Sciences
    Dim SciencesObjes As T3 
End Type 

WindowTitle "Country Walker"

#Include "fbgfx.bi"

Declare Function NextCell As Integer
Declare Function CountryIndex(xPos As Integer,yPos As Integer) As Integer

Declare Sub CreateCountry
Declare Sub CountryWalker

Declare Sub DrawCountry(CursorFlag As Integer,CursorColor As UInteger)

Randomize Timer

Type NewCountry
	North As Integer
	East As Integer
	South As Integer
	West As Integer
	Visit As Integer

  Rows As Integer
  Cols As Integer

  Fuglefoderize As Integer
  CountryLen As Integer

  CountryPos As Integer
  CellPos As Integer
  KeyListPos As Integer

  xDesktop As Integer
  yDesktop As Integer

  xScreen As Integer
  yScreen As Integer
End Type

Dim Shared Country As NewCountry

Type KeyListCheck
  First As Integer
  Secnd As Integer
  Third As Integer
End Type

Type NewSprite
  xPos As Integer
  yPos As Integer

  xFrame As Integer
  yFrame As Integer

  xSteps As Integer
  ySteps As Integer

  Image As FB.Image Ptr
End Type

Dim Shared MyArgs As NewSprite

ScreenInfo Country.xDesktop,Country.yDesktop

Country.North=1
Country.East =2
Country.South=4
Country.West =8
Country.Visit=16

Dim As String tBin
Dim Shared As String CountryCursor(8)

For tiSet As Integer=0 To 7
  tBin=Bin(Val("&H"+Mid("3C7EFFFFFFFF7E3C",2*tiSet+1,2)))
  CountryCursor(tiSet+1)=Right(String(8,48)+tBin,8)
Next

Country.Fuglefoderize=47
Country.xScreen=800
Country.yScreen=600

Country.Cols=Country.xScreen\(Country.Fuglefoderize+1)
Country.Rows=Country.yScreen\(Country.Fuglefoderize+1)

If Country.xScreen<Country.xDesktop And Country.yScreen<Country.yDesktop Then
  If Country.Cols*(Country.Fuglefoderize+1)+1>Country.xScreen Then Country.xScreen+=1
  If Country.Rows*(Country.Fuglefoderize+1)+1>Country.yScreen Then Country.yScreen+=1
Else
  If Country.Cols*(Country.Fuglefoderize+1)+1>Country.xDesktop Then Country.Cols-=1
  If Country.Rows*(Country.Fuglefoderize+1)+1>Country.yDesktop Then Country.Rows-=1
End If

Country.CountryLen=Country.Cols*Country.Rows
Dim Shared KeyList(Country.CountryLen)  As KeyListCheck
Dim Shared Crumbs(Country.CountryLen) As KeyListCheck

Dim Shared As Integer CountryFuglefoder(Country.CountryLen)

If Country.xScreen<=Country.xDesktop And Country.yScreen<=Country.yDesktop Then
  If Country.xScreen<Country.xDesktop And Country.yScreen<Country.yDesktop Then
    ScreenRes Country.xScreen,Country.yScreen,32
  End If

  If Country.xScreen=Country.xDesktop And Country.yScreen=Country.yDesktop Then
    ScreenRes Country.xScreen,Country.yScreen,32,,FB.Gfx_FullScreen
  End If

  Line(0,0)-(Country.xScreen-1,Country.yScreen-1),RGB(0,0,255),bf

  While InKey<>Chr(27)
    CreateCountry
    If Country.Fuglefoderize=47 Then CountryWalker
  Wend

  If Country.Fuglefoderize=47 Then ImageDestroy MyArgs.Image
End If

Function CountryIndex(xPos As Integer,yPos As Integer) As Integer
Dim As Integer tIndex=(yPos*Country.Cols+xPos)+1

If xPos<0 or xPos>Country.Cols-1 Then tIndex=-1
If yPos<0 or yPos>Country.Rows-1 Then tIndex=-1

If tIndex>0 Then
  If tIndex>(Country.CountryLen) Then	tIndex=-1
  If CountryFuglefoder(tIndex) And Country.Visit Then tIndex=-1
Else
	tIndex=-1
End If

CountryIndex=tIndex
End Function

Function NextCell As Integer
Dim As Integer tIndex
Dim As String Direction=""

Dim As Integer xPos=(Country.CellPos-1) Mod Country.Cols
Dim As Integer yPos=(Country.CellPos-1)  \  Country.Cols

Dim As Integer NorthIndex=CountryIndex(xPos,yPos-1)
If NorthIndex>0 Then Direction="N"

Dim As Integer  EastIndex=CountryIndex(xPos+1,yPos)
If EastIndex >0 Then Direction=Direction+"E"

Dim As Integer SouthIndex=CountryIndex(xPos,yPos+1)
If SouthIndex>0 Then Direction=Direction+"S"

Dim As Integer  WestIndex=CountryIndex(xPos-1,yPos)
If WestIndex >0 Then Direction=Direction+"W"

If Direction="" Then
  tIndex=-1
Else
  Direction=Mid(Direction,Int(Len(Direction)*Rnd)+1,1)

  Select Case Direction
	  Case "N"
      tIndex=NorthIndex
      CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.North
      CountryFuglefoder(NorthIndex)=CountryFuglefoder(NorthIndex) Xor Country.South

	  Case "E"
      tIndex=EastIndex
      CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.East
      CountryFuglefoder(EastIndex)=CountryFuglefoder(EastIndex) Xor Country.West

	  Case "S"
      tIndex=SouthIndex
      CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.South
      CountryFuglefoder(SouthIndex)=CountryFuglefoder(SouthIndex) Xor Country.North

	  Case "W"
      tIndex=WestIndex
      CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.West
      CountryFuglefoder(WestIndex)=CountryFuglefoder(WestIndex) Xor Country.East
  End Select
End If

NextCell=tIndex
End Function

Function NextRoom As Integer
Dim As String Direction
Dim As Integer tIndex,xPos,yPos
Dim As Integer NorthExit,EastExit,SouthExit,WestExit

tIndex=-1
MyArgs.yFrame=0

xPos=(Country.CellPos-1) Mod Country.Cols
yPos=(Country.CellPos-1)  \  Country.Cols

' Notes:
' Changing this order changes how the Args will solve the Country
' This order makes her always try to go south and east towards the exit

NorthExit=CountryIndex(xPos,yPos-1)
If NorthExit>0 And (CountryFuglefoder(Country.CellPos) And Country.North)=0 Then
	Direction="N"
	tIndex=NorthExit

	MyArgs.xSteps=0
	MyArgs.ySteps=-1
	MyArgs.yFrame=Country.North
End If

SouthExit=CountryIndex(xPos,yPos+1)
If SouthExit>0 And (CountryFuglefoder(Country.CellPos) And Country.South)=0 Then
	Direction=Direction+"S"
	tIndex=SouthExit

	MyArgs.xSteps=0
	MyArgs.ySteps=1
	MyArgs.yFrame=Country.South
End If

WestExit=CountryIndex(xPos-1,yPos)
If WestExit >0 And (CountryFuglefoder(Country.CellPos) And Country.West)=0 Then
	Direction=Direction+"W"
	tIndex=WestExit

	MyArgs.ySteps=0
	MyArgs.xSteps=-1
	MyArgs.yFrame=Country.West
End If

EastExit=CountryIndex(xPos+1,yPos)
If EastExit >0 And (CountryFuglefoder(Country.CellPos) And Country.East)=0 Then
	Direction=Direction+"E"
	tIndex=EastExit

	MyArgs.ySteps=0
	MyArgs.xSteps=1
	MyArgs.yFrame=Country.East
End If

NextRoom=tIndex
End Function

Sub CreateCountry
Dim As UInteger CursorColor
Dim As String tBin,CountryCursor(8)

For SetCountry As Integer=1 To Country.CountryLen
	CountryFuglefoder(SetCountry)=15

	KeyList(SetCountry).First=-1
	KeyList(SetCountry).Secnd=-1
Next

Country.CellPos=1
CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.West
CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.Visit

CountryFuglefoder(Country.CountryLen)=CountryFuglefoder(Country.CountryLen) Xor Country.East

Country.KeyListPos=1
KeyList(Country.KeyListPos).First=Country.CellPos

Country.CountryPos=0
While Country.CountryPos<>Country.CountryLen-1
  Dim As Integer tIndex=NextCell

  If tIndex>0 Then
    CursorColor=RGB(0,255,0)

    Country.CellPos=tIndex
    CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.Visit

    Country.KeyListPos+=1
    KeyList(Country.KeyListPos).First=Country.CellPos

    Country.CountryPos+=1
  Else
    CursorColor=RGB(255,0,0)

    Country.KeyListPos-=1
    If Country.KeyListPos<0 Then	Exit Sub

    Country.CellPos=KeyList(Country.KeyListPos).First
  End If

  DrawCountry 1,CursorColor

  Sleep 10
  If InKey=Chr(27) Then End
Wend
End Sub

Sub DrawCountry(CursorFlag As Integer,CursorColor As UInteger)
ScreenLock

  Dim As Integer x1=0
  Dim As Integer y1=0

  Dim As Integer w =Country.Fuglefoderize+1
  Dim As Integer x2=Country.Cols*w+1
  Dim As Integer y2=Country.Rows*w+1

  Line(0,0)-(x2,y2),RGB(0,0,255),bf

  For Show As Integer=1 To Country.CountryLen
    x1=w*((Show-1) Mod Country.Cols)
    y1=w*((Show-1)  \  Country.Cols)

    If CountryFuglefoder(Show) And Country.North Then Line (x1,y1)  -(x1+w,y1),RGB(255,215,0)
    If CountryFuglefoder(Show) And Country.East  Then Line (x1+w,y1)-(x1+w,y1+w),RGB(255,215,0)
    If CountryFuglefoder(Show) And Country.South Then Line (x1,y1+w)-(x1+w,y1+w),RGB(255,215,0)
    If CountryFuglefoder(Show) And Country.West  Then Line (x1,y1)  -(x1,y1+w),RGB(255,215,0)
  Next

  If CursorFlag=1 Then
    Dim As Integer CursorSize=Country.Fuglefoderize\8

    Dim As Integer xPos=w*((Country.CellPos-1) Mod Country.Cols)+1
    Dim As Integer yPos=w*((Country.CellPos-1)  \  Country.Cols)+1

    For y As Integer=0 To 7
      y1=CursorSize*y
      y2=y1+(CursorSize-1)

      For x As Integer=0 To 7
        x1=CursorSize*x
        x2=x1+(CursorSize-1)

        If Mid(CountryCursor(y+1),x+1,1)="1" Then
          Line(x1+xPos,y1+yPos)-(x2+xPos,y2+yPos),CursorColor,bf
        End If
      Next
    Next
  Else
    For x As Integer=1 To Country.CountryPos
    	x1=Crumbs(x).First-5
    	y1=Crumbs(x).Secnd+3

      If Crumbs(x).Third And Country.Visit Then
        Line(x1,y1)-(x1+42,y1+42),RGB(160,82,45),bf
      Else
        Line(x1,y1)-(x1+42,y1+42),RGB(0,0,255),bf
      End If
    Next

    If MyArgs.yFrame And Country.North Then y2=144
    If MyArgs.yFrame And Country.East  Then y2=96
    If MyArgs.yFrame And Country.South Then y2=0
    If MyArgs.yFrame And Country.West  Then y2=48

    x2=32*MyArgs.xFrame
    Put(MyArgs.xPos,MyArgs.yPos),MyArgs.Image,(x2,y2)-(x2+31,y2+47),Trans
  End If

ScreenUnLock
End Sub

Sub CountryWalker
Dim As Integer tIndex
Dim As ULong TrackColor=RGB(0,0,255)

MyArgs.Image=ImageCreate(128,192)
BLoad "CountryArgs.bmp",MyArgs.Image

MyArgs.xPos=9
MyArgs.yPos=1
MyArgs.xFrame=0
MyArgs.yFrame=Country.South
DrawCountry 0,0

For tIndex=1 To Country.CountryLen
  CountryFuglefoder(tIndex)=CountryFuglefoder(tIndex) Xor Country.Visit
Next

Country.CellPos=1
CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.Visit

Country.KeyListPos=0
KeyList(Country.KeyListPos).First=Country.CellPos

Country.CountryPos=1
While Country.CellPos<>Country.CountryLen
	tIndex=NextRoom

  If tIndex>0 Then
    Country.CellPos=tIndex
    CountryFuglefoder(Country.CellPos)=CountryFuglefoder(Country.CellPos) Xor Country.Visit

    Country.KeyListPos+=1
    KeyList(Country.KeyListPos).First=Country.CellPos
    KeyList(Country.KeyListPos).Secnd=MyArgs.yFrame
    
    Country.CountryPos+=1
    Crumbs(Country.CountryPos).First=MyArgs.xPos
    Crumbs(Country.CountryPos).Secnd=MyArgs.yPos
    Crumbs(Country.CountryPos).Third=Country.Visit
  Else
    tIndex=KeyList(Country.KeyListPos).Secnd

    Crumbs(Country.CountryPos).Third=0
    Country.CountryPos-=1

    If tIndex=Country.North Then
      MyArgs.xSteps=0
    	MyArgs.ySteps=1
    	MyArgs.yFrame=Country.South
    End If

    If tIndex=Country.East Then
      MyArgs.ySteps=0
    	MyArgs.xSteps=-1
    	MyArgs.yFrame=Country.West
    End If

    If tIndex=Country.South Then
      MyArgs.xSteps=0
    	MyArgs.ySteps=-1
    	MyArgs.yFrame=Country.North
    End If

    If tIndex=Country.West Then
      MyArgs.ySteps=0
    	MyArgs.xSteps=1
    	MyArgs.yFrame=Country.East
    End If

    Country.KeyListPos-=1
    If Country.KeyListPos<0 Then	Exit Sub

    Country.CellPos=KeyList(Country.KeyListPos).First
  End If

  For tSteps As Integer=0 To 11
    MyArgs.xFrame=Val(Mid("00011122233",tSteps+1,1))

    MyArgs.xPos+=4*MyArgs.xSteps
    If MyArgs.xPos<0 or MyArgs.xPos>Country.xScreen Then Exit Sub

    MyArgs.yPos+=4*MyArgs.ySteps
    If MyArgs.yPos<0 or MyArgs.yPos>Country.yScreen Then Exit Sub

    DrawCountry 0,0
    Sleep 16
    
    If InKey=Chr(27) Then
    	ImageDestroy MyArgs.Image
    	End
    End If
  Next
Wend

MyArgs.xFrame=0
MyArgs.yFrame=Country.South
DrawCountry 0,0
Sleep 1000
End Sub
End
