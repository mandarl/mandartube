<!-- #include file="Upload.asp" -->

<%

Dim sFile
Dim sKey
Dim sFeaturePath

Set Uploader = New FileUploader

Uploader.Upload()

sFeaturePath = Uploader.Form("feature")
sKey = Uploader.Form("key")
If Uploader.Files.Count = 0 Then
	Response.Write "File(s) not uploaded."
Else
	' Loop through the uploaded files
	For Each File In Uploader.Files.Items
		
		' Check where the user wants to save the file
		If Uploader.Form("saveto") = "disk" Then
	
			' Save the file
			File.SaveToDisk "D:\Mandar\asp\flv\data\" & sFeaturePath & "\"
	
		End If
		
		' Output the file details to the browser
		Response.Write "File Uploaded: " & File.FileName & "<br>"
		Response.Write "Size: " & File.FileSize & " bytes<br>"
		Response.Write "Type: " & File.ContentType & "<br><br><a href=""/?feature=" & sFeaturePath & "&key=" & sKey & """>Home</a>"
		'Response.Redirect("/?feature=" & sFeaturePath & "&key=" & sKey)
	Next
End If

%>
