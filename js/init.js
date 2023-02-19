class Init{
    constructor(title){
        this.title = title;
        this.loginStatus = false;
        this.userAccountCreationStatus = false;
        this.userInventoryCreationStatus = false;
    }
    setPageTitle(){
        document.title = this.title;
    }
    login(form){
        let username = form.elements[0].value;
        let password = form.elements[1].value;
        if( username.length>0 && password.length>0 ) {
            localStorage.setItem("username", username);
            this.loginStatus = true;
            return {"status":true, "msg":"Please wait.."}
        }else{
            localStorage.removeItem("username");
            this.loginStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }
    }
    async getCustomers(){
        let request = await this.apiService({}, "./api/getCustomers.php");        
        return request;
    }
    async newAccount(form){
        let data = {};
        let role = form.elements[0].value;
        let gst = form.elements[1].value;
        // let name = form.elements[2].value;
        let name = form.elements[3].value;
        let email = form.elements[4].value;

        let mobile = form.elements[5].value;
        let location = form.elements[6].value;
        let pincode = form.elements[7].value;
        let states = form.elements[8].value;
        let address = form.elements[9].value;
        data.role = role;
        data.name = name;
        data.email = email;
        data.mobile = mobile;
        data.location = location;
        data.pincode = pincode;
        data.address = address;
        data.states = states;
        data.gst = gst;
        if( role.length>0 && name.length>0 && email.length>0 && mobile.length>0 && location.length>0 && pincode.length>0 && address.length>0 && states.length>0 ) {
            this.userAccountCreationStatus = true;  
            let responses = await this.apiService(data, './api/customer.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userAccountCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }
    async newTransport(form){
        let data = {};
        let name = form.elements[0].value;
        let description = form.elements[1].value;
        data.name = name;
        data.description = description;
        
        if( name.length>0 && description.length>0 ) {
            this.userAccountCreationStatus = true;  
            let responses = await this.apiService(data, './api/newTransport.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userAccountCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }
    async getTransportList(){
        let responses = await this.apiService({},'./api/getTransport.php');
        return responses;        
    }
    async newOrder(form){
        let data = {};
        let customer = form.elements[0].value;
        let product = form.elements[1].value;
        data.customer = customer;
        data.product = product;
      
        if( customer.length>0 && product.length>0 ) {
            this.userAccountCreationStatus = true;  
            let responses = await this.apiService(data, './api/order.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userAccountCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }

    async newCustomer(form){
        let data = {};
        let role = form.elements[0].value;
        let username = form.elements[1].value;
        let password = form.elements[2].value;
        let email = form.elements[3].value;
        let mobile = form.elements[4].value;
        data.role = role;
        data.username = username;
        data.password = password;
        data.email = email;
        data.mobile = mobile;
        if( role.length>0 && username.length>0 && password.length>0 && email.length>0 && mobile.length>0  ) {
            this.userAccountCreationStatus = true;  
            let responses = await this.apiService(data, './api/index.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userAccountCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }

    async newInventory(form){
        console.log(form);
        let data = {};
        let category = form.elements[0].value;
        let scategory = form.elements[1].value;
        let product = form.elements[2].value;
        let price = form.elements[3].value;
        let quantity = form.elements[4].value;
        let weight = form.elements[5].value;
        data.category = category;
        data.scategory = scategory;
        data.product = product;
        data.price = price;
        data.quantity = quantity;
        data.weight = weight;
        

        if( category.length>0 && scategory.length>0 && product.length>0 && price.length>0 && quantity.length>0 && weight.length>0  ) {
            console.log(data);
            this.userInventoryCreationStatus = true;  
            let responses = await this.apiService(data, './api/inventory.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userInventoryCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }

    async newCategory(form){
        console.log(form);
        let data = {};
        let category = form.elements[0].value;
        data.category = category;
        

        if( category.length>0  ) {
            console.log(data);
            this.userInventoryCreationStatus = true;  
            let responses = await this.apiService(data, './api/newCategory.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userInventoryCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }

    async newSCategory(form){
        console.log(form);
        let data = {};
        let category = form.elements[0].value;
        let scategory = form.elements[1].value;
        data.category = category;
        data.scategory = scategory;
        

        if( category.length>0  ) {
            console.log(data);
            this.userInventoryCreationStatus = true;  
            let responses = await this.apiService(data, './api/newSCategory.php');
            return responses;
        }else{
            localStorage.removeItem("userAccount");
            this.userInventoryCreationStatus = false;
            return {"status":false, "msg":"All fields are mandatory"}
        }    
    }

    async delete(id, table){    
        console.log(id);   
        console.log(table);   
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        let deleteRecord = await this.apiService(ddata, './api/delete.php');  
        return deleteRecord;     
    }

    async changeProcessStatus(id, table){    
       
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        let deleteRecord = await this.apiService(ddata, './api/processStatus.php');  
        return deleteRecord;     
    }
    async acceptOrder(id, table){   
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        let acceptOrder = await this.apiService(ddata, './api/acceptOrder.php');  
        return acceptOrder;     
    }
    async moveToTransport(id, table, transport){   
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        ddata.transport = transport;
        let moveToTransport = await this.apiService(ddata, './api/moveToTransport.php');  
        return moveToTransport;     
    }
    async completeOrder(id, table){   
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        let moveToTransport = await this.apiService(ddata, './api/completeOrder.php');  
        return moveToTransport;     
    }
    async revertBack(id, table){   
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        let moveToOrders = await this.apiService(ddata, './api/revertOrder.php');  
        return moveToOrders;     
    }
    async payingOrder(id, table, payment, modeOfPayment, walletAmount=0, customerId, toBePaid=0 ){   
        let ddata = {};
        ddata.id = id;
        ddata.table = table;
        ddata.payment = payment;
        ddata.toBePaid = toBePaid;
        ddata.customerId = customerId;
        ddata.modeOfPayment = modeOfPayment;
        ddata.walletAmount = walletAmount;
        ddata.walletAmount2 = parseFloat(walletAmount)-parseFloat(payment);
        // alert(JSON.stringify(ddata));
        let payingOrder = await this.apiService(ddata, './api/payingOrder.php');  
        return payingOrder;     
    }
    async updateOrder(id, data){     
        let ddata = JSON.stringify([
            data[0].id, null, data[0].product, null
        ])

        let updateOrder = await this.apiService(ddata, './api/updateOrder.php');  
        return updateOrder;     
    }
    
    logout(){
        if( this.loginStatus ){
            localStorage.removeItem("username");
            this.loginStatus = false;
            console.log("Logout Successfully");
            this.redirectToHome();
        }        
        return true;
    }
    isLogin(){
        if( localStorage.getItem("username") ){
            this.loginStatus = true;
        }else{
            this.loginStatus = false;
        }
        return this.loginStatus;        
    }
    showSensibleData(){
        console.log("Sensible data showing");
        // let sensibleBlocks = document.querySelectorAll('.settingsMenu');
        // for( let i=0; i<sensibleBlocks.length; i++ ){
        //     sensibleBlocks[i].style.display = "block";
        // }
        // document.getElementById('loginFormBlock') && (document.getElementById('loginFormBlock').style.display="none");
    }
    hideSensibleData(){
        console.log("Sensible data hiding");
        // let sensibleBlocks = document.querySelectorAll('.settingsMenu');
        // for( let i=0; i<sensibleBlocks.length; i++ ){
        //     sensibleBlocks[i].style.display = "none";
        // }
        // document.getElementById('loginFormBlock') && (document.getElementById('loginFormBlock').style.display="block");
    }
    pleaseWait(){
        return "<div><div class='spinner-grow spinner-grow-sm' role='status'></div> <span>Please wait...</span></div>";
    }
    loginButtonText(){
        return "Login";
    }
    FormButtonText(){
        return "Create";
    }
    toaster(msg, status){
        var toastLiveExample = document.getElementById('liveToast');
        if( status ){
            toastLiveExample.style.background = "#6dcf6d";
        }else{
            toastLiveExample.style.background = "#ffc107";
        }
        var toast = new bootstrap.Toast(toastLiveExample);
        document.querySelector('.toast-body').innerHTML = msg;
        toast.show();
    }

    async apiService(data, api){
        let response = await fetch(api, {
            method: 'POST',
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        let result = await response.json();
        return result;
    }

    redirectToHome(){
        console.log("redirecting to home");
        if (!this.isLogin())
            window.location.href = "index.html";
    }
    redirectToWelcome(){
        console.log("redirecting to welcome");
        if (this.isLogin())
            window.location.href = "home.html";
    }
    getUrlParams(param){
        var url_string = window.location.href;
        var url = new URL(url_string);
        return url.searchParams.get(param);
    }
   
}