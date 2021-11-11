const inCards = document.querySelectorAll('.in-card');
const cards = document.querySelectorAll(".card");

/*crée un lien pour chaque liste qui renvoi vers la modification de la liste*/
cards.forEach((card) => {
    let listId = card.firstElementChild.innerText;
    card.onclick = function () {
        document.location.href = "/list/user/lists/addArticle?listId=" + listId;
    }
})

/*Modifie le comportement de la div s'il n'y a aucun article*/
inCards.forEach((list) => {
    if (!list.children[1].innerText) {
        list.children[1].style.width = "0";
        list.children[0].style.width = "100%";
    }
})