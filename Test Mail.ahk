#Include classGDIp.ahk
#NoTrayIcon
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

testBrush    := new GDIp.LinearGradientBrush( [ 0, 0 ], [ 0, 0, size.1 / 2, size.2 / 2 ], 0, 1 )
testPen      := new GDIp.Pen( testBrush, 5 )
testPen2     := new GDIp.Pen( 0xFF000000, 10 )
GoTo Paint

F5::
Paint:
Critical
testBrush.setColor( color := [ randomColor(), randomColor() ] )
testPen.setBrush()
testPen2.setColor( color.1 )
testGraphics.clear( 0xFF000000 )
testGraphics.drawLines( testPen , [ [ 0, 0 ],[ size.1 / 2 ,size.2 / 2 ], [ size.1, 0 ] ] )
testGraphics.drawLines( testPen2, [ [ 0, 0 ], [ size.1, 0 ], [ size.1, size.2 ], [ 0, size.2 ], [ 0, 0 ] ] )
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