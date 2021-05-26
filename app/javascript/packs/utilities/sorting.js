function sortRowsByTitle() {
    let table = document.querySelector('table'),
        rows =table.querySelectorAll('tr')
}

document.addEventListener('turbolink: load', function() {
    let control = document.querySelector('.sort-by-title')

    control.addEventListener('click', sortRowsByTitle)
})