export const encodedString = (rawStr) => rawStr.replace(/[\u00A0-\u9999<>\&]/g, function(i) {
   return '&#'+i.charCodeAt(0)+';';
});

export const doPursxReplacements = ({ id, html, pxScope, cache, verb }) => {
	let vhtml = html;
	const entries = Object.entries(cache);
	for (var i = 0; i < entries.length; i++) {
		const key = entries[i][0];
		if (entries[i][1] === true) {
			// it is an attribute
			vhtml = vhtml.replace(
				verb + key + verb,
				"data-deku-attr-internal=" +
					'"' +
					key +
					'" data-deku-ssr="' +
					key + "@!%" +
					pxScope +
					'"'
			);
		} else {
			vhtml = vhtml.replace(
				verb + key + verb,
				'<span style="display:contents;" data-deku-elt-internal=' +
					'"' +
					key +
					'" data-deku-ssr="' +
					key + "@!%" +
					pxScope +
					'"></span>'
			);
		}
	}
	const gtix = vhtml.indexOf(">");
	const cix = vhtml.indexOf("/>");
	const ix = cix == gtix - 1 ? cix : gtix;
	return (
		vhtml.slice(0, ix) + " data-deku-ssr=\"" + id + '" ' + vhtml.slice(ix)
	);
};
