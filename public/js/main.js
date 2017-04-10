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
        clear('password','secret');
    }
    function c3()
    {
        clear('password_confirmation','secret');
    }
    function c4()
    {
        clear('username','username');
    }
    function c5() {
        clear('email','email');
    }