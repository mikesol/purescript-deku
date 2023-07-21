module Deku.DOM.Indexed.MathML where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Functor (map) as Functor
import Deku.Attribute (Attribute, AttributeValue, unsafeAttribute)
import Deku.Control (elementify2)
import Deku.Core (Nut)
import FRP.Event (Event)
import Type.Proxy (Proxy)
import Deku.DOM.Indexed.Index (Indexed, Keyword(..))
import Deku.DOM.Indexed (Global, GlobalEventHandlers, ARIAMixin)
import Deku.Attribute as Deku.Attribute

type MathMLMathElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMathElement"
  , alttext :: String
  , display :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMtextElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMtextElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMiElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMiElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMnElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMnElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMoElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMoElement"
  , maxsize :: String
  , minsize :: String
  , rspace :: String
  , lspace :: String
  , movablelimits :: String
  , largeop :: String
  , symmetric :: String
  , stretchy :: String
  , form :: String
  , separator :: String
  , fence :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMspaceElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMspaceElement"
  , depth :: String
  , height :: String
  , width :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMsElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMsElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMrowElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMrowElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMfracElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMfracElement"
  , linethickness :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMsqrtElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMsqrtElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMrootElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMrootElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMstyleElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMstyleElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMerrorElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMerrorElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMpaddedElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMpaddedElement"
  , voffset :: String
  , lspace :: String
  , depth :: String
  , height :: String
  , width :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMphantomElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMphantomElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMsubElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMsubElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMsupElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMsupElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMsubsupElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMsubsupElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMunderElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMunderElement"
  , accentunder :: String
  , accent :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMoverElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMoverElement"
  , accentunder :: String
  , accent :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMunderoverElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMunderoverElement"
  , accentunder :: String
  , accent :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLMmultiscriptsElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMmultiscriptsElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMprescriptsElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMprescriptsElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMtableElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMtableElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMtrElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMtrElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMtdElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLMtdElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLMactionElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLMactionElement"
  , selection :: String
  , actiontype :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLSemanticsElement (r :: Row Type) =
  (__nominal :: Proxy "MathMLSemanticsElement" | ARIAMixin (GlobalEventHandlers (Global r)))

type MathMLAnnotationElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLAnnotationElement"
  , encoding :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

type MathMLAnnotationXmlElement (r :: Row Type) =
  ( __nominal :: Proxy "MathMLAnnotationXmlElement"
  , encoding :: String
  | ARIAMixin (GlobalEventHandlers (Global r))
  )

math :: Array (Event (Attribute (Indexed (MathMLMathElement ())))) -> Array Nut -> Nut
math = elementify2 {- http://www.w3.org/1998/Math/MathML -} "math"

math_ :: Array Nut -> Nut
math_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "math" []

mtext :: Array (Event (Attribute (Indexed (MathMLMtextElement ())))) -> Array Nut -> Nut
mtext = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtext"

mtext_ :: Array Nut -> Nut
mtext_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtext" []

mi :: Array (Event (Attribute (Indexed (MathMLMiElement ())))) -> Array Nut -> Nut
mi = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mi"

mi_ :: Array Nut -> Nut
mi_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mi" []

mn :: Array (Event (Attribute (Indexed (MathMLMnElement ())))) -> Array Nut -> Nut
mn = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mn"

mn_ :: Array Nut -> Nut
mn_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mn" []

mo :: Array (Event (Attribute (Indexed (MathMLMoElement ())))) -> Array Nut -> Nut
mo = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mo"

mo_ :: Array Nut -> Nut
mo_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mo" []

mspace :: Array (Event (Attribute (Indexed (MathMLMspaceElement ())))) -> Array Nut -> Nut
mspace = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mspace"

mspace_ :: Array Nut -> Nut
mspace_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mspace" []

ms :: Array (Event (Attribute (Indexed (MathMLMsElement ())))) -> Array Nut -> Nut
ms = elementify2 {- http://www.w3.org/1998/Math/MathML -} "ms"

ms_ :: Array Nut -> Nut
ms_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "ms" []

mrow :: Array (Event (Attribute (Indexed (MathMLMrowElement ())))) -> Array Nut -> Nut
mrow = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mrow"

mrow_ :: Array Nut -> Nut
mrow_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mrow" []

mfrac :: Array (Event (Attribute (Indexed (MathMLMfracElement ())))) -> Array Nut -> Nut
mfrac = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mfrac"

mfrac_ :: Array Nut -> Nut
mfrac_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mfrac" []

msqrt :: Array (Event (Attribute (Indexed (MathMLMsqrtElement ())))) -> Array Nut -> Nut
msqrt = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msqrt"

msqrt_ :: Array Nut -> Nut
msqrt_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msqrt" []

mroot :: Array (Event (Attribute (Indexed (MathMLMrootElement ())))) -> Array Nut -> Nut
mroot = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mroot"

mroot_ :: Array Nut -> Nut
mroot_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mroot" []

mstyle :: Array (Event (Attribute (Indexed (MathMLMstyleElement ())))) -> Array Nut -> Nut
mstyle = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mstyle"

mstyle_ :: Array Nut -> Nut
mstyle_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mstyle" []

merror :: Array (Event (Attribute (Indexed (MathMLMerrorElement ())))) -> Array Nut -> Nut
merror = elementify2 {- http://www.w3.org/1998/Math/MathML -} "merror"

merror_ :: Array Nut -> Nut
merror_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "merror" []

mpadded :: Array (Event (Attribute (Indexed (MathMLMpaddedElement ())))) -> Array Nut -> Nut
mpadded = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mpadded"

mpadded_ :: Array Nut -> Nut
mpadded_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mpadded" []

mphantom :: Array (Event (Attribute (Indexed (MathMLMphantomElement ())))) -> Array Nut -> Nut
mphantom = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mphantom"

mphantom_ :: Array Nut -> Nut
mphantom_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mphantom" []

msub :: Array (Event (Attribute (Indexed (MathMLMsubElement ())))) -> Array Nut -> Nut
msub = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msub"

msub_ :: Array Nut -> Nut
msub_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msub" []

msup :: Array (Event (Attribute (Indexed (MathMLMsupElement ())))) -> Array Nut -> Nut
msup = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msup"

msup_ :: Array Nut -> Nut
msup_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msup" []

msubsup :: Array (Event (Attribute (Indexed (MathMLMsubsupElement ())))) -> Array Nut -> Nut
msubsup = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msubsup"

msubsup_ :: Array Nut -> Nut
msubsup_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "msubsup" []

munder :: Array (Event (Attribute (Indexed (MathMLMunderElement ())))) -> Array Nut -> Nut
munder = elementify2 {- http://www.w3.org/1998/Math/MathML -} "munder"

munder_ :: Array Nut -> Nut
munder_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "munder" []

mover :: Array (Event (Attribute (Indexed (MathMLMoverElement ())))) -> Array Nut -> Nut
mover = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mover"

mover_ :: Array Nut -> Nut
mover_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mover" []

munderover :: Array (Event (Attribute (Indexed (MathMLMunderoverElement ())))) -> Array Nut -> Nut
munderover = elementify2 {- http://www.w3.org/1998/Math/MathML -} "munderover"

munderover_ :: Array Nut -> Nut
munderover_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "munderover" []

mmultiscripts
  :: Array (Event (Attribute (Indexed (MathMLMmultiscriptsElement ())))) -> Array Nut -> Nut
mmultiscripts = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mmultiscripts"

mmultiscripts_ :: Array Nut -> Nut
mmultiscripts_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mmultiscripts" []

mprescripts
  :: Array (Event (Attribute (Indexed (MathMLMprescriptsElement ())))) -> Array Nut -> Nut
mprescripts = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mprescripts"

mprescripts_ :: Array Nut -> Nut
mprescripts_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mprescripts" []

mtable :: Array (Event (Attribute (Indexed (MathMLMtableElement ())))) -> Array Nut -> Nut
mtable = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtable"

mtable_ :: Array Nut -> Nut
mtable_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtable" []

mtr :: Array (Event (Attribute (Indexed (MathMLMtrElement ())))) -> Array Nut -> Nut
mtr = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtr"

mtr_ :: Array Nut -> Nut
mtr_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtr" []

mtd :: Array (Event (Attribute (Indexed (MathMLMtdElement ())))) -> Array Nut -> Nut
mtd = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtd"

mtd_ :: Array Nut -> Nut
mtd_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "mtd" []

maction :: Array (Event (Attribute (Indexed (MathMLMactionElement ())))) -> Array Nut -> Nut
maction = elementify2 {- http://www.w3.org/1998/Math/MathML -} "maction"

maction_ :: Array Nut -> Nut
maction_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "maction" []

semantics :: Array (Event (Attribute (Indexed (MathMLSemanticsElement ())))) -> Array Nut -> Nut
semantics = elementify2 {- http://www.w3.org/1998/Math/MathML -} "semantics"

semantics_ :: Array Nut -> Nut
semantics_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "semantics" []

annotation :: Array (Event (Attribute (Indexed (MathMLAnnotationElement ())))) -> Array Nut -> Nut
annotation = elementify2 {- http://www.w3.org/1998/Math/MathML -} "annotation"

annotation_ :: Array Nut -> Nut
annotation_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "annotation" []

annotationXml
  :: Array (Event (Attribute (Indexed (MathMLAnnotationXmlElement ())))) -> Array Nut -> Nut
annotationXml = elementify2 {- http://www.w3.org/1998/Math/MathML -} "annotation-xml"

annotationXml_ :: Array Nut -> Nut
annotationXml_ = elementify2 {- http://www.w3.org/1998/Math/MathML -} "annotation-xml" []

_alttext :: forall r. Event String -> Event (Attribute (Indexed (alttext :: String | r)))
_alttext = Functor.map (unsafeAttribute <<< { key: "alttext", value: _ } <<< Deku.Attribute.prop')

_alttext_ :: forall r. String -> Event (Attribute (Indexed (alttext :: String | r)))
_alttext_ = _alttext <<< Applicative.pure

_display :: forall r. Event String -> Event (Attribute (Indexed (display :: String | r)))
_display = Functor.map (unsafeAttribute <<< { key: "display", value: _ } <<< Deku.Attribute.prop')

_display_ :: forall r. String -> Event (Attribute (Indexed (display :: String | r)))
_display_ = _display <<< Applicative.pure

_maxsize :: forall r. Event String -> Event (Attribute (Indexed (maxsize :: String | r)))
_maxsize = Functor.map (unsafeAttribute <<< { key: "maxsize", value: _ } <<< Deku.Attribute.prop')

_maxsize_ :: forall r. String -> Event (Attribute (Indexed (maxsize :: String | r)))
_maxsize_ = _maxsize <<< Applicative.pure

_minsize :: forall r. Event String -> Event (Attribute (Indexed (minsize :: String | r)))
_minsize = Functor.map (unsafeAttribute <<< { key: "minsize", value: _ } <<< Deku.Attribute.prop')

_minsize_ :: forall r. String -> Event (Attribute (Indexed (minsize :: String | r)))
_minsize_ = _minsize <<< Applicative.pure

_rspace :: forall r. Event String -> Event (Attribute (Indexed (rspace :: String | r)))
_rspace = Functor.map (unsafeAttribute <<< { key: "rspace", value: _ } <<< Deku.Attribute.prop')

_rspace_ :: forall r. String -> Event (Attribute (Indexed (rspace :: String | r)))
_rspace_ = _rspace <<< Applicative.pure

_lspace :: forall r. Event String -> Event (Attribute (Indexed (lspace :: String | r)))
_lspace = Functor.map (unsafeAttribute <<< { key: "lspace", value: _ } <<< Deku.Attribute.prop')

_lspace_ :: forall r. String -> Event (Attribute (Indexed (lspace :: String | r)))
_lspace_ = _lspace <<< Applicative.pure

_movablelimits
  :: forall r. Event String -> Event (Attribute (Indexed (movablelimits :: String | r)))
_movablelimits = Functor.map
  (unsafeAttribute <<< { key: "movablelimits", value: _ } <<< Deku.Attribute.prop')

_movablelimits_ :: forall r. String -> Event (Attribute (Indexed (movablelimits :: String | r)))
_movablelimits_ = _movablelimits <<< Applicative.pure

_largeop :: forall r. Event String -> Event (Attribute (Indexed (largeop :: String | r)))
_largeop = Functor.map (unsafeAttribute <<< { key: "largeop", value: _ } <<< Deku.Attribute.prop')

_largeop_ :: forall r. String -> Event (Attribute (Indexed (largeop :: String | r)))
_largeop_ = _largeop <<< Applicative.pure

_symmetric :: forall r. Event String -> Event (Attribute (Indexed (symmetric :: String | r)))
_symmetric = Functor.map
  (unsafeAttribute <<< { key: "symmetric", value: _ } <<< Deku.Attribute.prop')

_symmetric_ :: forall r. String -> Event (Attribute (Indexed (symmetric :: String | r)))
_symmetric_ = _symmetric <<< Applicative.pure

_stretchy :: forall r. Event String -> Event (Attribute (Indexed (stretchy :: String | r)))
_stretchy = Functor.map
  (unsafeAttribute <<< { key: "stretchy", value: _ } <<< Deku.Attribute.prop')

_stretchy_ :: forall r. String -> Event (Attribute (Indexed (stretchy :: String | r)))
_stretchy_ = _stretchy <<< Applicative.pure

_form :: forall r. Event String -> Event (Attribute (Indexed (form :: String | r)))
_form = Functor.map (unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop')

_form_ :: forall r. String -> Event (Attribute (Indexed (form :: String | r)))
_form_ = _form <<< Applicative.pure

_separator :: forall r. Event String -> Event (Attribute (Indexed (separator :: String | r)))
_separator = Functor.map
  (unsafeAttribute <<< { key: "separator", value: _ } <<< Deku.Attribute.prop')

_separator_ :: forall r. String -> Event (Attribute (Indexed (separator :: String | r)))
_separator_ = _separator <<< Applicative.pure

_fence :: forall r. Event String -> Event (Attribute (Indexed (fence :: String | r)))
_fence = Functor.map (unsafeAttribute <<< { key: "fence", value: _ } <<< Deku.Attribute.prop')

_fence_ :: forall r. String -> Event (Attribute (Indexed (fence :: String | r)))
_fence_ = _fence <<< Applicative.pure

_depth :: forall r. Event String -> Event (Attribute (Indexed (depth :: String | r)))
_depth = Functor.map (unsafeAttribute <<< { key: "depth", value: _ } <<< Deku.Attribute.prop')

_depth_ :: forall r. String -> Event (Attribute (Indexed (depth :: String | r)))
_depth_ = _depth <<< Applicative.pure

_height :: forall r. Event String -> Event (Attribute (Indexed (height :: String | r)))
_height = Functor.map (unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop')

_height_ :: forall r. String -> Event (Attribute (Indexed (height :: String | r)))
_height_ = _height <<< Applicative.pure

_width :: forall r. Event String -> Event (Attribute (Indexed (width :: String | r)))
_width = Functor.map (unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop')

_width_ :: forall r. String -> Event (Attribute (Indexed (width :: String | r)))
_width_ = _width <<< Applicative.pure

_linethickness
  :: forall r. Event String -> Event (Attribute (Indexed (linethickness :: String | r)))
_linethickness = Functor.map
  (unsafeAttribute <<< { key: "linethickness", value: _ } <<< Deku.Attribute.prop')

_linethickness_ :: forall r. String -> Event (Attribute (Indexed (linethickness :: String | r)))
_linethickness_ = _linethickness <<< Applicative.pure

_voffset :: forall r. Event String -> Event (Attribute (Indexed (voffset :: String | r)))
_voffset = Functor.map (unsafeAttribute <<< { key: "voffset", value: _ } <<< Deku.Attribute.prop')

_voffset_ :: forall r. String -> Event (Attribute (Indexed (voffset :: String | r)))
_voffset_ = _voffset <<< Applicative.pure

_accentunder :: forall r. Event String -> Event (Attribute (Indexed (accentunder :: String | r)))
_accentunder = Functor.map
  (unsafeAttribute <<< { key: "accentunder", value: _ } <<< Deku.Attribute.prop')

_accentunder_ :: forall r. String -> Event (Attribute (Indexed (accentunder :: String | r)))
_accentunder_ = _accentunder <<< Applicative.pure

_accent :: forall r. Event String -> Event (Attribute (Indexed (accent :: String | r)))
_accent = Functor.map (unsafeAttribute <<< { key: "accent", value: _ } <<< Deku.Attribute.prop')

_accent_ :: forall r. String -> Event (Attribute (Indexed (accent :: String | r)))
_accent_ = _accent <<< Applicative.pure

_selection :: forall r. Event String -> Event (Attribute (Indexed (selection :: String | r)))
_selection = Functor.map
  (unsafeAttribute <<< { key: "selection", value: _ } <<< Deku.Attribute.prop')

_selection_ :: forall r. String -> Event (Attribute (Indexed (selection :: String | r)))
_selection_ = _selection <<< Applicative.pure

_actiontype :: forall r. Event String -> Event (Attribute (Indexed (actiontype :: String | r)))
_actiontype = Functor.map
  (unsafeAttribute <<< { key: "actiontype", value: _ } <<< Deku.Attribute.prop')

_actiontype_ :: forall r. String -> Event (Attribute (Indexed (actiontype :: String | r)))
_actiontype_ = _actiontype <<< Applicative.pure

_encoding :: forall r. Event String -> Event (Attribute (Indexed (encoding :: String | r)))
_encoding = Functor.map
  (unsafeAttribute <<< { key: "encoding", value: _ } <<< Deku.Attribute.prop')

_encoding_ :: forall r. String -> Event (Attribute (Indexed (encoding :: String | r)))
_encoding_ = _encoding <<< Applicative.pure
