// import swal from 'sweetalert';

// function bindSweetAlertButtonDemo() {
//   const swalButton = document.getElementById('sweet-alert-demo');
//   if (swalButton) { // protect other pages
//     swalButton.addEventListener('click', () => {
//       swal({
//         title: "A nice alert",
//         text: "This is a great alert, isn't it?",
//         icon: "success"
//       });
//     });
//   }
// }

// export { bindSweetAlertButtonDemo };

import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Find you perfect lesson"],
    typeSpeed: 40,
    loop: true
  });
}

export { loadDynamicBannerText };

