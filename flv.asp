<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<title>MandarTube                .</title>


	<style type="text/css" title="currentStyle">
		@import "dataTables-1.5/media/css/demo_table.css";
		@import "dataTables-1.5/media/css/demo_page.css";
	</style>

    <style type="text/css">
			#dt_example h1  {
				border-bottom: #b0bed9 1px solid;
				font-size: 1.3em;
				line-height: 1.6em;
				margin-top: -15px;

			}
			
			img
			{  
				border-style: none;
			}
    </style>
    <!--[if IE]>
    <style type="text/css">
			#container {
				margin-left: 30px;
			}
			#vidname {
				border-bottom: #b0bed9 1px solid;
				font-size: 1.3em;
				line-height: 1.6em;
				margin-top: -15px;
			}
    </style>
    <![endif]-->

</head>
<body id="dt_example" style="background-color:#FAFDFD">
	<img src="http://punitp97105d/dataTables-1.5/media/images/back_disabled.jpg" style="visibility:hidden;"/>
	<img src="http://punitp97105d/dataTables-1.5/media/images/forward_disabled.jpg" style="visibility:hidden;"/>
	<img src="http://punitp97105d/dataTables-1.5/media/images/sort_both.jpg" style="visibility:hidden;"/>
	<img src="http://punitp97105d/dataTables-1.5/media/images/sort_desc.jpg" style="visibility:hidden;"/>
	
	
		<div id="container1" style="margin-left: auto;margin-right: auto;width:800px;padding:50px;background-color:#FFF">
			<div id="divUploaders" style="margin-top: 20px;float: left;">
					<span style="color: red;"><b>Uploaders:</b></span>
					<span><a href="?feature=Abhijit">Abhijit</a></span> | 
					<span><a href="/">Mandar</a></span>
			</div>
			<div id="logo" style="float:right;"><a href="/"><img src="images/logo.gif" BORDER="0" /></a></div>
	    
<%

Dim sFilePath
Dim sFileName
Dim sBaseFolder
Dim sFeaturePath
Dim sFeatureLink
Dim sFLVPath
Dim sDescription
Dim sDescriptionFilePath

sFileName = Replace(Request.QueryString("file"),".flv","")
sFeaturePath = Request.QueryString("feature")
sKey = Request.QueryString("key")


'sFilePath = "http%3A//172.25.179.33/data/" & sFeaturePath & "/" & sFileName & ".flv"
sFilePath = "data/" & sFeaturePath & "/" & sFileName & ".flv"
'sFLVPath = "http://172.25.179.33/data/" & sFeaturePath & "/" & sFileName & ".flv"
sFLVPath = "/data/" & sFeaturePath & "/" & sFileName & ".flv"
sBaseFolder = "D:\temp"
If sFeaturePath <> "" Then
	sDescriptionFilePath = ".\data\" & sFeaturePath & "\" & sFileName & ".flv.description"
Else
	sDescriptionFilePath = ".\data\" & sFileName & ".flv.description"
End If




If sFileName <> "" Then
	Response.Write "<h1 id=""vidname"">" & sFileName & "</h1><br>"
	
	Response.Write "<table width='100%'><tr><td><table width='590px'><tr><td>"
	Response.Write "<div id=""vcontainer""><span style=""color:#FF0000"">You need Flash Player 10 to play videos: </span><a href=""InstallFlash10.exe""><u>Install Adobe Flash Player</u></a><br/><br/><br/><br/></div>"
	
'	Response.Write "<embed src='player.swf' width='480'  height='385' allowscriptaccess='always'"
'	Response.Write "allowfullscreen='true'  flashvars='file="
'	Response.Write sFilePath
'	Response.Write "&autostart=true'/>"

	'If sFeaturePath <> "" Then
	    sDescription = ReadFromFile(sDescriptionFilePath)
	    If sDescription <> "" Then
	    	Response.Write("<br><p>" & sDescription & "</p><br><br>")
	    End If
	'End If
	Response.Write "</td><td>&nbsp;</td>"
	Response.Write "<td align='right' valign='top' style='padding: 8px; background-color: rgb(238, 238, 238);'><table><tr><td>"
	pageUrl = Request.ServerVariables("URL") & "?" & Request.Querystring
	strHost2 = "http://punitp97105d" & pageUrl
	strHost1 = "http://172.25.179.33" & pageUrl

'Server.URLEncode(strHost1) & "%0A%0Aor%0A%0A" & 

	bodyText = Server.URLEncode(strHost2)
	Response.Write "<div><a href='mailto:?subject=MandarTube: " & sFileName & "&body=" & bodyText & "'><img src='images/mail.png' alt='Email video link' style='height:50px;width:50px;margin-left:-1px;' /></a></div>"
	Response.Write "</td></tr><tr><td>"
	'Response.Write "<br><div><a href='" & sFLVPath & "'>Download FLV</a></div>"
	Response.Write "<div><a href='" & sFLVPath & "'><img src='images/save.png' alt='Download the FLV file' style='height:45px;width:45px;margin-left:2px;' /></a></div>"
	Response.Write "</td></tr>"
	Response.Write "</table></td></tr></table></td><td align='right' valign='top' style='text-align: right; font-family: monospace; font-size: 1.5em; padding: 25px; background-color: rgb(238, 238, 238);'>"
	Response.Write "<table>"
	Response.Write "<tr><td><h3>Sections</h3></td></tr>"
	Response.Write "<tr><td><a href='/'>Home</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=Mobile'>Android</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=GoogleIO_2012'>Google IO</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=GIT'>GIT</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=Cloud'>Cloud</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=Trailers'>Trailers</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=Abhijit'>Abhijit</a></td></tr>"
	Response.Write "<tr><td><a href='/?feature=Aspen2012'>Aspen2012</a></td></tr>"
	
	Response.Write "</table>"
	Response.Write "<td></tr></table>"
End If

Call FileSort(".\data\" & sFeaturePath)



Sub FileSort(folder)
'****
'*
'* This subroutine lists files in a folder by DateCreated.
'*
'****
'*
'* Declare Constants
'*
Const cRS1 = "DateCreated"
Const cRS2 = "FileName"
'*
Const adChar = 129
Const adDate = 7
Const adLockBatchOptimistic = 4
Const adOpenStatic = 3
Const adUseClient = 3
'*
'* Declare Objects
'*
Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")
Dim objGFO
Set objGFO = objFso.GetFolder(Server.MapPath(folder))
Dim objFIL
Set objFIL = objGFO.Files
Dim objRST
Set objRST = CreateObject("ADODB.RecordSet")
objRST.CursorLocation = adUseClient
objRST.LockType = adLockBatchOptimistic
objRST.CursorType = adOpenStatic
objRST.ActiveConnection = Nothing
objRST.Fields.Append cRS1, adDate
objRST.Fields.Append cRS2, adChar, 255
objRST.Open
'*
'* Files
'*
Dim intFIL
For Each intFIL In objFIL
	If InStr(intFil.name, ".flv") > 0 And InStr(intFil.name, ".description") < 1 Then
		objRST.AddNew
		objRST.Fields(cRS1) = intFIL.DateLastModified
		objRST.Fields(cRS2) = intFIL.name
		objRST.Update
	End If
Next
'*
'* Sort RecordSet
'*
objRST.Sort = cRS1 & " ASC"

	If sFeaturePath <> "" Then
		Response.Write("<br/><br/><br/><br/><H1>Featured Presenter: <U>" & sFeaturePath & "</U></H1>")
		If sKey = "cricab" Then
			Response.Write(GetUploadControl(sFeaturePath,sKey))
		End If
	Else
		Response.Write("<br/><br/><br/><br/><H1>More Videos:</H1>")
	End If


If objRST.RecordCount > 0 Then
	objRST.MoveFirst
	'*
	'* Read RecordSet
	'*
	Response.Write("<TABLE id=""tblMovies"" class=""display""> <thead><tr><th>Video Name</th><th>Added On</th></tr></thead><tbody>")
	
	If sFeaturePath <> "" Then
		sFeatureLink = "feature=" & sFeaturePath & "&"
	End If
	Do While Not objRST.EOF
		Response.Write("<TR><TD><a href='?" & sFeatureLink & "file=" & Replace(Trim(objRST.Fields(cRS2)),".flv","") & "'>" & Replace(Trim(objRST.Fields(cRS2)),".flv","") & "</a></TD><TD style=""font-family:Courier New;"">" & _
		FormatDate(objRST.Fields(cRS1),"mmm dd, yyyy") & "</TD></TR>")
		objRST.MoveNext
	Loop
	
	Response.Write("</TBODY></TABLE>")
Else
	Response.Write("<h2>No videos found!</h2>")
End If
Response.Write("<BR /><HR /><BR /><div><a href='https://github.com/mandarl/mandartube'><img src='images/github-logo.png' /></a></div><BR />")

'*
'* Destroy Objects
'*
objRST.Close
Set objRST = Nothing
Set objFIL = Nothing
Set objGFO = Nothing
Set objFSO = Nothing
End Sub

'****************************************************
'Function reads from a given file
'****************************************************
Function ReadFromFile(strFile)
    on Error Resume Next
	Dim objFSO, objFile
	
	Set objFSO = CreateObject("Scripting.FileSystemObject")
    
	If objFSO.fileExists(Server.MapPath(strFile)) Then
	    Set objFile = objFSO.OpenTextFile(Server.MapPath(strFile))
	
	    ReadFromFile = objFile.ReadAll()
	Else
	    ReadFromFile = ""
	End If
	
End Function

%>
</div>

    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="dataTables-1.5/media/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
		var oTable;
		
		$(document).ready(function() {
			// Init the table 
			//alert("here");
			oTable = $('#tblMovies').dataTable({
			"aaSorting": [ [1,'desc'] ],
			"iDisplayLength": 50
		});
		});
	
	
	</script>
	
<script type="text/javascript" src="swfobject1.5.js"></script>
<script type="text/javascript">
	var flvSwitch = "<%=sFileName%>";
	var flvURL = "<%=sFilePath%>";
	if(flvSwitch != "")
	{
//'	Response.Write "<embed src='player.swf' width='480'  height='385' allowscriptaccess='always'"
//'	Response.Write "allowfullscreen='true'  flashvars='file="
//'	Response.Write sFilePath
//'	Response.Write "&autostart=true'/>"

		var s1 = new SWFObject("player.swf","ply","480","385","10.0.0","#FFFFFF");
		s1.addParam("allowfullscreen","true");
		s1.addParam("allowscriptaccess","always");
		s1.addParam("flashvars","file=" + flvURL + "&autostart=true");
		s1.write("vcontainer");
		//if (s1.hasFlashPlayerVersion("9.0.18")) {
	  //	alert("install flash");
		//}

	}
</script>
</body></html>




<%

Function GetUploadControl(sFeature, sKey)
	dim result
	result = "<div><form METHOD='POST' ENCTYPE='multipart/form-data' action='process.asp'><input type='file' name='file' /><input type='hidden' value='disk' name='saveto' />"
	result = result & "<input type='hidden' name='feature' value='" & sFeature
	result = result & "'/><input type='hidden' name='key' value='" & sKey
	result = result & "'/><input type='submit' value='Upload' /></form>"
	result = result & "</div><hr/>"
	GetUploadControl = result
End Function

Function FormatDate(strDate, strDateFmt)
  dim strRet
  dim i  
  dim formatBlock
  dim formatLength
  dim charLast
  dim charCur
  
  formatLength = len(strDateFmt)
  
  for i = 1 to formatLength + 1
    ' grab the current character
    charCur = mid(strDateFmt, i, 1)
    
    if charCur = charLast then
        ' The block is not finished. 
        ' Continue growing the block and iterate to the next character.
        formatBlock = formatBlock & charCur
    else
        ' we have a change and need to handle the previous block
        select case formatBlock
        case "mmmm"
            strRet = strRet & MonthName(DatePart("m",strDate),False)
        case "mmm"
            strRet = strRet & MonthName(DatePart("m",strDate),True)
        case "mm"
            strRet = strRet & right("0" & DatePart("m",strDate),2)
        case "m"
            strRet = strRet & DatePart("m",strDate)
        case "dddd"
            strRet = strRet & WeekDayName(DatePart("w",strDate,1),False)
        case "ddd"
            strRet = strRet & WeekDayName(DatePart("w",strDate,1),True)
        case "dd"
            strRet = strRet & right("0" & DatePart("d",strDate),2)
        case "d"
            strRet = strRet & DatePart("d",strDate)
        case "o"
            strRet = strRet & intToOrdinal(DatePart("d",strDate))
        case "yyyy"
            strRet = strRet & DatePart("yyyy",strDate)
        case "yy"
            strRet = strRet & right(DatePart("yyyy",strDate),2)
        case "y"
            strRet = strRet & cInt(right(DatePart("yyyy",strDate),2))
        case else
            strRet = strRet & formatBlock
        end select
        ' Block handled.  
        ' Now reset the block and continue iterating to the next character.
        formatBlock = charCur
    end if
    
    charLast = charCur
  next 'i
 
  FormatDate = strRet
End Function

%>
