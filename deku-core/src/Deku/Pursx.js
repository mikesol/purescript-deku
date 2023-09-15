// todo: we can theoretically speed this up by
// passing in an object with only the keys we want
// not sure if it's worth it creating that object, though
// which takes time and may outweigh the gains
export const findComments = (t, p, s) => {
  if (!(p instanceof Element)) return;

  for (let node of p.childNodes) {
    if (node.nodeType === Node.COMMENT_NODE) {
      if (Object.keys(p).indexOf(t + key) !== -1) {
        s[key] = node;
      }
    }

    // Recursively search in child nodes.
    findComment(node, s);
  }
};

export const getComments = (t, p, s) => {
  const result = { ...s }; // Clone the object to ensure original isn't modified.
  findComment(t, p, result);
  return result;
};
const ORDER_ARR = "@-@ord3r";
const IS_ATT = "@-@i$a++";
const IX = "@-@!x";
const TOKEN = "@-@t0k3n";
const POST = "@-@p0$t";
const STR = "@-@$+r"
const INITA = "@-@in!tA";
const INITB = "@-@in!tB";
export const commentFromCache = (s) => (c) => c[s];
//Verb (Object.Object Boolean) PxToken Html
export const buildStringSplit = (verb, isAtts, token, html$) => {
  const html = html$.trim();
  const out = {};
  out[ORDER_ARR] = [];
  out[TOKEN] = token;
  const hsplit = html.split(verb);
  for (var i = 1; i < hsplit.length; i = i + 2) {
    const key = hsplit[i];
    out[ORDER_ARR].append(key);
    out[IS_ATT] = isAtts[key];
    out[key + POST] = hsplit[i + 1];
  }
  const splits = [
    hsplit[0].indexOf("/"),
    hsplit[0].indexOf(">"),
    hsplit[0].indexOf(" "),
  ].filter((x) => x !== -1);
  const splitPt = Math.min(...splits);
  out[INITA] = hsplit[0].substring(0, splitPt);
  out[INITB] = hsplit[0].substring(splitPt);
};

export const newStringSplit = (ix, ss) => {
  const out = { ...ss };
  out[IX] = ix;
  return out;
};

export const addIxToStringSplitNoInitValue = (ix, key, ss) => {

};

export const addIxToStringSplitForStringInitValue = () => {
  /** modify_
          ( \i ->
              let
                b = "<span data-dktt=\"" <> key
                  <> "\" data-dktk=\""
                  <> t
                c = "\">"
                a = "</span>"
              in
                String.replace (String.Pattern $ b <> c <> a)
                  ( String.Replacement $ b <> " data-dkix=\"" <> ix <> "\"" <> c
                      <> value
                      <> a
                  )
          )
          singleH */
};

export const addIxToStringSplitForPropInitValue = () => {
  /**modify_
              ( \i ->
                  let
                    x = "data-dktt=\"" <> key <> "\""
                  in
                    String.replace (String.Pattern $ x)
                      ( String.Replacement $ " " <> value.key <> "=\""
                          <> value.value
                          <> "\" "
                          <> " data-dkix=\""
                          <> ix
                          <> "\""
                          <> x
                      )
              )
              singleH */
};

export const addIxToStringSplitForCbInitValue = () => {};

export const shrinkHack = (i) => {
  const out = {};
  i["sendTo"] !== undefined && (out["sendTo"] = i["sendTo"]);
  i["remove"] !== undefined && (out["remove"] = i["remove"]);
  return out;
};
