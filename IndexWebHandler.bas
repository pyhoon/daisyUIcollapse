B4J=true
Group=Handlers
ModulesStructureVersion=1
Type=Class
Version=10.2
@EndOfDesignText@
Sub Class_Globals
	Private Request As ServletRequest
	Private Response As ServletResponse
	Private Method As String
	Private Elements() As String
End Sub

Public Sub Initialize
	
End Sub

Sub Handle (req As ServletRequest, resp As ServletResponse)
	Request = req
	Response = resp
	Method = Request.Method.ToUpperCase
	Dim FullElements() As String = WebApiUtils.GetUriElements(Request.RequestURI)
	Elements = WebApiUtils.CropElements(FullElements, 1) ' 1 For Index handler
	If Method <> "GET" Then
		WebApiUtils.ReturnHtmlMethodNotAllowed(Response)
		Return
	End If
	If ElementMatch("") Then
		ShowIndexPage
		Return
	End If
	WebApiUtils.ReturnHtmlPageNotFound(Response)
End Sub

Private Sub ElementMatch (Pattern As String) As Boolean
	Select Pattern
		Case ""
			If Elements.Length = 0 Then
				Return True
			End If
	End Select
	Return False
End Sub

Private Sub ShowIndexPage
	Dim content As String = File.ReadString(File.DirApp, "index.html")
	LogColor(content, -16776961)
	WebApiUtils.ReturnHTML(content, Response)
End Sub