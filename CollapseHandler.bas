B4J=true
Group=Handlers
ModulesStructureVersion=1
Type=Class
Version=10.2
@EndOfDesignText@
'Handler class
Sub Class_Globals
	
End Sub

Public Sub Initialize
	
End Sub

Public Sub Handle (req As ServletRequest, resp As ServletResponse)
	Dim content As String = "<p class='text-green-600'>✅ This content was loaded from the B4J server using HTMX!</p>"
	WebApiUtils.ReturnHTML(content, resp)
End Sub