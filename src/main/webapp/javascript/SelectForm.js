let selectedTopic = document.querySelector("#formTopic");
let selectedArgument = document.querySelector("#formArgument");

selectedTopic.addEventListener('change', event => {
    let type = event.target.value;

    if(selectedTopic.value == 1)
        selectedArgument.disable = true;

    [].slice.call(selectedArgument.querySelectorAll('option'))
        .forEach(el => {
            el.style.display = (el.dataset.type === type ? 'block' : 'none')
        })
})