#Include classGDIp.ahk
#NoTrayIcon
API := new GDIp()

size         := [ 1000, 600 ]
rect         := size.clone(), rect.insertAt( 1, 0, 0 )
rect2        := rect.clone(), rect2.1 += 100, rect2.2 += 100, rect2.3 -= 200, rect2.4 -= 200

GUI1 := GuiCreate()
GUI1.Opt("-Caption")
GUI1.Opt("+ToolWindow")
GUI1.Show("w" . size.1 . " h" . size.2)

hDC          := new GDI.DC( GUI1.hwnd )
testGraphics := hDC.getGraphics()
GoTo Paint

F5::
Paint:
Critical
testGraphics.setClipRect( rect )
testGraphics.setClipRect( rect2, 3 )
testGraphics.clear( 0xFF00FF00 )
testGraphics.setClipRect( rect, 3 )
testGraphics.clear( 0xFFFF00FF )
testGraphics.resetClip()
return

~LButton::
If WinActive( "ahk_id " . GUI1.hwnd )
	GoTo Paint
esc::
GUIClose:
ExitApp

randomColor( A := 255 )
{
	if ( A == "" )
		A:= Random(0,255)
	R:=Random(0,255)
	G:=Random(0,255)
	B:=Random(0,255)
	return ( A << 24 ) | ( R << 16 ) | ( G << 8 ) | B 
}