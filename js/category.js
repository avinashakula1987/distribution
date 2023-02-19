class Home extends Init{
    table = "categories";
    getCategoriesUrl = "./api/getCategories.php";
    async getCategory(){
        let request = await this.apiService({}, "./api/getCategories.php");        
        return request;
    }
    renderCategoryBlock(data){
        let itemmm = document.getElementById('categoryBlockBody');
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<tr>
                <td>${account.category}</td>
                <td>
                    <div class='btn-group'>
                        <button class="viewAccount btn btn-warning btn-sm" data-id="${account.id}">View</button>
                        <button class="deleteAccount btn btn-danger btn-sm" data-id="${account.id}">Delete</button>
                    </div>    
                </td>
            </tr>`;           
        })
        itemmm.innerHTML = accountslist;
    }
}

// Setting Title
let home =  new Home("Categories");
home.setPageTitle();
home.redirectToHome();
let hh = home.getCategory().then(data=>home.renderCategoryBlock(data)).then(()=>{
    let deleteItem = document.querySelectorAll('.deleteAccount');
    deleteItem.forEach((item)=>{
        item.addEventListener("click", async function(event){
            event.preventDefault();
            let id = event.target.getAttribute('data-id');
            let table = home.table;
            let del = await home.delete(id, table);
            if( del.status ){
                event.target.parentNode.parentNode.parentNode.style.display = "none";
                home.toaster("Deleted", true);
            }else{
                home.toaster(del.msg, false);
            }
        });
    });
});

// Creating New User Account
let newUserForm = document.getElementById('newCategoryForm');
newUserForm.addEventListener("submit", async function(event){
    event.preventDefault();
    newUserForm.children[1].setAttribute("disabled", true);
    newUserForm.children[1].innerHTML = home.pleaseWait();
    newUserForm.setAttribute("disabled", true);
    let logg = await home.newCategory(newUserForm);
    if(logg && logg.status){
        home.toaster(logg.msg, true);
        newUserForm.reset();
        newUserForm.children[1].removeAttribute("disabled");
        newUserForm.children[1].innerHTML = home.FormButtonText();
    }else{
        newUserForm.children[1].removeAttribute("disabled");
        newUserForm.children[1].innerHTML = home.FormButtonText();
        home.toaster(logg.msg, false);
    }
});




// Logout
let logout = document.getElementById('logout');
logout.addEventListener("click", function(event){
    home.logout(this) && home.hideSensibleData();
    window.location.href = "index.html";
});

home.isLogin() ? home.showSensibleData() : home.hideSensibleData();


