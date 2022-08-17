#singleinstance force ;限制單線

lis_packages(){
    ; 需要安裝的模組
    lis := []
    lis.Push("PySimpleGUI")

    lis.Push("click")
    lis.Push("colorama")
    lis.Push("importlib_metadata")

    return lis
}

update_handle(){ ; 更新

    c_server_dir = \\220.168.100.104\pdm\s_py_server
    c_client_python_dir = C:\python37_lib
    
    if FileExist(c_client_python_dir){
        ; Msgbox, 資料夾已存在
    }
    else{
        ; Msgbox, 資料夾不存在
        FileCreateDir, %c_client_python_dir% ; 建立資料夾
    }

    ;更新 pythob解釋器
    FileCopy, %c_server_dir%\python37.exe, %c_client_python_dir%\python37.exe, 1 

    ;更新 dirsync 模組
    lis := lis_packages()
    for index, element in lis{
        ; MsgBox % "Element number " . index . " is " . element
        FileCopyDir, %c_server_dir%\%element%, %c_client_python_dir%\%element%, 1 ;更新覆蓋模組
    }    
}

main(){
    MsgBox, % 32 + 4, Python系統更新, 您要進行更新嗎?
    IfMsgBox, Yes
    {
        update_handle()
        Msgbox, 64, Python系統更新, 更新完畢
    }
}

main()