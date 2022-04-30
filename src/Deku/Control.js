export function mutAr(a) {
  return () => {
    return a.slice();
  };
}

export function unsafeUpdateMutAr(i) {
  return (v) => (a)  => () => {
    a[i] = v;
  };
}

export function readAr(a) {
  return () => {
      return a.slice();
  };
}
