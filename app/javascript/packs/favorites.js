import axios from 'axios'

document.addEventListener("turbolinks:load", function () {
  const category = document.querySelector("#favorite_category_id")
  const subcategory = document.querySelector("#favorite_subcategory_id")

  if (category != undefined) {
    category.onchange = async function () {
      subcategory.innerHTML = "<option value=''>Carregando...</option>"

      const response = await axios.get(`/favorites/subcategories?category_id=${this.value}`)

      subcategory.innerHTML = response.data
    }
  }
})
