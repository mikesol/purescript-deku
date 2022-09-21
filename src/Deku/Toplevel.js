export const dekuRoot = () => {
    const out = document.documentElement
        .querySelector("[data-deku-root]");
    return out;
}