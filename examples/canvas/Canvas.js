export const setBodyAs = (str) => () => { 
    var body = document.getElementsByTagName("BODY")[0];
    body.innerHTML = str;
}