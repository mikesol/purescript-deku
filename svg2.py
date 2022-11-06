import requests
from bs4 import BeautifulSoup
import json


def s(x):
    return [y.replace(",", "") for y in x.split(" ") if y != " "]


tfa = s("type, tableValues, slope, intercept, amplitude, exponent, offset")
pa = s(
    "alignment-baseline baseline-shift clip clip-path clip-rule color color-interpolation color-interpolation-filters color-profile color-rendering cursor direction display dominant-baseline enable-background fill fill-opacity fill-rule filter flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-orientation-horizontal glyph-orientation-vertical image-rendering kerning letter-spacing lighting-color marker-end marker-mid marker-start mask opacity overflow pointer-events shape-rendering stop-color stop-opacity stroke stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering transform transform-origin unicode-bidi vector-effect visibility word-spacing writing-mode"
)
ics = ["id", "tabindex", "class", "style"]
itcs = ["id", "class", "style"]
cs = ["class", "style"]
gl = s(
    "oncancel, oncanplay, oncanplaythrough, onchange, onclick, onclose, oncuechange, ondblclick, ondrag, ondragend, ondragenter, ondragleave, ondragover, ondragstart, ondrop, ondurationchange, onemptied, onended, onerror, onfocus, oninput, oninvalid, onkeydown, onkeypress, onkeyup, onload, onloadeddata, onloadedmetadata, onloadstart, onmousedown, onmouseenter, onmouseleave, onmousemove, onmouseout, onmouseover, onmouseup, onmousewheel, onpause, onplay, onplaying, onprogress, onratechange, onreset, onresize, onscroll, onseeked, onseeking, onselect, onshow, onstalled, onsubmit, onsuspend, ontimeupdate, ontoggle, onvolumechange, onwaiting"
)
resl = s("requiredExtensions, systemLanguage")
gr = s("onactivate, onfocusin, onfocusout")
dc = s("onabort, onerror, onresize, onscroll, onunload")
dce = s("oncopy, oncut, onpaste")
fpa = s("height, result, width, x, y")
gldc = gl + dc
##
cpa = s("requiredExtensions, requiredFeatures, systemLanguage")
ca = s("id, lang, tabindex, xml:base, xml:lang, xml:space")
aea = s("onbegin, onend, onrepeat")
xa = s(
    "xlink:href, xlink:type, xlink:role, xlink:arcrole, xlink:title, xlink:show, xlink:actuate"
)
aata = s("attributeType, attributeName")
ata = s("begin, dur, end, min, max, restart, repeatCount, repeatDur, fill")
ava = s(
    "calcMode, values, keyTimes, keySplines, from, to, by, autoReverse, accelerate, decelerate"
)
aaa = s("additive, accumulate")
##
aria = s(
    "aria-activedescendant, aria-atomic, aria-autocomplete, aria-busy, aria-checked, aria-colcount, aria-colindex, aria-colspan, aria-controls, aria-current, aria-describedby, aria-details, aria-disabled, aria-dropeffect, aria-errormessage, aria-expanded, aria-flowto, aria-grabbed, aria-haspopup, aria-hidden, aria-invalid, aria-keyshortcuts, aria-label, aria-labelledby, aria-level, aria-live, aria-modal, aria-multiline, aria-multiselectable, aria-orientation, aria-owns, aria-placeholder, aria-posinset, aria-pressed, aria-readonly, aria-relevant, aria-required, aria-roledescription, aria-rowcount, aria-rowindex, aria-rowspan, aria-selected, aria-setsize, aria-sort, aria-valuemax, aria-valuemin, aria-valuenow, aria-valuetext, role"
)
A = {
    "animate": s("begin, dur, end, min, max, restart, repeatCount, repeatDur, fill")
    + s("calcMode, values, keyTimes, keySplines, from, to, by")
    + s("attributeName, additive, accumulate")
    + s("onbegin, onend, onrepeat")
    + ics
    + gldc,
    "animateMotion": s("keyPoints path rotate")
    + s("begin, dur, end, min, max, restart, repeatCount, repeatDur, fill")
    + s("calcMode, values, keyTimes, keySplines, from, to, by")
    + s("attributeName, additive, accumulate")
    + s("onbegin, onend, onrepeat")
    + ics
    + gldc,
    "animateTransform": cpa
    + ca
    + aea
    + xa
    + aata
    + ata
    + ava
    + aaa
    + s("by from to type"),
    "circle": s("cx cy r pathLength")
    + itcs
    + resl
    + gl
    + gr
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    )
    + s(
        "aria-activedescendant, aria-atomic, aria-autocomplete, aria-busy, aria-checked, aria-colcount, aria-colindex, aria-colspan, aria-controls, aria-current, aria-describedby, aria-details, aria-disabled, aria-dropeffect, aria-errormessage, aria-expanded, aria-flowto, aria-grabbed, aria-haspopup, aria-hidden, aria-invalid, aria-keyshortcuts, aria-label, aria-labelledby, aria-level, aria-live, aria-modal, aria-multiline, aria-multiselectable, aria-orientation, aria-owns, aria-placeholder, aria-posinset, aria-pressed, aria-readonly, aria-relevant, aria-required, aria-roledescription, aria-rowcount, aria-rowindex, aria-rowspan, aria-selected, aria-setsize, aria-sort, aria-valuemax, aria-valuemin, aria-valuenow, aria-valuetext, role"
    ),
    "clipPath": ["clipPathUnits"]
    + ics
    + resl
    + s(
        "clip-path, clip-rule, color, display, fill, fill-opacity, fill-rule, filter, mask, opacity, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "defs": s("id lang class style")
    + gldc
    + gr
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "desc": ics + gldc,
    "discard": cpa + ca,
    "ellipse": s("cx cy rx ry pathLength")
    + itcs
    + aria
    + cpa
    + gl
    + gr
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "feBlend": ca + pa + fpa + cs + s("in in2 mode"),
    "feColorMatrix": ca + pa + fpa + cs + s("in type values"),
    "feComponentTransfer": ca + pa + fpa + cs + ["in"],
    "feComposite": ca + pa + fpa + cs + s("in in2 operator k1 k2 k3 k4"),
    "feConvolveMatrix": ca
    + pa
    + fpa
    + cs
    + s(
        "in order kernelMatrix divisor bias targetX targetY edgeMode kernelUnitLength preserveAlpha"
    ),
    "feDiffuseLighting": ca
    + pa
    + fpa
    + cs
    + s("in surfaceScale diffuseConstant kernelUnitLength"),
    "feDisplacementMap": ca
    + pa
    + fpa
    + cs
    + s("in in2 scale xChannelSelector yChannelSelector"),
    "feDistantLight": ca + s("azimuth elevation"),
    "feDropShadow": s("dx dy stdDeviation")
    + ics
    + s("height, in, result, x, y, width")
    + s("flood-color, flood-opacity"),
    "feFlood": ca + pa + fpa + cs + s("flood-color flood-opacity"),
    "feFuncA": ca + tfa,
    "feFuncB": ca + tfa,
    "feFuncG": ca + tfa,
    "feFuncR": ca + tfa,
    "feGaussianBlur": ca + pa + fpa + cs + s("in stdDeviation edgeMode"),
    "feImage": ca + pa + fpa + xa + cs + s("preserveAspectRatio xlink:href"),
    "feMerge": ca + pa + fpa + cs,
    "feMergeNode": ca + ["in"],
    "feMorphology": ca + pa + fpa + cs + ["in", "operator", "radius"],
    "feOffset": ca + pa + fpa + cs + s("in dx dy"),
    "fePointLight": ca + s("x y z"),
    "feSpecularLighting": ca
    + pa
    + fpa
    + cs
    + s("in surfaceScale specularConstant specularExponent kernelUnitLength"),
    "feSpotLight": ca
    + s("x y z pointsAtX pointsAtY pointsAtZ specularExponent limitingConeAngle"),
    "feTile": ca + pa + fpa + cs + ["in"],
    "feTurbulence": ca
    + pa
    + fpa
    + cs
    + ["baseFrequency", "numOctaves", "seed", "stitchTiles", "type"],
    "filter": ca
    + pa
    + xa
    + cs
    + [
        "x",
        "y",
        "width",
        "height",
        "filterRes",
        "filterUnits",
        "primitiveUnits",
        "xlink:href",
    ],
    "foreignObject": s("height width x y")
    + itcs
    + cpa
    + gl
    + gr
    + dc
    + dce
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    )
    + s(
        "aria-activedescendant, aria-atomic, aria-autocomplete, aria-busy, aria-checked, aria-colcount, aria-colindex, aria-colspan, aria-controls, aria-current, aria-describedby, aria-details, aria-disabled, aria-dropeffect, aria-errormessage, aria-expanded, aria-flowto, aria-grabbed, aria-haspopup, aria-hidden, aria-invalid, aria-keyshortcuts, aria-label, aria-labelledby, aria-level, aria-live, aria-modal, aria-multiline, aria-multiselectable, aria-orientation, aria-owns, aria-placeholder, aria-posinset, aria-pressed, aria-readonly, aria-relevant, aria-required, aria-roledescription, aria-rowcount, aria-rowindex, aria-rowspan, aria-selected, aria-setsize, aria-sort, aria-valuemax, aria-valuemin, aria-valuenow, aria-valuetext, role"
    ),
    "g": itcs
    + cpa
    + gl
    + gr
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    )
    + aria,
    "image": cpa
    + ca
    + s("onactivate, onfocusin, onfocusout")
    + pa
    + xa
    + cs
    + ["transform"]
    + s("x y width height href xlink:href preserveAspectRatio crossorigin"),
    "line": s("x1 x2 y1 y2 pathLength")
    + itcs
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "linearGradient": s(
        "gradientUnits gradientTransform href spreadMethod x1 x2 xlink:href y1 y2"
    )
    + ics
    + gl
    + dce
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    )
    + s("xlink:href, xlink:title"),
    "marker": s(
        "markerHeight markerUnits markerWidth orient preserveAspectRatio refX refY viewBox"
    )
    + itcs
    + cpa
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "mask": s("height maskContentUnits maskUnits x y width")
    + ics
    + cpa
    + s(
        "clip-path, clip-rule, color, display, fill, fill-opacity, fill-rule, filter, mask, opacity, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "metadata": ca + gl,
    "mpath": ca + xa + ["xlink:href"],
    "path": s("d pathLength")
    + itcs
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "pattern": s(
        "height href patternContentUnits patternTransform patternUnits preserveAspectRatio viewBox width x xlink:href y"
    )
    + itcs
    + cpa
    + ["xlink:title"]
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "polygon": s("points pathLength")
    + itcs
    + cpa
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "polyline": s("points pathLength")
    + itcs
    + cpa
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "radialGradient": s(
        "cx cy fr fx fy gradientUnits gradientTransform href r spreadMethod xlink:href"
    )
    + ics
    + gl
    + dce
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    )
    + s("xlink:href, xlink:title"),
    "rect": s("x y width height rx ry pathLength")
    + itcs
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "set": ["to"]
    + s("begin, dur, end, min, max, restart, repeatCount, repeatDur, fill")
    + ["attributeName"]
    + s("onbegin, onend, onrepeat")
    + ics
    + gl
    + dce,
    "stop": ["offset", "stop-color", "stop-opacity"]
    + ics
    + gl
    + dce
    + s("color, display, stop-color, stop-opacity, visibility"),
    "svg": s(
        "baseProfile contentScriptType contentStyleType height preserveAspectRatio version viewBox width x y"
    )
    + itcs
    + cpa
    + gl
    + gr
    + dc
    + dce
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "switch": cpa + ca + gr + pa + cs + ["transform"],
    "symbol": s("height preserveAspectRatio refX refY viewBox width x y")
    + ics
    + gl
    + dce
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "text": s("x y dx dy rotate lengthAdjust textLength")
    + s(
        "id tabindex class, style, font-family, font-size, font-size-adjust, font-stretch, font-style, font-variant, font-weight"
    )
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, dominant-baseline, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, text-anchor, transform, vector-effect, visibility"
    ),
    "textPath": s("href lengthAdjust method path side spacing startOffset textLength")
    + itcs
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "title": ics + gl + dce,
    "tspan": s("x y dx dy rotate lengthAdjust textLength")
    + s(
        "id tabindex class, style, font-family, font-size, font-size-adjust, font-stretch, font-style, font-variant, font-weight"
    )
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, dominant-baseline, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, text-anchor, transform, vector-effect, visibility"
    ),
    "use": s("href xlink:href x y width height")
    + itcs
    + cpa
    + gl
    + gr
    + aria
    + s(
        "clip-path, clip-rule, color, color-interpolation, color-rendering, cursor, display, fill, fill-opacity, fill-rule, filter, mask, opacity, pointer-events, shape-rendering, stroke, stroke-dasharray, stroke-dashoffset, stroke-linecap, stroke-linejoin, stroke-miterlimit, stroke-opacity, stroke-width, transform, vector-effect, visibility"
    ),
    "view": aria + ca + gl + s("viewBox preserveAspectRatio zoomAndPan viewTarget"),
}
print(json.dumps(A))
