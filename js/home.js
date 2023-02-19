class Home extends Init{
    
}

let home =  new Home("Home");
home.setPageTitle();
home.redirectToWelcome();

let loginForm = document.getElementById('loginForm');
loginForm.addEventListener("submit", function(event){
    event.preventDefault();
    loginForm.children[2].setAttribute("disabled", true);
    loginForm.children[2].innerHTML = home.pleaseWait();
    loginForm.setAttribute("disabled", true);
    let logg = home.login(loginForm);
    if(logg.status){
        console.log(logg.msg);
        // home.showSensibleData();
        home.redirectToWelcome();
    }else{
        loginForm.children[2].removeAttribute("disabled");
        loginForm.children[2].innerHTML = home.loginButtonText();
        console.log(logg.msg);
        home.toaster(logg.msg);
        home.hideSensibleData();
    }
});

let logout = document.getElementById('logout');
logout.addEventListener("click", function(event){
    home.logout(this) && home.hideSensibleData();
});

home.isLogin() ? home.showSensibleData() : home.hideSensibleData();


