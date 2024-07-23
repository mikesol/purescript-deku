export const hack = (n) => () => {
    n.parentNode  ? console.log('HACKPN', n.parentNode.innerHTML, n.hello) : console.log('HACKFOO', n, n.innerHTML, n.hello) ;
}
export const hackDeleteMe = (id) => (n) => () => {
  n.hello = `hello! ${id} ${n.innerHTML}`
}