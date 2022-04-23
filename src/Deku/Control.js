exports.mutAr = (a) =>  () => {
  return a.slice();
}
exports.unsafeUpdateMutAr = (i) =>  (v) => (a)  => () => {
  a[i] = v;
}
exports.readAr = (a) => () => {
	return a.slice();
};
