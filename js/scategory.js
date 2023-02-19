class Home extends Init{
    table = "scategories";
    getSubCategoriesUrl = "./api/getSCategories.php";
    async getSCategory(){
        let request = await this.apiService({}, "./api/getSCategories.php");        
        return request;
    }
    renderSCategoryBlock(data){

        let itemmm = document.getElementById('categoryBlockBody');
        let accountslist = "";
        data.map((account)=>{
         
            accountslist += `<tr>
                <td>${account.category}</td>
                <td>${account.scategory}</td>
                <td>
                    <div class='btn-group'>
                        <button class="viewAccount btn btn-warning btn-sm" data-id="${account.id}">View</button>
                        <button class="deleteAccount btn btn-danger btn-sm" data-id="${account.id}">Delete</button>
                    </div>    
                </td>
            </tr>`;           
        })
        itemmm.innerHTML = accountslist;
        // console.log(table);
    }

    async getCategory(){
        let request = await this.apiService({}, "./api/getCategories.php");        
        return request;
    }
    renderCategoryBlock(data){

        let itemmm = document.getElementById('category');
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<option value='${account.id}'>${account.category}</option>`;           
        })
        itemmm.innerHTML = accountslist;
        console.log(accountslist);
    }
}

// Setting Title
let home =  new Home("SCategories");
home.setPageTitle();
home.redirectToHome();

// Render scategories list
home.getSCategory().then(data=>home.renderSCategoryBlock(data)).then(()=>{
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

// Display categories list as a dropdown
home.getCategory().then(data=>home.renderCategoryBlock(data));

// Creating New User Account
let newUserForm = document.getElementById('newCategoryForm');
newUserForm.addEventListener("submit", async function(event){
    event.preventDefault();
    newUserForm.children[2].setAttribute("disabled", true);
    newUserForm.children[2].innerHTML = home.pleaseWait();
    newUserForm.setAttribute("disabled", true);
    let logg = await home.newSCategory(newUserForm);
    if(logg && logg.status){
        home.toaster(logg.msg, true);
        newUserForm.reset();
        newUserForm.children[2].removeAttribute("disabled");
        newUserForm.children[2].innerHTML = home.FormButtonText();
    }else{
        newUserForm.children[2].removeAttribute("disabled");
        newUserForm.children[2].innerHTML = home.FormButtonText();
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


