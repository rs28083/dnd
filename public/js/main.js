    function clear(id,value)
    {
        var str = document.getElementById(id).value;
        if(str == value){
            document.getElementById(id).value="";
        }
    }
    function c1()
    {
        clear('thePass','secret');
    }
        function c2()
    {
        clear('password1','secret');
    }
    function c3()
    {
        clear('password2','secret');
    }
    function c4()
    {
        clear('username','username')
    }