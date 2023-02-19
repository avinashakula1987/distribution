class Home extends Init{
    table = "order";

    async getInventory(){
        let request = await this.apiService({}, "./api/getInventory.php");        
        return request;
    }
    renderInventoryBlock(data){
        let itemmm = document.getElementById('inventoryBlockBody');
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<tr>
                <td>${account.category}</td>
                <td>${account.scategory}</td>
                <td>${account.product}</td>
                <td>${account.price}</td>
                <td>${account.quantity}</td>
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
    }

    async getSCategory(scat){
        let request = await this.apiService({id:scat}, "./api/getSCategories2.php");        
        return request;
    }
    renderSCategoryBlock(data){
        console.log("data >> "+data);
        let itemmm = document.getElementById('scategory');
        itemmm.innerHTML = "";
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<option value='${account.id}'>${account.scategory}</option>`;           
        })
        itemmm.innerHTML = accountslist;
        // console.log(table);
    }

    async getStock(scat){
        console.log("scat >> "+scat);
        let request = await this.apiService({id:scat}, "./api/getStock.php");        
        return request;
    }
    renderStockBlock(data){
        console.log("data >> "+JSON.stringify(data));
        let itemmm = document.getElementById('product');
        let price = document.getElementById('price');
        let quantity = document.getElementById('quantity');
        itemmm.innerHTML = "";
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<option value='${account.id}'>${account.product}</option>`;         
        })
        itemmm.innerHTML = accountslist;
        // console.log(table);
    }

}

// Setting Title
let home =  new Home("Orders");
home.setPageTitle();
home.redirectToHome();
let hh = home.getInventory().then(data=>home.renderInventoryBlock(data)).then(()=>{
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
let hh2 = home.getCategory().then(data=>home.renderCategoryBlock(data));

// Creating New User Account
let newUserForm = document.getElementById('newOrderForm');
newUserForm.addEventListener("submit", async function(event){
    event.preventDefault();
    newUserForm.children[5].setAttribute("disabled", true);
    newUserForm.children[5].innerHTML = home.pleaseWait();
    newUserForm.setAttribute("disabled", true);
    let logg = await home.newInventory(newUserForm);
    if(logg && logg.status){
        home.toaster(logg.msg, true);
        newUserForm.reset();
        newUserForm.children[5].removeAttribute("disabled");
        newUserForm.children[5].innerHTML = home.FormButtonText();
    }else{
        newUserForm.children[5].removeAttribute("disabled");
        newUserForm.children[5].innerHTML = home.FormButtonText();
        home.toaster(logg.msg, false);
    }
});



let catt = document.getElementById('category');
catt.addEventListener("change", async function(event){
    event.preventDefault();
    home.getSCategory(event.target.value).then(data=>home.renderSCategoryBlock(data));
});

let scatt = document.getElementById('scategory');
scatt.addEventListener("change", async function(event){
    event.preventDefault();
    console.log("aa "+event.target.value);
    home.getStock(event.target.value).then(data=>home.renderStockBlock(data));
});

// Logout
let logout = document.getElementById('logout');
logout.addEventListener("click", function(event){
    home.logout(this) && home.hideSensibleData();
    window.location.href = "index.html";
});

home.isLogin() ? home.showSensibleData() : home.hideSensibleData();


