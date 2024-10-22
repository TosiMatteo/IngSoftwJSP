let selectedTopic = document.querySelector("#formTopic");
let selectedArgoument = document.querySelector("#formArgument");

selectedTopic.addEventListener('change', event => {
    let type = event.target.value;

    if(selectedTopic.value == 1)
        selectedArgoument.disable = true;

    [].slice.call(selectedArgoument.querySelectorAll('option'))
        .forEach(el => {
            el.style.display = (el.dataset.type === type ? 'block' : 'none')
        })
})