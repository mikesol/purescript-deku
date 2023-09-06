
export const downGroup = ({p,e}) => { const start = e; console.log('downGroup', start.outerHTML,e.firstElementChild ? e.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: e.firstElementChild }};
export const rightGroup = ({p,e}) => { const start = p; console.log('rightGroup', start.outerHTML,e.nextElementSibling? e.nextElementSibling.outerHTML : 'NO_E'); return { p: p, e: e.nextElementSibling }};
    

export const xDownGroup = ({p,e}) => { const start = e.firstElementChild; console.log('xDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xRightGroup = ({p,e}) => { const start = e.nextElementSibling; console.log('xRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const yDownGroup = ({p,e}) => { const start = e; console.log('yDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yRightGroup = ({p,e}) => { const start = p; console.log('yRightGroup', start.outerHTML,e.nextElementSibling.nextElementSibling? e.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: e.nextElementSibling.nextElementSibling }};
    

export const xxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild; console.log('xxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild; console.log('xxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling; console.log('xyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling; console.log('xyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const yxDownGroup = ({p,e}) => { const start = e.firstElementChild; console.log('yxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxRightGroup = ({p,e}) => { const start = e.nextElementSibling; console.log('yxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyDownGroup = ({p,e}) => { const start = e; console.log('yyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyRightGroup = ({p,e}) => { const start = p; console.log('yyRightGroup', start.outerHTML,e.nextElementSibling.nextElementSibling.nextElementSibling? e.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild; console.log('xxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const yxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild; console.log('yxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild; console.log('yxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling; console.log('yxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling; console.log('yxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxDownGroup = ({p,e}) => { const start = e.firstElementChild; console.log('yyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxRightGroup = ({p,e}) => { const start = e.nextElementSibling; console.log('yyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyDownGroup = ({p,e}) => { const start = e; console.log('yyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyRightGroup = ({p,e}) => { const start = p; console.log('yyyRightGroup', start.outerHTML,e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const yxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild; console.log('yyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild; console.log('yyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling; console.log('yyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling; console.log('yyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyxDownGroup = ({p,e}) => { const start = e.firstElementChild; console.log('yyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling; console.log('yyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyDownGroup = ({p,e}) => { const start = e; console.log('yyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyRightGroup = ({p,e}) => { const start = p; console.log('yyyyRightGroup', start.outerHTML,e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const yxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild; console.log('yyxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; console.log('yyxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; console.log('yyxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; console.log('yyxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; console.log('yyxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; console.log('yyxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; console.log('yyxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yyxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild; console.log('yyyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild; console.log('yyyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling; console.log('yyyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling; console.log('yyyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild; console.log('yyyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling; console.log('yyyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyyDownGroup = ({p,e}) => { const start = e; console.log('yyyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyyRightGroup = ({p,e}) => { const start = p; console.log('yyyyyRightGroup', start.outerHTML,e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('xxxxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('xxxyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('xxyxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xxyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xxyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('xxyyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('xyxxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('xyxyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('xyyxyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyxxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyxxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyxyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyxyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyyxDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyyxRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const xyyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyyyDownGroup', start.outerHTML,start.firstElementChild ? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
export const xyyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('xyyyyyRightGroup', start.outerHTML,start.firstElementChild? start.firstElementChild.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild }};
    

export const yxxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('yxxxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('yxxxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('yxxyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('yxxyyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('yxyxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('yxyxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('yxyyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling ? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yxyyyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling? start.firstElementChild.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild; console.log('yyxxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; console.log('yyxxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; console.log('yyxxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; console.log('yyxxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; console.log('yyxxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; console.log('yyxxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; console.log('yyxxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; console.log('yyxxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; console.log('yyxyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; console.log('yyxyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; console.log('yyxyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; console.log('yyxyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; console.log('yyxyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; console.log('yyxyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yyxyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yyxyyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild; console.log('yyyxxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; console.log('yyyxxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; console.log('yyyxxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; console.log('yyyxxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; console.log('yyyxyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; console.log('yyyxyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; console.log('yyyxyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; console.log('yyyxyyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild; console.log('yyyyxxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild; console.log('yyyyxxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling; console.log('yyyyxyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling; console.log('yyyyxyRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild; console.log('yyyyyxDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling; console.log('yyyyyxRightGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyyyDownGroup = ({p,e}) => { const start = e; console.log('yyyyyyDownGroup', start.outerHTML,start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling ? start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyyyRightGroup = ({p,e}) => { const start = p; console.log('yyyyyyRightGroup', start.outerHTML,e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling? e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.outerHTML : 'NO_E'); return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const processString = (s, {e}) => {
  // Get the previous sibling of the element
  console.log("processString", e.outerHTML);
  let textNode = e.previousSibling;
  console.log("processString", textNode.textContent);

  // Ensure the previous sibling is actually a text node. If it isn't, this will not work.
  if (textNode && textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
    let replacement = s;
    if (replacement !== undefined) {
      textNode.nodeValue = textNode.nodeValue.replace("~" + s + "~", replacement);
    } else {
      console.error("Programming error: no replacement for " + s + " found in object");
    }
  } else {
    console.error("Programming error: previous node not a text node");
  }
};
export const mEltElt = x => x.e;
export const mEltParent = x => x.p;
export const splitTextAndReturnReplacement = (s, {p,e}) => {
  console.log("splitTextAndReturnReplacement", e ? e.outerHTML: `NO_E `+p.outerHTML);
  // Get the previous sibling (text node) of the element
  let textNode = e ? e.previousSibling : p.lastChild;
  console.log("splitTextAndReturnReplacementPREV", textNode, textNode.textContent);
  if (textNode && textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
    let targetString = "~" + s + "~";
    let index = textNode.nodeValue.indexOf(targetString);

    if (index !== -1) {
      // Split the text node at the starting index of the target string
      let afterTextNode = textNode.splitText(index);

      // Split the afterTextNode at the end index of the target string to isolate it
      afterTextNode.splitText(targetString.length);

      // Return the newly created text node containing the target string
      return afterTextNode;
    }
  }

  throw new Error("Programming error: previous node not a text node or target string not found: "+s);
};

