export const dekuRoot = () => {
    const out = document.documentElement
        .querySelectorAll("[data-deku-root]")
        .item(0);
    return out;
}