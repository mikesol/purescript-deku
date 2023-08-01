export const hackyInnerHTML = (id) => (s) => () => document.getElementById(id).innerHTML = s

export const doStateAssertionsForTests_ = (state) => () => {
    if (Object.keys(state.units).length > 0) {
        console.error("State should be empty after tests");
        console.dir(state, {depth: null})
        throw new Error("State should be empty after tests")
    }
}