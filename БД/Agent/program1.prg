SET TALK OFF 
SET DATE TO GERMAN 
SET CENTURY on 
SET ESCAPE OFF 
SET PATH TO TO libs, PRG, menus, data, reports 
DO FORM "C:\Agent\Login.scx" 
SET HELP TO "C:\Agent\spravka.chm" 
IF FILE('C:\Agent\agent.jpg')
_SCREEN.Picture=[C:\Agent\agent.jpg]
ENDif
_SCREEN.Visible=.T. 
_SCREEN.AutoCenter=.T. 
_SCREEN.ControlBox=.F. 
_screen.Caption="Туристическое агентство" 
READ events 
ON SHUTDOWN 
CLEAR EVENTS 
RETURN 0