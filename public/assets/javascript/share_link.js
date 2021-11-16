const articles = document.querySelectorAll('.article');
const shareLink = document.querySelector('.share-link').textContent;

articles.forEach((article) => {
    let articleId = article.children[0].innerText;
    article.children[6].onclick = function () {
        window.location.href = "/list/share?share_link=" + shareLink + "&article_id=" + articleId
    };
})
