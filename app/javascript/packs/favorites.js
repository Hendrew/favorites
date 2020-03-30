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

document.addEventListener("turbolinks:load", function () {
  const filterButton = document.querySelector("#filter_button")
  const filterBox = document.querySelector("#filter_box")

  if (filterButton != undefined) {
    filterButton.onclick = function () {
      filterBox.classList.toggle("show_filter_box")

      return false
    }
  }
})
