export const encodedString = (rawStr) => rawStr.replace(/[\u00A0-\u9999<>\&]/g, function(i) {
   return '&#'+i.charCodeAt(0)+';';
});

export const freezeObj = (o) => () => ({ ...o });