import jsdomGlobal from "jsdom-global";
export const hackyInnerHTML = (id) => (s) => () =>
  (document.getElementById(id).innerHTML = s);
export const resetBody = () => {
  document.getElementsByTagName("html")[0].innerHTML =
    '<head></head><body id="mybody"></body>';
};
export const initializeJSDOM = () => jsdomGlobal();