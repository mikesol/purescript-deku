export const getPreviousCb = (s,e) => {
    return e[`$$${s}`] ? e[`$$${s}`] : null;
}

export const deletePreviousCb = (s,e) => {
    delete e[`$$${s}`];
}

export const setPreviousCb = (s,cb,e) => {
    e[`$$${s}`] = cb;
}
