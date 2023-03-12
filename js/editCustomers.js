class Home extends Init{
    table = "customers";
    getCustomersUrl = "./api/getCustomers.php";   
}

// Setting Title
let home =  new Home("Edit Customer");
let idParam = home.getUrlParams('id');
home.setPageTitle();
home.redirectToHome();
let customerDetails = home.getAccountDetails(idParam).then(data=>home.renderCustomerForm(data));
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
let editCustomerForm = document.getElementById('editCustomerForm');
editCustomerForm && editCustomerForm.addEventListener("submit", async function(event){
    event.preventDefault();
    console.log(editCustomerForm.children);
    let gst1 = document.getElementById("gst").value;
    let gst2 = document.getElementById("gst2").value;

    if(gst1 == gst2){
        editCustomerForm.children[1].setAttribute("disabled", true);
        editCustomerForm.children[1].innerHTML = home.pleaseWait();
        editCustomerForm.setAttribute("disabled", true);
        let logg = await home.newAccount(editCustomerForm, idParam);
        if(logg && logg.status){
            home.toaster(logg.msg, true);
            editCustomerForm.reset();
            editCustomerForm.children[1].removeAttribute("disabled");
            editCustomerForm.children[1].innerHTML = home.FormButtonText();
        }else{
            editCustomerForm.children[1].removeAttribute("disabled");
            editCustomerForm.children[1].innerHTML = home.FormButtonText();
            home.toaster(logg.msg, false);
        }
    }else{
        editCustomerForm.children[1].removeAttribute("disabled");
        editCustomerForm.children[1].innerHTML = home.FormButtonText();
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


