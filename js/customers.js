class Home extends Init{
    table = "customers";
    getCustomersUrl = "./api/getCustomers.php";   
}

// Setting Title
let home =  new Home("user Accounts");
home.setPageTitle();
home.redirectToHome();
// let hh = home.getCustomers().then(data=>home.renderCustomers(data)).then(()=>{
//     let deleteItem = document.querySelectorAll('.deleteAccount');
//     deleteItem.forEach((item)=>{
//         item.addEventListener("click", async function(event){
//             event.preventDefault();
//             let id = event.target.getAttribute('data-id');
//             let table = home.table;
//             let del = await home.delete(id, table);
//             if( del.status ){
//                 event.target.parentNode.parentNode.parentNode.style.display = "none";
//                 home.toaster("Deleted", true);
//             }else{
//                 home.toaster(del.msg, false);
//             }
//         });
//     });
// });

// Creating New User Account
let newCustomerForm = document.getElementById('newCustomerForm');
newCustomerForm && newCustomerForm.addEventListener("submit", async function(event){
    event.preventDefault();
    console.log(newCustomerForm.children);
    let gst1 = document.getElementById("gst").value;
    let gst2 = document.getElementById("gst2").value;

    if(gst1 == gst2){
        newCustomerForm.children[1].setAttribute("disabled", true);
        newCustomerForm.children[1].innerHTML = home.pleaseWait();
        newCustomerForm.setAttribute("disabled", true);
        let logg = await home.newAccount(newCustomerForm);
        if(logg && logg.status){
            home.toaster(logg.msg, true);
            newCustomerForm.reset();
            newCustomerForm.children[1].removeAttribute("disabled");
            newCustomerForm.children[1].innerHTML = home.FormButtonText();
        }else{
            newCustomerForm.children[1].removeAttribute("disabled");
            newCustomerForm.children[1].innerHTML = home.FormButtonText();
            home.toaster(logg.msg, false);
        }
    }else{
        newCustomerForm.children[1].removeAttribute("disabled");
        newCustomerForm.children[1].innerHTML = home.FormButtonText();
        home.toaster("GST mis matched", false);
    }

    
});

// Logout
let logout = document.getElementById('logout');
logout.addEventListener("click", function(event){
    home.logout(this) && home.hideSensibleData();
    window.location.href = "index.html";
});

home.isLogin() ? home.showSensibleData() : home.hideSensibleData();


