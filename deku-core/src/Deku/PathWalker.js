export const xDownGroup = x => { const start = x.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xRightGroup = x => { const start = x.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yDownGroup = x => { const start = x.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yRightGroup = x => { const start = x.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxDownGroup = x => { const start = x.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxRightGroup = x => { const start = x.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyDownGroup = x => { const start = x.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyRightGroup = x => { const start = x.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxDownGroup = x => { const start = x.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyDownGroup = x => { const start = x.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxxxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxxxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxxxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxxxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxxxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxxxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxxxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxxxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxxyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxxyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxxyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxxyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxxyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxxyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxxyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxxyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxyxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxyxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxyxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxyxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxyxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxyxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxyxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxyxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xxyyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xxyyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xxyyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xxyyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xxyyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xxyyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xxyyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xxyyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyxxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyxxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyxxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyxxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyxxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyxxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyxxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyxxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyxyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyxyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyxyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyxyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyxyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyxyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyxyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyxyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyyxxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyyxxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyyxxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyyxxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyyxyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyyxyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyyxyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyyxyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const xyyyxxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const xyyyxxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const xyyyxyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const xyyyxyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const xyyyyxDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const xyyyyxRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const xyyyyyDownGroup = x => { const start = x.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const xyyyyyRightGroup = x => { const start = x.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxxxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxxxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxxxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxxxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxxxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxxxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxxxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxxxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxxyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxxyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxxyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxxyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxxyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxxyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxxyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxxyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxyxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxyxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxyxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxyxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxyxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxyxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxyxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxyxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yxyyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yxyyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yxyyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yxyyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yxyyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yxyyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yxyyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yxyyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyxxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyxxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyxxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyxxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyxxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyxxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyxxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyxxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyxyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyxyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyxyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyxyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyxyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyxyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyxyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyxyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyyxxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyyxxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyyxxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyyxxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyyxyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyyxyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyyxyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyyxyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    
export const yyyyxxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
export const yyyyxxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.firstElementChild }};
    
export const yyyyxyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
export const yyyyxyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild; return { p: start, e: start.nextElementSibling }};
    
export const yyyyyxDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
export const yyyyyxRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.firstElementChild }};
    
export const yyyyyyDownGroup = x => { const start = x.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
export const yyyyyyRightGroup = x => { const start = x.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling; return { p: start, e: start.nextElementSibling }};
    

export const processString = (s, r, e) => {
  // Get the previous sibling of the element
  let textNode = e.previousSibling;

  // Ensure the previous sibling is actually a text node. If it isn't, this will not work.
  if (textNode && textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
    let replacement = r[s];
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
export const splitTextAndReturnReplacement = (s, e) => {
  // Get the previous sibling (text node) of the element
  let textNode = e.previousSibling;

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

