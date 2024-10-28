function copiaTesto() {
    // Ottieni il valore dal textarea
    let text = document.getElementById("textAnswer").value;
    if (text.trim() === "") return; // Se è vuoto, non fare nulla

    //Il metodo toLocaleString() restituisce un oggetto Date come stringa, utilizzando le impostazioni locali.
    const date = new Date();
    let dateFormatted = date.toLocaleString();

    // Crea una nuova riga per il log (lista) (DOM HTML)
    let newElement = document.createElement("p");
    newElement.textContent = `${dateFormatted}: ${text}`;

    // Aggiungi la nuova riga al log
    document.getElementById("log").appendChild(newElement);

    // Pulisce il campo di input dopo l'invio
    document.getElementById("textAnswer").value = "";
}