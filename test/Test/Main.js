export const hackyInnerHTML = (id) => (s) => () => document.getElementById(id).innerHTML = s

export const doStateAssertionsForTests_ = (state) => (n) => () => {
    if (Object.keys(state.units).length > n) {
        console.error("State should be empty after tests");
        console.dir(state, {depth: null})
        throw new Error("State should be empty after tests")
    }
}