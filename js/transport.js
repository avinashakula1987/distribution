class Home extends Init{
    table="transport";
    renderTransportList(data){
        console.log(data);
        // let userAccounts2 = document.getElementById("userAccounts2");
        // let table = document.createElement("table");
        // table.setAttribute("class", "table table-sm table-striped");

        // let userAccountsBlock = document.getElementById("userAccountsBlock");
        // userAccountsBlock.appendChild(table);
        // let trHeader = document.createElement('tr');
        // trHeader.insertCell(0).innerHTML = "USERNAME";
        // trHeader.insertCell(1).innerHTML = "ROLE";
        // trHeader.insertCell(2).innerHTML = "PASSWORD";
        // trHeader.insertCell(3).innerHTML = "ACTIONS";
        // table.appendChild(trHeader);

        let itemmm = document.getElementById('userAccounts2');
        let accountslist = "";
        data.map((account)=>{
            // console.log(account.username);
            // let tr = document.createElement("tr");
            // table.appendChild(tr);
            // tr.insertCell(0).innerHTML = account.username;
            // tr.insertCell(1).innerHTML = account.role;
            // tr.insertCell(2).innerHTML = account.password;
            // tr.insertCell(3).innerHTML = `<button class="viewAccount btn btn-warning btn-sm" data-id="${account.id}">View</button>
            //                               <button class="deleteAccount btn btn-danger btn-sm" data-id="${account.id}">Delete</button>`;
            // let td = `<td>${account.username}</td>`;
            // <td>${account.role}</td>
            // <td>${account.password}</td>
            // <td><button class="accountButtons" data-id="${account.id}">View</button></td>`;

            // tr.innerHTML = td;
            accountslist += `<tr>
                <td>${account.name}</td>
                <td>${account.description}</td>
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
let home =  new Home("Transport");
home.setPageTitle();
home.redirectToHome();
let hh = home.getTransportList().then(data=>home.renderTransportList(data)).then(()=>{
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
let newUserForm = document.getElementById('newAccountForm');
newUserForm.addEventListener("submit", async function(event){
    event.preventDefault();
    newUserForm.children[2].setAttribute("disabled", true);
    newUserForm.children[2].innerHTML = home.pleaseWait();
    newUserForm.setAttribute("disabled", true);
    let logg = await home.newTransport(newUserForm);
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


