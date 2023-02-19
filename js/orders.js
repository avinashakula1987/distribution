class Home extends Init{
    table = "inventory";

    async getInventory(){
        let request = await this.apiService({}, "./api/getInventory.php");        
        return request;
    }
    
    // renderInventoryBlock(data){

    //     let itemmm = document.getElementById('inventoryBlockBody');
    //     let accountslist = "";
    //     data.map((account)=>{
         
    //         accountslist += `<tr>
    //             <td></td>
    //             <td>${account.id}</td>
    //             <td>${account.category}</td>
    //             <td>${account.scategory}</td>
    //             <td>${account.product}</td>
    //             <td>${account.price}</td>
    //             <td>${account.quantity}</td>
    //             <td><input type='text' name='quantity' id='qty_${account.id}' value='1'></td>
    //         </tr>`;           
    //     })
    //     itemmm.innerHTML = accountslist;
    // }



 
    
    renderCategoryBlock(data){
        let itemmm = document.getElementById('category');
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<option value='${account.id}'>${account.category}</option>`;           
        })
        itemmm.innerHTML = accountslist;
    }


    renderCustomers(data){
        let itemmm = document.getElementById('customerId');
        let accountslist = `<option value=''>Select Customer</option>`;
        data.map((account)=>{         
            accountslist += `<option value='${account.id}' data-state='${account.state ? account.state : ""}'>${account.name}</option>`;           
        })
        itemmm.innerHTML = accountslist;
    }

    async getSCategory(scat){
        let request = await this.apiService({id:scat}, "./api/getSCategories2.php");        
        return request;
    }
    renderSCategoryBlock(data){
        let itemmm = document.getElementById('scategory');
        itemmm.innerHTML = "";
        let accountslist = "";
        data.map((account)=>{         
            accountslist += `<option value='${account.id}'>${account.scategory}</option>`;           
        })
        itemmm.innerHTML = accountslist;
    }

}

// Setting Title
let home =  new Home("Orders");
home.setPageTitle();
home.redirectToHome();
let cus = home.getCustomers().then((data)=>{
    home.renderCustomers(data);    
});
cus.then(()=>{
    let customer = document.getElementById('customerId');
    customer.addEventListener("change", async function(event){
        event.preventDefault();
        let currentState = event.target.options[this.selectedIndex].getAttribute("data-state");
        document.getElementById('customerState').innerHTML = `<option value='${currentState}'>${currentState}</option`;
    });
});
// let hh = home.getInventory().then(data=>home.renderInventoryBlock(data)).then(()=>{
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







// Logout
let logout = document.getElementById('logout');
logout.addEventListener("click", function(event){
    home.logout(this) && home.hideSensibleData();
    window.location.href = "index.html";
});

home.isLogin() ? home.showSensibleData() : home.hideSensibleData();


