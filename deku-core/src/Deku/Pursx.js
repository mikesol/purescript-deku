// todo: we can theoretically speed this up by
// passing in an object with only the keys we want
// not sure if it's worth it creating that object, though
// which takes time and may outweigh the gains
export const findComments = (t, p, s) => {
  if (!p.childNodes) return;

  for (let node of p.childNodes) {
    if (node.nodeType === Node.COMMENT_NODE) {
      const tc = node.textContent.split("@!@");
      if (tc[0] === t) {
        s[tc[1]] = node;
      }
    }

    // Recursively search in child nodes.
    findComments(t, node, s);
  }
};

export const getComments = (t, p) => {
  const result = {}; // Clone the object to ensure original isn't modified.
  findComments(t, p, result);
  return result;
};

const ORDER_ARR = "@-@ord3r";
const IS_ATT = "@-@i$a++";
const IX = "@-@!x";
const TOKEN = "@-@t0k3n";
const POST = "@-@p0$t";
const STR = "@-@$+r";
const PVKEY = "@-@pv";
const CBKEY = "@-@cbk";
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
    out[ORDER_ARR].push(key);
    out[key + IS_ATT] = isAtts[key];
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
  return out;
};

export const newStringSplit = (ix, ss) => {
  const out = { ...ss };
  out[IX] = ix;
  return out;
};

export const addIxToStringSplitForStringInitValue = (ix, key, val, ss) => {
  ss[key + STR] = val;
};

export const addIxToStringSplitForPropInitValue = (ix, key, k, v, ss) => {
  !ss[key + PVKEY] && (ss[key + PVKEY] = []);
  ss[key + PVKEY].push([k, v]);
};

export const addIxToStringSplitForCbInitValue = (ix, key, ss) => {
  ss[key + CBKEY] = true;
};

export const collapseStringSplit = (ss) => {
  let out = "";
  const ix = ss[IX];
  const token = ss[TOKEN];
  out += ss[INITA];
  out += ` id="${makeTopLevelId(token, ix)}" `;
  out += ss[INITB];
  for (const key of ss[ORDER_ARR]) {
    if (ss[key + IS_ATT]) {
      out += ` id="${makeKeyedId(token, ix, key)}"`;
      if (ss[key + CBKEY]) {
        out += ` data-dkix="${ix}" data-dktt="${key}" `;
      }
      const pvs = ss[key + PVKEY];
      if (pvs) {
        for (const [k, v] of pvs) {
          out += ` ${k}="${v}" `;
        }
      }
    } else {
      out += `<span id="${makeKeyedId(token, ix, key)}">`;
      ss[key + STR] && (out += ss[key + STR]);
      out += "</span>";
    }
    out += ss[key + POST];
  }
  return out;
};

export const makeTopLevelId = (token, ix) => `d3ku!-${token}-${ix}`;
export const makeKeyedId = (token, ix, key) => `d3ku!-${token}-${ix}-${key}`;

export const lifecycleShrinkHack = (i) => {
  const out = {};
  i["sendTo"] !== undefined && (out["sendTo"] = i["sendTo"]);
  i["remove"] !== undefined && (out["remove"] = i["remove"]);
  return out;
};

export const nonLifecycleShrinkHackImpl = (i) => {
  const out = { ...i };
  delete out["sendTo"];
  delete out["remove"];
  return out;
};
