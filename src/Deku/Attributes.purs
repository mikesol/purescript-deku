-- | This module contains various helper functions for setting attributes on elements.
module Deku.Attributes
  ( inputmode
  , fy
  , ariaRowcount
  , colspan
  , form
  , baseProfile
  , disabled
  , novalidate
  , k2
  , values
  , ariaChecked
  , fillRule
  , textAnchor
  , markerWidth
  , coords
  , poster
  , cite
  , fill
  , xmlLang
  , minlength
  , order
  , colorRendering
  , autofocus
  , fillOpacity
  , zoomAndPan
  , ariaGrabbed
  , ariaRoledescription
  , size
  , slope
  , seed
  , baselineShift
  , accelerate
  , alignmentBaseline
  , floodColor
  , ariaLabel
  , ariaExpanded
  , dy
  , ariaLive
  , low
  , fontStyle
  , imageRendering
  , integrity
  , async
  , fontVariant
  , formnovalidate
  , spellcheck
  , ariaErrormessage
  , srcset
  , dx
  , accumulate
  , lightingColor
  , ariaBusy
  , surfaceScale
  , bias
  , ariaActivedescendant
  , contentStyleType
  , rows
  , formenctype
  , glyphOrientationVertical
  , vectorEffect
  , required
  , colorInterpolation
  , strokeOpacity
  , lengthAdjust
  , crossorigin
  , ariaOrientation
  , scoped
  , x1
  , dirname
  , ariaSelected
  , id
  , maskUnits
  , transform
  , type_
  , textDecoration
  , k3
  , by
  , ping
  , preserveAspectRatio
  , border
  , alt
  , method
  , ariaDescribedby
  , ariaColcount
  , default
  , ariaRelevant
  , acceptCharset
  , fx
  , pathLength
  , z
  , label
  , ariaControls
  , lang
  , ariaHaspopup
  , tabindex
  , httpEquiv
  , rel
  , ariaRowindex
  , patternUnits
  , strokeDasharray
  , mask
  , keySplines
  , kind
  , fontStretch
  , ariaPlaceholder
  , edgeMode
  , d
  , defer
  , offset
  , visibility
  , ariaRowspan
  , manifest
  , ariaInvalid
  , list
  , cx
  , charset
  , pattern
  , usemap
  , xlinkTitle
  , patternContentUnits
  , pointsAtY
  , k4
  , gradientUnits
  , operator
  , mode
  , baseFrequency
  , preserveAlpha
  , ismap
  , ariaValuetext
  , ariaReadonly
  , restart
  , title
  , additive
  , xlinkHref
  , fontWeight
  , attributeType
  , sizes
  , strokeDashoffset
  , clipPath
  , formtarget
  , data_
  , y1
  , accesskey
  , radiogroup
  , accept
  , placeholder
  , xlinkArcrole
  , limitingConeAngle
  , strokeLinejoin
  , ariaDropeffect
  , icon
  , points
  , orient
  , clipRule
  , pointsAtX
  , markerUnits
  , klass
  , cy
  , radius
  , strokeWidth
  , calcMode
  , xmlBase
  , to
  , formaction
  , maskContentUnits
  , headers
  , start
  , srclang
  , contentScriptType
  , in_
  , codebase
  , side
  , specularExponent
  , ariaColindex
  , xlinkRole
  , ariaValuenow
  , media
  , importance
  , ariaAutocomplete
  , spreadMethod
  , gradientTransform
  , fr
  , ariaPressed
  , align
  , style
  , glyphOrientationHorizontal
  , dur
  , clipPathUnits
  , filterRes
  , capture
  , xChannelSelector
  , max
  , height
  , ariaMultiline
  , kernelUnitLength
  , autocapitalize
  , viewTarget
  , rx
  , preload
  , maxlength
  , autoReverse
  , dominantBaseline
  , yChannelSelector
  , selected
  , high
  , slot
  , ariaHidden
  , challenge
  , ariaRequired
  , enctype
  , y2
  , letterSpacing
  , markerStart
  , rotate
  , ariaPosinset
  , ariaDetails
  , keyTimes
  , ariaMultiselectable
  , stopColor
  , repeatCount
  , xlinkType
  , writingMode
  , textLength
  , keyPoints
  , spacing
  , display
  , formmethod
  , srcdoc
  , colorProfile
  , optimum
  , stroke
  , xlinkShow
  , azimuth
  , name
  , wordSpacing
  , pointsAtZ
  , download
  , textRendering
  , reversed
  , strokeMiterlimit
  , buffered
  , ariaSort
  , ariaOwns
  , requiredExtensions
  , csp
  , allow
  , scope
  , r
  , xlinkActuate
  , startOffset
  , ry
  , multiple
  , primitiveUnits
  , sandbox
  , keytype
  , stdDeviation
  , rowspan
  , ariaDisabled
  , bgcolor
  , muted
  , decoding
  , filterUnits
  , ariaCurrent
  , min
  , overflow
  , draggable
  , pointerEvents
  , x2
  , ariaFlowto
  , enableBackground
  , target
  , xmlSpace
  , contextmenu
  , src
  , datetime
  , ariaLabelledby
  , viewBox
  , hidden
  , markerHeight
  , systemLanguage
  , fontFamily
  , result
  , in2
  , y
  , language
  , background
  , ariaSetsize
  , stitchTiles
  , specularConstant
  , refX
  , hreflang
  , decelerate
  , clip
  , targetX
  , ariaValuemax
  , role
  , action
  , open
  , kerning
  , tableValues
  , exponent
  , step
  , colorInterpolationFilters
  , loading
  , autocomplete
  , value
  , ariaLevel
  , stopOpacity
  , requiredFeatures
  , code
  , from
  , readonly
  , for
  , numOctaves
  , kernelMatrix
  , cols
  , path
  , loop
  , amplitude
  , content
  , xtype
  , end
  , floodOpacity
  , ariaColspan
  , cursor
  , filter
  , shapeRendering
  , targetY
  , color
  , summary
  , fontSizeAdjust
  , intercept
  , refY
  , shape
  , ariaValuemin
  , markerEnd
  , translate
  , itemprop
  , checked
  , scale
  , width
  , dir
  , patternTransform
  , intrinsicsize
  , x
  , divisor
  , direction
  , ariaModal
  , href
  , version
  , begin
  , elevation
  , markerMid
  , k1
  , fontSize
  , attributeName
  , ariaKeyshortcuts
  , ariaAtomic
  , opacity
  , strokeLinecap
  , repeatDur
  , referrerpolicy
  , unicodeBidi
  , transformOrigin
  , diffuseConstant
  , controls
  , autoplay
  , span
  , enterkeyhint
  , contenteditable
  ) where

import Deku.Attribute (class Attr, Attribute, attr)
import Deku.DOM as D

inputmode
  :: forall e u
   . Attr e D.Inputmode u
  => u
  -> Attribute e
inputmode = attr D.Inputmode

fy
  :: forall e u
   . Attr e D.Fy u
  => u
  -> Attribute e
fy = attr D.Fy

ariaRowcount
  :: forall e u
   . Attr e D.AriaRowcount u
  => u
  -> Attribute e
ariaRowcount = attr D.AriaRowcount

colspan
  :: forall e u
   . Attr e D.Colspan u
  => u
  -> Attribute e
colspan = attr D.Colspan

form
  :: forall e u
   . Attr e D.Form u
  => u
  -> Attribute e
form = attr D.Form

baseProfile
  :: forall e u
   . Attr e D.BaseProfile u
  => u
  -> Attribute e
baseProfile = attr D.BaseProfile

disabled
  :: forall e u
   . Attr e D.Disabled u
  => u
  -> Attribute e
disabled = attr D.Disabled

novalidate
  :: forall e u
   . Attr e D.Novalidate u
  => u
  -> Attribute e
novalidate = attr D.Novalidate

k2
  :: forall e u
   . Attr e D.K2 u
  => u
  -> Attribute e
k2 = attr D.K2

values
  :: forall e u
   . Attr e D.Values u
  => u
  -> Attribute e
values = attr D.Values

ariaChecked
  :: forall e u
   . Attr e D.AriaChecked u
  => u
  -> Attribute e
ariaChecked = attr D.AriaChecked

fillRule
  :: forall e u
   . Attr e D.FillRule u
  => u
  -> Attribute e
fillRule = attr D.FillRule

textAnchor
  :: forall e u
   . Attr e D.TextAnchor u
  => u
  -> Attribute e
textAnchor = attr D.TextAnchor

markerWidth
  :: forall e u
   . Attr e D.MarkerWidth u
  => u
  -> Attribute e
markerWidth = attr D.MarkerWidth

coords
  :: forall e u
   . Attr e D.Coords u
  => u
  -> Attribute e
coords = attr D.Coords

poster
  :: forall e u
   . Attr e D.Poster u
  => u
  -> Attribute e
poster = attr D.Poster

cite
  :: forall e u
   . Attr e D.Cite u
  => u
  -> Attribute e
cite = attr D.Cite

fill
  :: forall e u
   . Attr e D.Fill u
  => u
  -> Attribute e
fill = attr D.Fill

xmlLang
  :: forall e u
   . Attr e D.XmlLang u
  => u
  -> Attribute e
xmlLang = attr D.XmlLang

minlength
  :: forall e u
   . Attr e D.Minlength u
  => u
  -> Attribute e
minlength = attr D.Minlength

order
  :: forall e u
   . Attr e D.Order u
  => u
  -> Attribute e
order = attr D.Order

colorRendering
  :: forall e u
   . Attr e D.ColorRendering u
  => u
  -> Attribute e
colorRendering = attr D.ColorRendering

autofocus
  :: forall e u
   . Attr e D.Autofocus u
  => u
  -> Attribute e
autofocus = attr D.Autofocus

fillOpacity
  :: forall e u
   . Attr e D.FillOpacity u
  => u
  -> Attribute e
fillOpacity = attr D.FillOpacity

zoomAndPan
  :: forall e u
   . Attr e D.ZoomAndPan u
  => u
  -> Attribute e
zoomAndPan = attr D.ZoomAndPan

ariaGrabbed
  :: forall e u
   . Attr e D.AriaGrabbed u
  => u
  -> Attribute e
ariaGrabbed = attr D.AriaGrabbed

ariaRoledescription
  :: forall e u
   . Attr e D.AriaRoledescription u
  => u
  -> Attribute e
ariaRoledescription = attr D.AriaRoledescription

size
  :: forall e u
   . Attr e D.Size u
  => u
  -> Attribute e
size = attr D.Size

slope
  :: forall e u
   . Attr e D.Slope u
  => u
  -> Attribute e
slope = attr D.Slope

seed
  :: forall e u
   . Attr e D.Seed u
  => u
  -> Attribute e
seed = attr D.Seed

baselineShift
  :: forall e u
   . Attr e D.BaselineShift u
  => u
  -> Attribute e
baselineShift = attr D.BaselineShift

accelerate
  :: forall e u
   . Attr e D.Accelerate u
  => u
  -> Attribute e
accelerate = attr D.Accelerate

alignmentBaseline
  :: forall e u
   . Attr e D.AlignmentBaseline u
  => u
  -> Attribute e
alignmentBaseline = attr D.AlignmentBaseline

floodColor
  :: forall e u
   . Attr e D.FloodColor u
  => u
  -> Attribute e
floodColor = attr D.FloodColor

ariaLabel
  :: forall e u
   . Attr e D.AriaLabel u
  => u
  -> Attribute e
ariaLabel = attr D.AriaLabel

ariaExpanded
  :: forall e u
   . Attr e D.AriaExpanded u
  => u
  -> Attribute e
ariaExpanded = attr D.AriaExpanded

dy
  :: forall e u
   . Attr e D.Dy u
  => u
  -> Attribute e
dy = attr D.Dy

ariaLive
  :: forall e u
   . Attr e D.AriaLive u
  => u
  -> Attribute e
ariaLive = attr D.AriaLive

low
  :: forall e u
   . Attr e D.Low u
  => u
  -> Attribute e
low = attr D.Low

fontStyle
  :: forall e u
   . Attr e D.FontStyle u
  => u
  -> Attribute e
fontStyle = attr D.FontStyle

imageRendering
  :: forall e u
   . Attr e D.ImageRendering u
  => u
  -> Attribute e
imageRendering = attr D.ImageRendering

integrity
  :: forall e u
   . Attr e D.Integrity u
  => u
  -> Attribute e
integrity = attr D.Integrity

async
  :: forall e u
   . Attr e D.Async u
  => u
  -> Attribute e
async = attr D.Async

fontVariant
  :: forall e u
   . Attr e D.FontVariant u
  => u
  -> Attribute e
fontVariant = attr D.FontVariant

formnovalidate
  :: forall e u
   . Attr e D.Formnovalidate u
  => u
  -> Attribute e
formnovalidate = attr D.Formnovalidate

spellcheck
  :: forall e u
   . Attr e D.Spellcheck u
  => u
  -> Attribute e
spellcheck = attr D.Spellcheck

ariaErrormessage
  :: forall e u
   . Attr e D.AriaErrormessage u
  => u
  -> Attribute e
ariaErrormessage = attr D.AriaErrormessage

srcset
  :: forall e u
   . Attr e D.Srcset u
  => u
  -> Attribute e
srcset = attr D.Srcset

dx
  :: forall e u
   . Attr e D.Dx u
  => u
  -> Attribute e
dx = attr D.Dx

accumulate
  :: forall e u
   . Attr e D.Accumulate u
  => u
  -> Attribute e
accumulate = attr D.Accumulate

lightingColor
  :: forall e u
   . Attr e D.LightingColor u
  => u
  -> Attribute e
lightingColor = attr D.LightingColor

ariaBusy
  :: forall e u
   . Attr e D.AriaBusy u
  => u
  -> Attribute e
ariaBusy = attr D.AriaBusy

surfaceScale
  :: forall e u
   . Attr e D.SurfaceScale u
  => u
  -> Attribute e
surfaceScale = attr D.SurfaceScale

bias
  :: forall e u
   . Attr e D.Bias u
  => u
  -> Attribute e
bias = attr D.Bias

ariaActivedescendant
  :: forall e u
   . Attr e D.AriaActivedescendant u
  => u
  -> Attribute e
ariaActivedescendant = attr D.AriaActivedescendant

contentStyleType
  :: forall e u
   . Attr e D.ContentStyleType u
  => u
  -> Attribute e
contentStyleType = attr D.ContentStyleType

rows
  :: forall e u
   . Attr e D.Rows u
  => u
  -> Attribute e
rows = attr D.Rows

formenctype
  :: forall e u
   . Attr e D.Formenctype u
  => u
  -> Attribute e
formenctype = attr D.Formenctype

glyphOrientationVertical
  :: forall e u
   . Attr e D.GlyphOrientationVertical u
  => u
  -> Attribute e
glyphOrientationVertical = attr D.GlyphOrientationVertical

vectorEffect
  :: forall e u
   . Attr e D.VectorEffect u
  => u
  -> Attribute e
vectorEffect = attr D.VectorEffect

required
  :: forall e u
   . Attr e D.Required u
  => u
  -> Attribute e
required = attr D.Required

colorInterpolation
  :: forall e u
   . Attr e D.ColorInterpolation u
  => u
  -> Attribute e
colorInterpolation = attr D.ColorInterpolation

strokeOpacity
  :: forall e u
   . Attr e D.StrokeOpacity u
  => u
  -> Attribute e
strokeOpacity = attr D.StrokeOpacity

lengthAdjust
  :: forall e u
   . Attr e D.LengthAdjust u
  => u
  -> Attribute e
lengthAdjust = attr D.LengthAdjust

crossorigin
  :: forall e u
   . Attr e D.Crossorigin u
  => u
  -> Attribute e
crossorigin = attr D.Crossorigin

ariaOrientation
  :: forall e u
   . Attr e D.AriaOrientation u
  => u
  -> Attribute e
ariaOrientation = attr D.AriaOrientation

scoped
  :: forall e u
   . Attr e D.Scoped u
  => u
  -> Attribute e
scoped = attr D.Scoped

x1
  :: forall e u
   . Attr e D.X1 u
  => u
  -> Attribute e
x1 = attr D.X1

dirname
  :: forall e u
   . Attr e D.Dirname u
  => u
  -> Attribute e
dirname = attr D.Dirname

ariaSelected
  :: forall e u
   . Attr e D.AriaSelected u
  => u
  -> Attribute e
ariaSelected = attr D.AriaSelected

id
  :: forall e u
   . Attr e D.Id u
  => u
  -> Attribute e
id = attr D.Id

maskUnits
  :: forall e u
   . Attr e D.MaskUnits u
  => u
  -> Attribute e
maskUnits = attr D.MaskUnits

transform
  :: forall e u
   . Attr e D.Transform u
  => u
  -> Attribute e
transform = attr D.Transform

type_
  :: forall e u
   . Attr e D.Xtype u
  => u
  -> Attribute e
type_ = attr D.Xtype

textDecoration
  :: forall e u
   . Attr e D.TextDecoration u
  => u
  -> Attribute e
textDecoration = attr D.TextDecoration

k3
  :: forall e u
   . Attr e D.K3 u
  => u
  -> Attribute e
k3 = attr D.K3

by
  :: forall e u
   . Attr e D.By u
  => u
  -> Attribute e
by = attr D.By

ping
  :: forall e u
   . Attr e D.Ping u
  => u
  -> Attribute e
ping = attr D.Ping

preserveAspectRatio
  :: forall e u
   . Attr e D.PreserveAspectRatio u
  => u
  -> Attribute e
preserveAspectRatio = attr D.PreserveAspectRatio

border
  :: forall e u
   . Attr e D.Border u
  => u
  -> Attribute e
border = attr D.Border

alt
  :: forall e u
   . Attr e D.Alt u
  => u
  -> Attribute e
alt = attr D.Alt

method
  :: forall e u
   . Attr e D.Method u
  => u
  -> Attribute e
method = attr D.Method

ariaDescribedby
  :: forall e u
   . Attr e D.AriaDescribedby u
  => u
  -> Attribute e
ariaDescribedby = attr D.AriaDescribedby

ariaColcount
  :: forall e u
   . Attr e D.AriaColcount u
  => u
  -> Attribute e
ariaColcount = attr D.AriaColcount

default
  :: forall e u
   . Attr e D.Default u
  => u
  -> Attribute e
default = attr D.Default

ariaRelevant
  :: forall e u
   . Attr e D.AriaRelevant u
  => u
  -> Attribute e
ariaRelevant = attr D.AriaRelevant

acceptCharset
  :: forall e u
   . Attr e D.AcceptCharset u
  => u
  -> Attribute e
acceptCharset = attr D.AcceptCharset

fx
  :: forall e u
   . Attr e D.Fx u
  => u
  -> Attribute e
fx = attr D.Fx

pathLength
  :: forall e u
   . Attr e D.PathLength u
  => u
  -> Attribute e
pathLength = attr D.PathLength

z
  :: forall e u
   . Attr e D.Z u
  => u
  -> Attribute e
z = attr D.Z

label
  :: forall e u
   . Attr e D.Label u
  => u
  -> Attribute e
label = attr D.Label

ariaControls
  :: forall e u
   . Attr e D.AriaControls u
  => u
  -> Attribute e
ariaControls = attr D.AriaControls

lang
  :: forall e u
   . Attr e D.Lang u
  => u
  -> Attribute e
lang = attr D.Lang

ariaHaspopup
  :: forall e u
   . Attr e D.AriaHaspopup u
  => u
  -> Attribute e
ariaHaspopup = attr D.AriaHaspopup

tabindex
  :: forall e u
   . Attr e D.Tabindex u
  => u
  -> Attribute e
tabindex = attr D.Tabindex

httpEquiv
  :: forall e u
   . Attr e D.HttpEquiv u
  => u
  -> Attribute e
httpEquiv = attr D.HttpEquiv

rel
  :: forall e u
   . Attr e D.Rel u
  => u
  -> Attribute e
rel = attr D.Rel

ariaRowindex
  :: forall e u
   . Attr e D.AriaRowindex u
  => u
  -> Attribute e
ariaRowindex = attr D.AriaRowindex

patternUnits
  :: forall e u
   . Attr e D.PatternUnits u
  => u
  -> Attribute e
patternUnits = attr D.PatternUnits

strokeDasharray
  :: forall e u
   . Attr e D.StrokeDasharray u
  => u
  -> Attribute e
strokeDasharray = attr D.StrokeDasharray

mask
  :: forall e u
   . Attr e D.Mask u
  => u
  -> Attribute e
mask = attr D.Mask

keySplines
  :: forall e u
   . Attr e D.KeySplines u
  => u
  -> Attribute e
keySplines = attr D.KeySplines

kind
  :: forall e u
   . Attr e D.Kind u
  => u
  -> Attribute e
kind = attr D.Kind

fontStretch
  :: forall e u
   . Attr e D.FontStretch u
  => u
  -> Attribute e
fontStretch = attr D.FontStretch

ariaPlaceholder
  :: forall e u
   . Attr e D.AriaPlaceholder u
  => u
  -> Attribute e
ariaPlaceholder = attr D.AriaPlaceholder

edgeMode
  :: forall e u
   . Attr e D.EdgeMode u
  => u
  -> Attribute e
edgeMode = attr D.EdgeMode

d
  :: forall e u
   . Attr e D.D u
  => u
  -> Attribute e
d = attr D.D

defer
  :: forall e u
   . Attr e D.Defer u
  => u
  -> Attribute e
defer = attr D.Defer

offset
  :: forall e u
   . Attr e D.Offset u
  => u
  -> Attribute e
offset = attr D.Offset

visibility
  :: forall e u
   . Attr e D.Visibility u
  => u
  -> Attribute e
visibility = attr D.Visibility

ariaRowspan
  :: forall e u
   . Attr e D.AriaRowspan u
  => u
  -> Attribute e
ariaRowspan = attr D.AriaRowspan

manifest
  :: forall e u
   . Attr e D.Manifest u
  => u
  -> Attribute e
manifest = attr D.Manifest

ariaInvalid
  :: forall e u
   . Attr e D.AriaInvalid u
  => u
  -> Attribute e
ariaInvalid = attr D.AriaInvalid

list
  :: forall e u
   . Attr e D.List u
  => u
  -> Attribute e
list = attr D.List

cx
  :: forall e u
   . Attr e D.Cx u
  => u
  -> Attribute e
cx = attr D.Cx

charset
  :: forall e u
   . Attr e D.Charset u
  => u
  -> Attribute e
charset = attr D.Charset

pattern
  :: forall e u
   . Attr e D.Pattern u
  => u
  -> Attribute e
pattern = attr D.Pattern

usemap
  :: forall e u
   . Attr e D.Usemap u
  => u
  -> Attribute e
usemap = attr D.Usemap

xlinkTitle
  :: forall e u
   . Attr e D.XlinkTitle u
  => u
  -> Attribute e
xlinkTitle = attr D.XlinkTitle

patternContentUnits
  :: forall e u
   . Attr e D.PatternContentUnits u
  => u
  -> Attribute e
patternContentUnits = attr D.PatternContentUnits

pointsAtY
  :: forall e u
   . Attr e D.PointsAtY u
  => u
  -> Attribute e
pointsAtY = attr D.PointsAtY

k4
  :: forall e u
   . Attr e D.K4 u
  => u
  -> Attribute e
k4 = attr D.K4

gradientUnits
  :: forall e u
   . Attr e D.GradientUnits u
  => u
  -> Attribute e
gradientUnits = attr D.GradientUnits

operator
  :: forall e u
   . Attr e D.Operator u
  => u
  -> Attribute e
operator = attr D.Operator

mode
  :: forall e u
   . Attr e D.Mode u
  => u
  -> Attribute e
mode = attr D.Mode

baseFrequency
  :: forall e u
   . Attr e D.BaseFrequency u
  => u
  -> Attribute e
baseFrequency = attr D.BaseFrequency

preserveAlpha
  :: forall e u
   . Attr e D.PreserveAlpha u
  => u
  -> Attribute e
preserveAlpha = attr D.PreserveAlpha

ismap
  :: forall e u
   . Attr e D.Ismap u
  => u
  -> Attribute e
ismap = attr D.Ismap

ariaValuetext
  :: forall e u
   . Attr e D.AriaValuetext u
  => u
  -> Attribute e
ariaValuetext = attr D.AriaValuetext

ariaReadonly
  :: forall e u
   . Attr e D.AriaReadonly u
  => u
  -> Attribute e
ariaReadonly = attr D.AriaReadonly

restart
  :: forall e u
   . Attr e D.Restart u
  => u
  -> Attribute e
restart = attr D.Restart

title
  :: forall e u
   . Attr e D.Title u
  => u
  -> Attribute e
title = attr D.Title

additive
  :: forall e u
   . Attr e D.Additive u
  => u
  -> Attribute e
additive = attr D.Additive

xlinkHref
  :: forall e u
   . Attr e D.XlinkHref u
  => u
  -> Attribute e
xlinkHref = attr D.XlinkHref

fontWeight
  :: forall e u
   . Attr e D.FontWeight u
  => u
  -> Attribute e
fontWeight = attr D.FontWeight

attributeType
  :: forall e u
   . Attr e D.AttributeType u
  => u
  -> Attribute e
attributeType = attr D.AttributeType

sizes
  :: forall e u
   . Attr e D.Sizes u
  => u
  -> Attribute e
sizes = attr D.Sizes

strokeDashoffset
  :: forall e u
   . Attr e D.StrokeDashoffset u
  => u
  -> Attribute e
strokeDashoffset = attr D.StrokeDashoffset

clipPath
  :: forall e u
   . Attr e D.ClipPath u
  => u
  -> Attribute e
clipPath = attr D.ClipPath

formtarget
  :: forall e u
   . Attr e D.Formtarget u
  => u
  -> Attribute e
formtarget = attr D.Formtarget

data_
  :: forall e u
   . Attr e D.Data u
  => u
  -> Attribute e
data_ = attr D.Data

y1
  :: forall e u
   . Attr e D.Y1 u
  => u
  -> Attribute e
y1 = attr D.Y1

accesskey
  :: forall e u
   . Attr e D.Accesskey u
  => u
  -> Attribute e
accesskey = attr D.Accesskey

radiogroup
  :: forall e u
   . Attr e D.Radiogroup u
  => u
  -> Attribute e
radiogroup = attr D.Radiogroup

accept
  :: forall e u
   . Attr e D.Accept u
  => u
  -> Attribute e
accept = attr D.Accept

placeholder
  :: forall e u
   . Attr e D.Placeholder u
  => u
  -> Attribute e
placeholder = attr D.Placeholder

xlinkArcrole
  :: forall e u
   . Attr e D.XlinkArcrole u
  => u
  -> Attribute e
xlinkArcrole = attr D.XlinkArcrole

limitingConeAngle
  :: forall e u
   . Attr e D.LimitingConeAngle u
  => u
  -> Attribute e
limitingConeAngle = attr D.LimitingConeAngle

strokeLinejoin
  :: forall e u
   . Attr e D.StrokeLinejoin u
  => u
  -> Attribute e
strokeLinejoin = attr D.StrokeLinejoin

ariaDropeffect
  :: forall e u
   . Attr e D.AriaDropeffect u
  => u
  -> Attribute e
ariaDropeffect = attr D.AriaDropeffect

icon
  :: forall e u
   . Attr e D.Icon u
  => u
  -> Attribute e
icon = attr D.Icon

points
  :: forall e u
   . Attr e D.Points u
  => u
  -> Attribute e
points = attr D.Points

orient
  :: forall e u
   . Attr e D.Orient u
  => u
  -> Attribute e
orient = attr D.Orient

clipRule
  :: forall e u
   . Attr e D.ClipRule u
  => u
  -> Attribute e
clipRule = attr D.ClipRule

pointsAtX
  :: forall e u
   . Attr e D.PointsAtX u
  => u
  -> Attribute e
pointsAtX = attr D.PointsAtX

markerUnits
  :: forall e u
   . Attr e D.MarkerUnits u
  => u
  -> Attribute e
markerUnits = attr D.MarkerUnits

klass
  :: forall e u
   . Attr e D.Class u
  => u
  -> Attribute e
klass = attr D.Class

cy
  :: forall e u
   . Attr e D.Cy u
  => u
  -> Attribute e
cy = attr D.Cy

radius
  :: forall e u
   . Attr e D.Radius u
  => u
  -> Attribute e
radius = attr D.Radius

strokeWidth
  :: forall e u
   . Attr e D.StrokeWidth u
  => u
  -> Attribute e
strokeWidth = attr D.StrokeWidth

calcMode
  :: forall e u
   . Attr e D.CalcMode u
  => u
  -> Attribute e
calcMode = attr D.CalcMode

xmlBase
  :: forall e u
   . Attr e D.XmlBase u
  => u
  -> Attribute e
xmlBase = attr D.XmlBase

to
  :: forall e u
   . Attr e D.To u
  => u
  -> Attribute e
to = attr D.To

formaction
  :: forall e u
   . Attr e D.Formaction u
  => u
  -> Attribute e
formaction = attr D.Formaction

maskContentUnits
  :: forall e u
   . Attr e D.MaskContentUnits u
  => u
  -> Attribute e
maskContentUnits = attr D.MaskContentUnits

headers
  :: forall e u
   . Attr e D.Headers u
  => u
  -> Attribute e
headers = attr D.Headers

start
  :: forall e u
   . Attr e D.Start u
  => u
  -> Attribute e
start = attr D.Start

srclang
  :: forall e u
   . Attr e D.Srclang u
  => u
  -> Attribute e
srclang = attr D.Srclang

contentScriptType
  :: forall e u
   . Attr e D.ContentScriptType u
  => u
  -> Attribute e
contentScriptType = attr D.ContentScriptType

in_
  :: forall e u
   . Attr e D.In u
  => u
  -> Attribute e
in_ = attr D.In

codebase
  :: forall e u
   . Attr e D.Codebase u
  => u
  -> Attribute e
codebase = attr D.Codebase

side
  :: forall e u
   . Attr e D.Side u
  => u
  -> Attribute e
side = attr D.Side

specularExponent
  :: forall e u
   . Attr e D.SpecularExponent u
  => u
  -> Attribute e
specularExponent = attr D.SpecularExponent

ariaColindex
  :: forall e u
   . Attr e D.AriaColindex u
  => u
  -> Attribute e
ariaColindex = attr D.AriaColindex

xlinkRole
  :: forall e u
   . Attr e D.XlinkRole u
  => u
  -> Attribute e
xlinkRole = attr D.XlinkRole

ariaValuenow
  :: forall e u
   . Attr e D.AriaValuenow u
  => u
  -> Attribute e
ariaValuenow = attr D.AriaValuenow

media
  :: forall e u
   . Attr e D.Media u
  => u
  -> Attribute e
media = attr D.Media

importance
  :: forall e u
   . Attr e D.Importance u
  => u
  -> Attribute e
importance = attr D.Importance

ariaAutocomplete
  :: forall e u
   . Attr e D.AriaAutocomplete u
  => u
  -> Attribute e
ariaAutocomplete = attr D.AriaAutocomplete

spreadMethod
  :: forall e u
   . Attr e D.SpreadMethod u
  => u
  -> Attribute e
spreadMethod = attr D.SpreadMethod

gradientTransform
  :: forall e u
   . Attr e D.GradientTransform u
  => u
  -> Attribute e
gradientTransform = attr D.GradientTransform

fr
  :: forall e u
   . Attr e D.Fr u
  => u
  -> Attribute e
fr = attr D.Fr

ariaPressed
  :: forall e u
   . Attr e D.AriaPressed u
  => u
  -> Attribute e
ariaPressed = attr D.AriaPressed

align
  :: forall e u
   . Attr e D.Align u
  => u
  -> Attribute e
align = attr D.Align

style
  :: forall e u
   . Attr e D.Style u
  => u
  -> Attribute e
style = attr D.Style

glyphOrientationHorizontal
  :: forall e u
   . Attr e D.GlyphOrientationHorizontal u
  => u
  -> Attribute e
glyphOrientationHorizontal = attr D.GlyphOrientationHorizontal

dur
  :: forall e u
   . Attr e D.Dur u
  => u
  -> Attribute e
dur = attr D.Dur

clipPathUnits
  :: forall e u
   . Attr e D.ClipPathUnits u
  => u
  -> Attribute e
clipPathUnits = attr D.ClipPathUnits

filterRes
  :: forall e u
   . Attr e D.FilterRes u
  => u
  -> Attribute e
filterRes = attr D.FilterRes

capture
  :: forall e u
   . Attr e D.Capture u
  => u
  -> Attribute e
capture = attr D.Capture

xChannelSelector
  :: forall e u
   . Attr e D.XChannelSelector u
  => u
  -> Attribute e
xChannelSelector = attr D.XChannelSelector

max
  :: forall e u
   . Attr e D.Max u
  => u
  -> Attribute e
max = attr D.Max

height
  :: forall e u
   . Attr e D.Height u
  => u
  -> Attribute e
height = attr D.Height

ariaMultiline
  :: forall e u
   . Attr e D.AriaMultiline u
  => u
  -> Attribute e
ariaMultiline = attr D.AriaMultiline

kernelUnitLength
  :: forall e u
   . Attr e D.KernelUnitLength u
  => u
  -> Attribute e
kernelUnitLength = attr D.KernelUnitLength

autocapitalize
  :: forall e u
   . Attr e D.Autocapitalize u
  => u
  -> Attribute e
autocapitalize = attr D.Autocapitalize

viewTarget
  :: forall e u
   . Attr e D.ViewTarget u
  => u
  -> Attribute e
viewTarget = attr D.ViewTarget

rx
  :: forall e u
   . Attr e D.Rx u
  => u
  -> Attribute e
rx = attr D.Rx

preload
  :: forall e u
   . Attr e D.Preload u
  => u
  -> Attribute e
preload = attr D.Preload

maxlength
  :: forall e u
   . Attr e D.Maxlength u
  => u
  -> Attribute e
maxlength = attr D.Maxlength

autoReverse
  :: forall e u
   . Attr e D.AutoReverse u
  => u
  -> Attribute e
autoReverse = attr D.AutoReverse

dominantBaseline
  :: forall e u
   . Attr e D.DominantBaseline u
  => u
  -> Attribute e
dominantBaseline = attr D.DominantBaseline

yChannelSelector
  :: forall e u
   . Attr e D.YChannelSelector u
  => u
  -> Attribute e
yChannelSelector = attr D.YChannelSelector

selected
  :: forall e u
   . Attr e D.Selected u
  => u
  -> Attribute e
selected = attr D.Selected

high
  :: forall e u
   . Attr e D.High u
  => u
  -> Attribute e
high = attr D.High

slot
  :: forall e u
   . Attr e D.Slot u
  => u
  -> Attribute e
slot = attr D.Slot

ariaHidden
  :: forall e u
   . Attr e D.AriaHidden u
  => u
  -> Attribute e
ariaHidden = attr D.AriaHidden

challenge
  :: forall e u
   . Attr e D.Challenge u
  => u
  -> Attribute e
challenge = attr D.Challenge

ariaRequired
  :: forall e u
   . Attr e D.AriaRequired u
  => u
  -> Attribute e
ariaRequired = attr D.AriaRequired

enctype
  :: forall e u
   . Attr e D.Enctype u
  => u
  -> Attribute e
enctype = attr D.Enctype

y2
  :: forall e u
   . Attr e D.Y2 u
  => u
  -> Attribute e
y2 = attr D.Y2

letterSpacing
  :: forall e u
   . Attr e D.LetterSpacing u
  => u
  -> Attribute e
letterSpacing = attr D.LetterSpacing

markerStart
  :: forall e u
   . Attr e D.MarkerStart u
  => u
  -> Attribute e
markerStart = attr D.MarkerStart

rotate
  :: forall e u
   . Attr e D.Rotate u
  => u
  -> Attribute e
rotate = attr D.Rotate

ariaPosinset
  :: forall e u
   . Attr e D.AriaPosinset u
  => u
  -> Attribute e
ariaPosinset = attr D.AriaPosinset

ariaDetails
  :: forall e u
   . Attr e D.AriaDetails u
  => u
  -> Attribute e
ariaDetails = attr D.AriaDetails

keyTimes
  :: forall e u
   . Attr e D.KeyTimes u
  => u
  -> Attribute e
keyTimes = attr D.KeyTimes

ariaMultiselectable
  :: forall e u
   . Attr e D.AriaMultiselectable u
  => u
  -> Attribute e
ariaMultiselectable = attr D.AriaMultiselectable

stopColor
  :: forall e u
   . Attr e D.StopColor u
  => u
  -> Attribute e
stopColor = attr D.StopColor

repeatCount
  :: forall e u
   . Attr e D.RepeatCount u
  => u
  -> Attribute e
repeatCount = attr D.RepeatCount

xlinkType
  :: forall e u
   . Attr e D.XlinkType u
  => u
  -> Attribute e
xlinkType = attr D.XlinkType

writingMode
  :: forall e u
   . Attr e D.WritingMode u
  => u
  -> Attribute e
writingMode = attr D.WritingMode

textLength
  :: forall e u
   . Attr e D.TextLength u
  => u
  -> Attribute e
textLength = attr D.TextLength

keyPoints
  :: forall e u
   . Attr e D.KeyPoints u
  => u
  -> Attribute e
keyPoints = attr D.KeyPoints

spacing
  :: forall e u
   . Attr e D.Spacing u
  => u
  -> Attribute e
spacing = attr D.Spacing

display
  :: forall e u
   . Attr e D.Display u
  => u
  -> Attribute e
display = attr D.Display

formmethod
  :: forall e u
   . Attr e D.Formmethod u
  => u
  -> Attribute e
formmethod = attr D.Formmethod

srcdoc
  :: forall e u
   . Attr e D.Srcdoc u
  => u
  -> Attribute e
srcdoc = attr D.Srcdoc

colorProfile
  :: forall e u
   . Attr e D.ColorProfile u
  => u
  -> Attribute e
colorProfile = attr D.ColorProfile

optimum
  :: forall e u
   . Attr e D.Optimum u
  => u
  -> Attribute e
optimum = attr D.Optimum

stroke
  :: forall e u
   . Attr e D.Stroke u
  => u
  -> Attribute e
stroke = attr D.Stroke

xlinkShow
  :: forall e u
   . Attr e D.XlinkShow u
  => u
  -> Attribute e
xlinkShow = attr D.XlinkShow

azimuth
  :: forall e u
   . Attr e D.Azimuth u
  => u
  -> Attribute e
azimuth = attr D.Azimuth

name
  :: forall e u
   . Attr e D.Name u
  => u
  -> Attribute e
name = attr D.Name

wordSpacing
  :: forall e u
   . Attr e D.WordSpacing u
  => u
  -> Attribute e
wordSpacing = attr D.WordSpacing

pointsAtZ
  :: forall e u
   . Attr e D.PointsAtZ u
  => u
  -> Attribute e
pointsAtZ = attr D.PointsAtZ

download
  :: forall e u
   . Attr e D.Download u
  => u
  -> Attribute e
download = attr D.Download

textRendering
  :: forall e u
   . Attr e D.TextRendering u
  => u
  -> Attribute e
textRendering = attr D.TextRendering

reversed
  :: forall e u
   . Attr e D.Reversed u
  => u
  -> Attribute e
reversed = attr D.Reversed

strokeMiterlimit
  :: forall e u
   . Attr e D.StrokeMiterlimit u
  => u
  -> Attribute e
strokeMiterlimit = attr D.StrokeMiterlimit

buffered
  :: forall e u
   . Attr e D.Buffered u
  => u
  -> Attribute e
buffered = attr D.Buffered

ariaSort
  :: forall e u
   . Attr e D.AriaSort u
  => u
  -> Attribute e
ariaSort = attr D.AriaSort

ariaOwns
  :: forall e u
   . Attr e D.AriaOwns u
  => u
  -> Attribute e
ariaOwns = attr D.AriaOwns

requiredExtensions
  :: forall e u
   . Attr e D.RequiredExtensions u
  => u
  -> Attribute e
requiredExtensions = attr D.RequiredExtensions

csp
  :: forall e u
   . Attr e D.Csp u
  => u
  -> Attribute e
csp = attr D.Csp

allow
  :: forall e u
   . Attr e D.Allow u
  => u
  -> Attribute e
allow = attr D.Allow

scope
  :: forall e u
   . Attr e D.Scope u
  => u
  -> Attribute e
scope = attr D.Scope

r
  :: forall e u
   . Attr e D.R u
  => u
  -> Attribute e
r = attr D.R

xlinkActuate
  :: forall e u
   . Attr e D.XlinkActuate u
  => u
  -> Attribute e
xlinkActuate = attr D.XlinkActuate

startOffset
  :: forall e u
   . Attr e D.StartOffset u
  => u
  -> Attribute e
startOffset = attr D.StartOffset

ry
  :: forall e u
   . Attr e D.Ry u
  => u
  -> Attribute e
ry = attr D.Ry

multiple
  :: forall e u
   . Attr e D.Multiple u
  => u
  -> Attribute e
multiple = attr D.Multiple

primitiveUnits
  :: forall e u
   . Attr e D.PrimitiveUnits u
  => u
  -> Attribute e
primitiveUnits = attr D.PrimitiveUnits

sandbox
  :: forall e u
   . Attr e D.Sandbox u
  => u
  -> Attribute e
sandbox = attr D.Sandbox

keytype
  :: forall e u
   . Attr e D.Keytype u
  => u
  -> Attribute e
keytype = attr D.Keytype

stdDeviation
  :: forall e u
   . Attr e D.StdDeviation u
  => u
  -> Attribute e
stdDeviation = attr D.StdDeviation

rowspan
  :: forall e u
   . Attr e D.Rowspan u
  => u
  -> Attribute e
rowspan = attr D.Rowspan

ariaDisabled
  :: forall e u
   . Attr e D.AriaDisabled u
  => u
  -> Attribute e
ariaDisabled = attr D.AriaDisabled

bgcolor
  :: forall e u
   . Attr e D.Bgcolor u
  => u
  -> Attribute e
bgcolor = attr D.Bgcolor

muted
  :: forall e u
   . Attr e D.Muted u
  => u
  -> Attribute e
muted = attr D.Muted

decoding
  :: forall e u
   . Attr e D.Decoding u
  => u
  -> Attribute e
decoding = attr D.Decoding

filterUnits
  :: forall e u
   . Attr e D.FilterUnits u
  => u
  -> Attribute e
filterUnits = attr D.FilterUnits

ariaCurrent
  :: forall e u
   . Attr e D.AriaCurrent u
  => u
  -> Attribute e
ariaCurrent = attr D.AriaCurrent

min
  :: forall e u
   . Attr e D.Min u
  => u
  -> Attribute e
min = attr D.Min

overflow
  :: forall e u
   . Attr e D.Overflow u
  => u
  -> Attribute e
overflow = attr D.Overflow

draggable
  :: forall e u
   . Attr e D.Draggable u
  => u
  -> Attribute e
draggable = attr D.Draggable

pointerEvents
  :: forall e u
   . Attr e D.PointerEvents u
  => u
  -> Attribute e
pointerEvents = attr D.PointerEvents

x2
  :: forall e u
   . Attr e D.X2 u
  => u
  -> Attribute e
x2 = attr D.X2

ariaFlowto
  :: forall e u
   . Attr e D.AriaFlowto u
  => u
  -> Attribute e
ariaFlowto = attr D.AriaFlowto

enableBackground
  :: forall e u
   . Attr e D.EnableBackground u
  => u
  -> Attribute e
enableBackground = attr D.EnableBackground

target
  :: forall e u
   . Attr e D.Target u
  => u
  -> Attribute e
target = attr D.Target

xmlSpace
  :: forall e u
   . Attr e D.XmlSpace u
  => u
  -> Attribute e
xmlSpace = attr D.XmlSpace

contextmenu
  :: forall e u
   . Attr e D.Contextmenu u
  => u
  -> Attribute e
contextmenu = attr D.Contextmenu

src
  :: forall e u
   . Attr e D.Src u
  => u
  -> Attribute e
src = attr D.Src

datetime
  :: forall e u
   . Attr e D.Datetime u
  => u
  -> Attribute e
datetime = attr D.Datetime

ariaLabelledby
  :: forall e u
   . Attr e D.AriaLabelledby u
  => u
  -> Attribute e
ariaLabelledby = attr D.AriaLabelledby

viewBox
  :: forall e u
   . Attr e D.ViewBox u
  => u
  -> Attribute e
viewBox = attr D.ViewBox

hidden
  :: forall e u
   . Attr e D.Hidden u
  => u
  -> Attribute e
hidden = attr D.Hidden

markerHeight
  :: forall e u
   . Attr e D.MarkerHeight u
  => u
  -> Attribute e
markerHeight = attr D.MarkerHeight

systemLanguage
  :: forall e u
   . Attr e D.SystemLanguage u
  => u
  -> Attribute e
systemLanguage = attr D.SystemLanguage

fontFamily
  :: forall e u
   . Attr e D.FontFamily u
  => u
  -> Attribute e
fontFamily = attr D.FontFamily

result
  :: forall e u
   . Attr e D.Result u
  => u
  -> Attribute e
result = attr D.Result

in2
  :: forall e u
   . Attr e D.In2 u
  => u
  -> Attribute e
in2 = attr D.In2

y
  :: forall e u
   . Attr e D.Y u
  => u
  -> Attribute e
y = attr D.Y

language
  :: forall e u
   . Attr e D.Language u
  => u
  -> Attribute e
language = attr D.Language

background
  :: forall e u
   . Attr e D.Background u
  => u
  -> Attribute e
background = attr D.Background

ariaSetsize
  :: forall e u
   . Attr e D.AriaSetsize u
  => u
  -> Attribute e
ariaSetsize = attr D.AriaSetsize

stitchTiles
  :: forall e u
   . Attr e D.StitchTiles u
  => u
  -> Attribute e
stitchTiles = attr D.StitchTiles

specularConstant
  :: forall e u
   . Attr e D.SpecularConstant u
  => u
  -> Attribute e
specularConstant = attr D.SpecularConstant

refX
  :: forall e u
   . Attr e D.RefX u
  => u
  -> Attribute e
refX = attr D.RefX

hreflang
  :: forall e u
   . Attr e D.Hreflang u
  => u
  -> Attribute e
hreflang = attr D.Hreflang

decelerate
  :: forall e u
   . Attr e D.Decelerate u
  => u
  -> Attribute e
decelerate = attr D.Decelerate

clip
  :: forall e u
   . Attr e D.Clip u
  => u
  -> Attribute e
clip = attr D.Clip

targetX
  :: forall e u
   . Attr e D.TargetX u
  => u
  -> Attribute e
targetX = attr D.TargetX

ariaValuemax
  :: forall e u
   . Attr e D.AriaValuemax u
  => u
  -> Attribute e
ariaValuemax = attr D.AriaValuemax

role
  :: forall e u
   . Attr e D.Role u
  => u
  -> Attribute e
role = attr D.Role

action
  :: forall e u
   . Attr e D.Action u
  => u
  -> Attribute e
action = attr D.Action

open
  :: forall e u
   . Attr e D.Open u
  => u
  -> Attribute e
open = attr D.Open

kerning
  :: forall e u
   . Attr e D.Kerning u
  => u
  -> Attribute e
kerning = attr D.Kerning

tableValues
  :: forall e u
   . Attr e D.TableValues u
  => u
  -> Attribute e
tableValues = attr D.TableValues

exponent
  :: forall e u
   . Attr e D.Exponent u
  => u
  -> Attribute e
exponent = attr D.Exponent

step
  :: forall e u
   . Attr e D.Step u
  => u
  -> Attribute e
step = attr D.Step

colorInterpolationFilters
  :: forall e u
   . Attr e D.ColorInterpolationFilters u
  => u
  -> Attribute e
colorInterpolationFilters = attr D.ColorInterpolationFilters

loading
  :: forall e u
   . Attr e D.Loading u
  => u
  -> Attribute e
loading = attr D.Loading

autocomplete
  :: forall e u
   . Attr e D.Autocomplete u
  => u
  -> Attribute e
autocomplete = attr D.Autocomplete

value
  :: forall e u
   . Attr e D.Value u
  => u
  -> Attribute e
value = attr D.Value

ariaLevel
  :: forall e u
   . Attr e D.AriaLevel u
  => u
  -> Attribute e
ariaLevel = attr D.AriaLevel

stopOpacity
  :: forall e u
   . Attr e D.StopOpacity u
  => u
  -> Attribute e
stopOpacity = attr D.StopOpacity

requiredFeatures
  :: forall e u
   . Attr e D.RequiredFeatures u
  => u
  -> Attribute e
requiredFeatures = attr D.RequiredFeatures

code
  :: forall e u
   . Attr e D.Code u
  => u
  -> Attribute e
code = attr D.Code

from
  :: forall e u
   . Attr e D.From u
  => u
  -> Attribute e
from = attr D.From

readonly
  :: forall e u
   . Attr e D.Readonly u
  => u
  -> Attribute e
readonly = attr D.Readonly

for
  :: forall e u
   . Attr e D.For u
  => u
  -> Attribute e
for = attr D.For

numOctaves
  :: forall e u
   . Attr e D.NumOctaves u
  => u
  -> Attribute e
numOctaves = attr D.NumOctaves

kernelMatrix
  :: forall e u
   . Attr e D.KernelMatrix u
  => u
  -> Attribute e
kernelMatrix = attr D.KernelMatrix

cols
  :: forall e u
   . Attr e D.Cols u
  => u
  -> Attribute e
cols = attr D.Cols

path
  :: forall e u
   . Attr e D.Path u
  => u
  -> Attribute e
path = attr D.Path

loop
  :: forall e u
   . Attr e D.Loop u
  => u
  -> Attribute e
loop = attr D.Loop

amplitude
  :: forall e u
   . Attr e D.Amplitude u
  => u
  -> Attribute e
amplitude = attr D.Amplitude

content
  :: forall e u
   . Attr e D.Content u
  => u
  -> Attribute e
content = attr D.Content

xtype
  :: forall e u
   . Attr e D.Xtype u
  => u
  -> Attribute e
xtype = attr D.Xtype

end
  :: forall e u
   . Attr e D.End u
  => u
  -> Attribute e
end = attr D.End

floodOpacity
  :: forall e u
   . Attr e D.FloodOpacity u
  => u
  -> Attribute e
floodOpacity = attr D.FloodOpacity

ariaColspan
  :: forall e u
   . Attr e D.AriaColspan u
  => u
  -> Attribute e
ariaColspan = attr D.AriaColspan

cursor
  :: forall e u
   . Attr e D.Cursor u
  => u
  -> Attribute e
cursor = attr D.Cursor

filter
  :: forall e u
   . Attr e D.Filter u
  => u
  -> Attribute e
filter = attr D.Filter

shapeRendering
  :: forall e u
   . Attr e D.ShapeRendering u
  => u
  -> Attribute e
shapeRendering = attr D.ShapeRendering

targetY
  :: forall e u
   . Attr e D.TargetY u
  => u
  -> Attribute e
targetY = attr D.TargetY

color
  :: forall e u
   . Attr e D.Color u
  => u
  -> Attribute e
color = attr D.Color

summary
  :: forall e u
   . Attr e D.Summary u
  => u
  -> Attribute e
summary = attr D.Summary

fontSizeAdjust
  :: forall e u
   . Attr e D.FontSizeAdjust u
  => u
  -> Attribute e
fontSizeAdjust = attr D.FontSizeAdjust

intercept
  :: forall e u
   . Attr e D.Intercept u
  => u
  -> Attribute e
intercept = attr D.Intercept

refY
  :: forall e u
   . Attr e D.RefY u
  => u
  -> Attribute e
refY = attr D.RefY

shape
  :: forall e u
   . Attr e D.Shape u
  => u
  -> Attribute e
shape = attr D.Shape

ariaValuemin
  :: forall e u
   . Attr e D.AriaValuemin u
  => u
  -> Attribute e
ariaValuemin = attr D.AriaValuemin

markerEnd
  :: forall e u
   . Attr e D.MarkerEnd u
  => u
  -> Attribute e
markerEnd = attr D.MarkerEnd

translate
  :: forall e u
   . Attr e D.Translate u
  => u
  -> Attribute e
translate = attr D.Translate

itemprop
  :: forall e u
   . Attr e D.Itemprop u
  => u
  -> Attribute e
itemprop = attr D.Itemprop

checked
  :: forall e u
   . Attr e D.Checked u
  => u
  -> Attribute e
checked = attr D.Checked

scale
  :: forall e u
   . Attr e D.Scale u
  => u
  -> Attribute e
scale = attr D.Scale

width
  :: forall e u
   . Attr e D.Width u
  => u
  -> Attribute e
width = attr D.Width

dir
  :: forall e u
   . Attr e D.Dir u
  => u
  -> Attribute e
dir = attr D.Dir

patternTransform
  :: forall e u
   . Attr e D.PatternTransform u
  => u
  -> Attribute e
patternTransform = attr D.PatternTransform

intrinsicsize
  :: forall e u
   . Attr e D.Intrinsicsize u
  => u
  -> Attribute e
intrinsicsize = attr D.Intrinsicsize

x
  :: forall e u
   . Attr e D.X u
  => u
  -> Attribute e
x = attr D.X

divisor
  :: forall e u
   . Attr e D.Divisor u
  => u
  -> Attribute e
divisor = attr D.Divisor

direction
  :: forall e u
   . Attr e D.Direction u
  => u
  -> Attribute e
direction = attr D.Direction

ariaModal
  :: forall e u
   . Attr e D.AriaModal u
  => u
  -> Attribute e
ariaModal = attr D.AriaModal

href
  :: forall e u
   . Attr e D.Href u
  => u
  -> Attribute e
href = attr D.Href

version
  :: forall e u
   . Attr e D.Version u
  => u
  -> Attribute e
version = attr D.Version

begin
  :: forall e u
   . Attr e D.Begin u
  => u
  -> Attribute e
begin = attr D.Begin

elevation
  :: forall e u
   . Attr e D.Elevation u
  => u
  -> Attribute e
elevation = attr D.Elevation

markerMid
  :: forall e u
   . Attr e D.MarkerMid u
  => u
  -> Attribute e
markerMid = attr D.MarkerMid

k1
  :: forall e u
   . Attr e D.K1 u
  => u
  -> Attribute e
k1 = attr D.K1

fontSize
  :: forall e u
   . Attr e D.FontSize u
  => u
  -> Attribute e
fontSize = attr D.FontSize

attributeName
  :: forall e u
   . Attr e D.AttributeName u
  => u
  -> Attribute e
attributeName = attr D.AttributeName

ariaKeyshortcuts
  :: forall e u
   . Attr e D.AriaKeyshortcuts u
  => u
  -> Attribute e
ariaKeyshortcuts = attr D.AriaKeyshortcuts

ariaAtomic
  :: forall e u
   . Attr e D.AriaAtomic u
  => u
  -> Attribute e
ariaAtomic = attr D.AriaAtomic

opacity
  :: forall e u
   . Attr e D.Opacity u
  => u
  -> Attribute e
opacity = attr D.Opacity

strokeLinecap
  :: forall e u
   . Attr e D.StrokeLinecap u
  => u
  -> Attribute e
strokeLinecap = attr D.StrokeLinecap

repeatDur
  :: forall e u
   . Attr e D.RepeatDur u
  => u
  -> Attribute e
repeatDur = attr D.RepeatDur

referrerpolicy
  :: forall e u
   . Attr e D.Referrerpolicy u
  => u
  -> Attribute e
referrerpolicy = attr D.Referrerpolicy

unicodeBidi
  :: forall e u
   . Attr e D.UnicodeBidi u
  => u
  -> Attribute e
unicodeBidi = attr D.UnicodeBidi

transformOrigin
  :: forall e u
   . Attr e D.TransformOrigin u
  => u
  -> Attribute e
transformOrigin = attr D.TransformOrigin

diffuseConstant
  :: forall e u
   . Attr e D.DiffuseConstant u
  => u
  -> Attribute e
diffuseConstant = attr D.DiffuseConstant

controls
  :: forall e u
   . Attr e D.Controls u
  => u
  -> Attribute e
controls = attr D.Controls

autoplay
  :: forall e u
   . Attr e D.Autoplay u
  => u
  -> Attribute e
autoplay = attr D.Autoplay

span
  :: forall e u
   . Attr e D.Span u
  => u
  -> Attribute e
span = attr D.Span

enterkeyhint
  :: forall e u
   . Attr e D.Enterkeyhint u
  => u
  -> Attribute e
enterkeyhint = attr D.Enterkeyhint

contenteditable
  :: forall e u
   . Attr e D.Contenteditable u
  => u
  -> Attribute e
contenteditable = attr D.Contenteditable
