
export const downGroup = ({p,e}) => { const start = e;  return { p: start, e: e.firstElementChild }};
export const rightGroup = ({p,e}) => { const start = p;  return { p: p, e: e.nextElementSibling }};
    

export const xDownGroup = ({p,e}) => { const start = e.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xRightGroup = ({p,e}) => { const start = e.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const yDownGroup = ({p,e}) => { const start = e;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yRightGroup = ({p,e}) => { const start = p;  return { p: start, e: e.nextElementSibling.nextElementSibling }};
    

export const xxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const yxDownGroup = ({p,e}) => { const start = e.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxRightGroup = ({p,e}) => { const start = e.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyDownGroup = ({p,e}) => { const start = e;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyRightGroup = ({p,e}) => { const start = p;  return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const yxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxDownGroup = ({p,e}) => { const start = e.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxRightGroup = ({p,e}) => { const start = e.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyDownGroup = ({p,e}) => { const start = e;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyRightGroup = ({p,e}) => { const start = p;  return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const yxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyxDownGroup = ({p,e}) => { const start = e.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyDownGroup = ({p,e}) => { const start = e;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyRightGroup = ({p,e}) => { const start = p;  return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const yxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyyDownGroup = ({p,e}) => { const start = e;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyyRightGroup = ({p,e}) => { const start = p;  return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const xxxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xxyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
export const xxyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild }};
    

export const xyxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const xyyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
export const xyyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild }};
    

export const yxxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yxyyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
export const yxyyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling }};
    

export const yyxxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyxyyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
export const yyxyyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling }};
    

export const yyyxxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxyxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxyxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyxyyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyxyyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyxxDownGroup = ({p,e}) => { const start = e.firstElementChild.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyxxRightGroup = ({p,e}) => { const start = e.nextElementSibling.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyxyDownGroup = ({p,e}) => { const start = e.firstElementChild.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyxyRightGroup = ({p,e}) => { const start = e.nextElementSibling.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyyxDownGroup = ({p,e}) => { const start = e.firstElementChild;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyyxRightGroup = ({p,e}) => { const start = e.nextElementSibling;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const yyyyyyDownGroup = ({p,e}) => { const start = e;  return { p: start, e: start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
export const yyyyyyRightGroup = ({p,e}) => { const start = p;  return { p: start, e: e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling }};
    

export const processStringImpl = (k, s, {p,e}) => {
  
  // Get the previous sibling (text node) of the element
  let textNode = e ? e.previousSibling : p.lastChild;
  

  // Ensure the previous sibling is actually a text node. If it isn't, this will not work.
  if (textNode && textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
    let replacement = s;
    if (replacement !== undefined) {
      textNode.nodeValue = textNode.nodeValue.replace("~" + k + "~", replacement);
    } else {
      console.error("Programming error: no replacement for " + k + " found in object");
    }
  } else {
    console.error("Programming error: previous node not a text node");
  }
};
export const mEltElt = x => x.e;
export const mEltParent = x => x.p;
export const mEltify = e => ({p:undefined, e});
export const splitTextAndReturnReplacement = (s, { p, e }) => {
  
  // Get the previous sibling (text node) of the element
  let targetString = "~" + s + "~";
  let textNode = e ? e.previousSibling : p.lastChild;
  
  while (textNode) {
    if (textNode.nodeType === 3) {
      // 3 is the nodeType for a Text node
      let index = textNode.nodeValue.indexOf(targetString);

      if (index !== -1) {
        // Split the text node at the starting index of the target string
        let afterTextNode = textNode.splitText(index);

        // Split the afterTextNode at the end index of the target string to isolate it
        afterTextNode.splitText(targetString.length);

        // Return the newly created text node containing the target string
        return afterTextNode;
      }
    } else {
      throw new Error(
        "Programming error: previous node not a text node or target string not found: " +
          s
      );
    }
    textNode = textNode.previousSibling;
  }
  if (textNode && textNode.nodeType === 3) {
    // 3 is the nodeType for a Text node
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

  throw new Error(
    "Programming error: previous node not a text node or target string not found: " +
      s
  );
};

export const returnReplacement = (s, {p,e}) => {
  
  // Get the previous sibling (text node) of the element
  let targetString = "~" + s + "~";
  let textNode = e ? e.previousSibling : p.lastChild;
  while (textNode) {
    
    if (textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
      let index = textNode.nodeValue.indexOf(targetString);
      if (index !== -1) {
        return textNode;
      }
    } else {
        throw new Error("Programming error: previous node not a text node or target string not found: "+s);
    }
    textNode = textNode.previousSibling;
  }
};
