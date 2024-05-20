
export const downGroup = (e) => { const start = e; const next = e.firstElementChild;  return next === null ? (() => start) : next };
export const rightGroup = (e) => { const start = e.parentNode; const next = e.nextElementSibling;   return next === null ? (() => start) : next };
    

export const xDownGroup = (e) => { const start = e.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xRightGroup = (e) => { const start = e.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const yDownGroup = (e) => { const start = e; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yRightGroup = (e) => { const start = e; const next = e.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const xxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const yxDownGroup = (e) => { const start = e.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxRightGroup = (e) => { const start = e.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyDownGroup = (e) => { const start = e; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyRightGroup = (e) => { const start = e; const next = e.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const xxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const yxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxDownGroup = (e) => { const start = e.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxRightGroup = (e) => { const start = e.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyDownGroup = (e) => { const start = e; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyRightGroup = (e) => { const start = e; const next = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const xxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const yxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxDownGroup = (e) => { const start = e.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxRightGroup = (e) => { const start = e.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyDownGroup = (e) => { const start = e; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyRightGroup = (e) => { const start = e; const next = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const xxxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const yxxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyxDownGroup = (e) => { const start = e.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyxRightGroup = (e) => { const start = e.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyyDownGroup = (e) => { const start = e; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyyRightGroup = (e) => { const start = e; const next = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const xxxxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxxyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxxyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xxyyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xxyyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyxyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyxyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const xyyyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;  return next === null ? (() => start) : next };
export const xyyyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild;   return next === null ? (() => start) : next };
    

export const yxxxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxxyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxxyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yxyyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;  return next === null ? (() => start) : next };
export const yxyyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyxyyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyxyyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxyxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxyxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyxyyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyxyyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyxxDownGroup = (e) => { const start = e.firstElementChild.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyxxRightGroup = (e) => { const start = e.nextElementSibling.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyxyDownGroup = (e) => { const start = e.firstElementChild.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyxyRightGroup = (e) => { const start = e.nextElementSibling.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyyxDownGroup = (e) => { const start = e.firstElementChild; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyyxRightGroup = (e) => { const start = e.nextElementSibling; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    

export const yyyyyyDownGroup = (e) => { const start = e; const next = start.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;  return next === null ? (() => start) : next };
export const yyyyyyRightGroup = (e) => { const start = e; const next = e.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;   return next === null ? (() => start) : next };
    
