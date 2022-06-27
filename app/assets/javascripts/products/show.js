/* global $*/
 
 $(document).on("ready turbolinks:load", () => {
   $("#product_image").change(function() {
     if (this.files && this.files[0]) {
       let reader = new FileReader();
         reader.onload = function(e) {
           $("#product-image-preview").attr("src", e.target.result);
           $("#product-image-preview").attr("class", "img-fluid w-25");
         };
         reader.readAsDataURL(this.files[0]);
       }
   });
 });
 
 
  function handleImage(image) {
    let reader = new FileReader();
    reader.onload = function() {
      let imagePreview = document.getElementById("review-image-preview");
      imagePreview.src = reader.result;
      imagePreview.className += "img-fluid w-25";
    };
  console.log(image);
  reader.readAsDataURL(image[0]);
  }
  