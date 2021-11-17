const add = document.querySelector(".add");
const addArticle = document.querySelector(".form");

add.addEventListener("click", function() {
    addArticle.classList.toggle("addArticle-visible");
});

const articles = document.querySelectorAll('.article');
const listId = document.querySelector('.list-id-hidden').textContent;

articles.forEach((article) => {
    let articleId = article.querySelector('#article-id-hidden').innerText;
    article.querySelector('#erase-button').onclick = function () {
        window.location.href = "/list/user/lists/addArticle?listId=" + listId + "&eraseId=" + articleId;
    };
})
