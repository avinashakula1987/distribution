class Welcome extends Init{
    
}

let welcome =  new Welcome("Welcome");
welcome.setPageTitle();


let logout = document.getElementById('logout');
logout.addEventListener("click", function(event){
    welcome.logout(this) && welcome.hideSensibleData();
});

welcome.isLogin() ? welcome.showSensibleData() : welcome.hideSensibleData();


