function handleImage(image) {
    let reader = new FileReader();
    reader.onload = function() {
      let imagePreview = document.getElementById("major_category-image-preview");
      imagePreview.src = reader.result;
      imagePreview.className += "img-fluid w-25";
    };
  console.log(image);
  reader.readAsDataURL(image[0]);
  }
  