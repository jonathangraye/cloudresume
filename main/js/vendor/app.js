const visitorendpoint = "https://we6oyh3ijb.execute-api.eu-west-2.amazonaws.com/test/visitors"
const visitCount = document.querySelector(".visit-count")

async function updateCounter() {
    let response = await fetch(
        visitorendpoint, {
        method: "POST",       
        headers: {
            "Content-type": "application/json",
        },
    });
    let data = await response.json();
    visitCount.innerHTML = `This page has been viewed ${data} times`;

}
updateCounter();