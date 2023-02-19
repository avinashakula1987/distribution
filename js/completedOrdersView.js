class Home extends Init{
    table = "Orders";
    getProcessingOrdersUrl = "./api/getCompletedOrders.php";
    async getOrders(){
        let request = await this.apiService({}, "./api/getOrders.php");        
        return request;
    }
    
    // renderOrdersBlock(data){

    //     let itemmm = document.getElementById('ordersBlockBody');
    //     let accountslist = "";
    //     data.map((account)=>{
    //         let pros = "<table class='table table-bordered table-condensed'>";
    //         let final = 0;
    //         account.product && account.product.map((pro)=>{
    //             let total = pro[5]*pro[7];
    //             pros += `<tr><td>${pro[4]}</td><td>${pro[5]}</td><td>${pro[7]}</td><td>${total}</td></tr>`;
    //             final += total;
    //         });
    //         pros += "</table>";
           

    //         accountslist += `<tr>
    //             <td></td>
    //             <td>${account.id}</td>
    //             <td>${account.customer}</td>
    //             <td>${pros}</td>
    //             <td>${final}</td>
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


    // renderCustomers(data){
    //     let itemmm = document.getElementById('customerId');
    //     let accountslist = "";
    //     data.map((account)=>{         
    //         accountslist += `<option value='${account.id}'>${account.name}</option>`;           
    //     })
    //     itemmm.innerHTML = accountslist;
    // }

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
// let cus = home.getCustomers().then((data)=>{
//     home.renderCustomers(data).then(()=>{

//     })
// })
// let hh = home.getOrders().then(data=>home.renderOrdersBlock(data)).then(()=>{
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


