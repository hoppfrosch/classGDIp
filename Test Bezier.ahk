#Include classGDIp.ahk
;#NoTrayIcon
API := new GDIp()

size         := [ 1000, 600 ]
rect         := size.clone(), rect.insertAt( 1, 0, 0 )

GUI1 := GUICreate()
GUI1.Options("-Caption")
GUI1.Options("+ToolWindow")
GUI1.Show("w" . size[1] . " h" . size[2])

hDC          := new GDI.DC( GUI1.hwnd )
testGraphics := hDC.getGraphics()
testGraphics.setSmoothingMode( 4 )
testGraphics.setInterpolationMode( 7 )

testPen       := new GDIp.Pen( 0xFF000000, 4 )
Bezier        := [ [ 0, 0], [ 1000, 0 ], [ 0, 600 ], [ 1000, 600 ], [ 1000, 0 ], [ 0, 600 ], [ 0, 0 ] ] 
GoTo Paint

F5::
Paint:
Critical
testGraphics.clear( randomColor() )
testPen.setColor( randomColor() )
testGraphics.drawBezier( testPen, Bezier )
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
		A := Random(0,255)
	R := Random(0,255)
	G := Random(0,255)
	B := Random(0,255)
	return ( A << 24 ) | ( R << 16 ) | ( G << 8 ) | B 
}