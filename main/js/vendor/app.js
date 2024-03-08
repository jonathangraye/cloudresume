// collapsible tiles

var coll = document.getElementsByClassName("title-card");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {

    // here we are gonna loop through the elements
    for(item of coll){
      // and remove .active class on the button
      item.classList.remove("active");

      // here we are checking the next element and making it don't display
      item.nextElementSibling.style.display = "none";
    }
      
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}


// update counter 
//fetch from API Endpoint through API Gateway to update counter
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


// BUTTON - not my code
// Get the button:
let mybutton = document.getElementById("myBtn");
let navbar = document.getElementById("navigation");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
    navbar.style.opacity = "0.5";
  } else {
    mybutton.style.display = "none";
    navbar.style.opacity = "1";

  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
} 