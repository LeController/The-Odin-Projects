let login = prompt("Who's there?");

if (login == "Admin") {
    password = prompt("Password?");
    if (password == "TheMaster") {
        alert("Welcome!");
    } else if (password || 0) {
        alert("Wrong password");
    } else {
        alert("Canceled");
    }
} else if (login || 0) {
    alert("I don't know you");
} else {
    alert("Canceled");
}
