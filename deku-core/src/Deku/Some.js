export const projImpl = (just, nothing, arr, r) => {
  const out = {};
  for (var i = 0; i < arr.length; i++) {
    const x = r[arr[i]];
    if (x !== undefined) {
      out[arr[i]] = just(x);
    } else {
      out[arr[i]] = nothing;
    }
  }
  return out;
};

export const foreachEImpl = (needles, haystack) => {
  const entries = Object.entries(needles);
  for (var i = 0; i < entries.length; i++) {
    const [key, value] = entries[i];
    haystack[key](value);
  }
};
