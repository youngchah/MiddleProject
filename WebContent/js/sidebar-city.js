  function showSubCategories(categoryId) {
        // 모든 하위 카테고리 숨기기
        var allSubCategories = document.querySelectorAll('.sub_categories');
        allSubCategories.forEach(function (subCategory) {
            subCategory.style.display = 'none';
        });

        // 클릭한 카테고리의 하위 카테고리 보이기
        var selectedCategory = document.getElementById(categoryId);
        if (selectedCategory) {
            selectedCategory.style.display = 'block';
        }
    }