let users = localStorage.getItem("users");
users = JSON.parse(users)
var key;
showData();

//
function showData() {
    if (users == null) {
        users = [];
    }
    var no = 1;
    users_data = "<table  border = '1' style= 'border-collapse:collapse' class='Data'>"
    for (user in users) {

        let registrant = JSON.parse(users[user]);
        users_data += "<tr>";
        users_data += "<td width = 30px>" + no + "</td>" +
            "<td width = 140px>" + registrant["first"] + "</td>" +
            "<td width = 140px>" + registrant["last"] + "</td>" +
            "<td width = 100px>" + registrant["course"] + "</td>" +
            "<td width = 250px>" + registrant["email"] + "</td>" +
            "<td width = 110px><button class='btn-edit' type= 'submit'  onclick=   ' onChange(this); '  > edit</button> <button class='btn-delete' type= 'submit'  onclick=   ' deleted(this); '  > delete</button></td>" +
            "</tr>";
        no++
    }
    users_data += "</table>";
    document.getElementById("data").innerHTML = users_data;
}

function deleted(td) {
    if (users == null) {
        users = []
    }
    if (confirm('Do you want to delete this record?')) {
        row = td.parentElement.parentElement;
        let deleted = row.cells[1].innerHTML;

        for (let i = 0; i < users.length; i++) {
            var user = JSON.parse(users[i])
            if (deleted == user["first"]) {
                users.splice(i, 1);
            }
        }
        localStorage.clear();
        localStorage.setItem("users", JSON.stringify(users));
        showData();
    }
}

function onChange(td) {

    row = td.parentElement.parentElement;
    let deleted = row.cells[1].innerHTML;


    for (var i = 0; i < users.length; i++) {
        var user = JSON.parse(users[i])

        if (deleted == user["first"]) {
            document.querySelector(".first_edit").value = user["first"];
            document.querySelector(".last_edit").value = user["last"];
            document.querySelector(".course_edit").value = user["course"];
            document.querySelector(".email_edit").value = user["email"];
            key = user["first"];
            break;
        }
    }

}

function change() {

    if (users == null) {
        users = []
    }
    newData = JSON.stringify({
        first: document.querySelector(".first_edit").value,
        last: document.querySelector(".last_edit").value,
        course: document.querySelector(".course_edit").value,
        email: document.querySelector(".email_edit").value,

    })

    for (let i = 0; i < users.length; i++) {
        var user = JSON.parse(users[i])
        if (key == user["first"]) {
            users.splice(i, 1);
        }

    }
    localStorage.clear();
    users.push(newData);
    localStorage.setItem("users", JSON.stringify(users));
    alert("Data updated")

    showData();
}


function clearALL() {
    if (confirm('Do you want to delete this record?')) {
        localStorage.clear();

        location.reload();
    }
}

function addData() {

    user = JSON.stringify({
        first: document.querySelector(".first_new").value,
        last: document.querySelector(".last_new").value,
        course: document.querySelector(".course_new").value,
        email: document.querySelector(".email_new").value,

    })
    users.push(user);
    localStorage.setItem("users", JSON.stringify(users));
    showData();
    alert("data added");
}

// JQUERY HIDE
$(".finish").click(function(){
    $(".edit_data").hide(500);
});

$(".btn-edit").click(function(){
    $(".edit_data").show(1000);
});