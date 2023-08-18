-- | This module has been automatically generated by running `spago run -p codegen`.
-- | Any changes may be overwritten.
module Deku.DOM.MathML.Attributes
  ( module Combinators
  , encoding
  , encoding_
  , selection
  , selection_
  , actiontype
  , actiontype_
  , accentunder
  , accentunder_
  , accent
  , accent_
  , voffset
  , voffset_
  , lspace
  , lspace_
  , depth
  , depth_
  , height
  , height_
  , width
  , width_
  , linethickness
  , linethickness_
  , maxsize
  , maxsize_
  , minsize
  , minsize_
  , rspace
  , rspace_
  , movablelimits
  , movablelimits_
  , largeop
  , largeop_
  , symmetric
  , symmetric_
  , stretchy
  , stretchy_
  , form
  , form_
  , separator
  , separator_
  , fence
  , fence_
  , alttext
  , alttext_
  , display
  , display_
  ) where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Functor (map) as Functor
import FRP.Event as FRP.Event
import Deku.DOM.Combinators (unset) as Combinators
import Deku.Attribute as Deku.Attribute

encoding
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (encoding :: String | r))
encoding = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "encoding", value: _ } <<< Deku.Attribute.prop')

encoding_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (encoding :: String | r))
encoding_ = encoding <<< Applicative.pure

selection
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (selection :: String | r))
selection = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "selection", value: _ } <<< Deku.Attribute.prop')

selection_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (selection :: String | r))
selection_ = selection <<< Applicative.pure

actiontype
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (actiontype :: String | r))
actiontype = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "actiontype", value: _ } <<< Deku.Attribute.prop')

actiontype_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (actiontype :: String | r))
actiontype_ = actiontype <<< Applicative.pure

accentunder
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (accentunder :: String | r))
accentunder = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "accentunder", value: _ } <<< Deku.Attribute.prop')

accentunder_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (accentunder :: String | r))
accentunder_ = accentunder <<< Applicative.pure

accent
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (accent :: String | r))
accent = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "accent", value: _ } <<< Deku.Attribute.prop')

accent_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (accent :: String | r))
accent_ = accent <<< Applicative.pure

voffset
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (voffset :: String | r))
voffset = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "voffset", value: _ } <<< Deku.Attribute.prop')

voffset_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (voffset :: String | r))
voffset_ = voffset <<< Applicative.pure

lspace
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (lspace :: String | r))
lspace = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "lspace", value: _ } <<< Deku.Attribute.prop')

lspace_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (lspace :: String | r))
lspace_ = lspace <<< Applicative.pure

depth
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (depth :: String | r))
depth = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "depth", value: _ } <<< Deku.Attribute.prop')

depth_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (depth :: String | r))
depth_ = depth <<< Applicative.pure

height
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (height :: String | r))
height = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop')

height_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (height :: String | r))
height_ = height <<< Applicative.pure

width
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (width :: String | r))
width = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop')

width_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (width :: String | r))
width_ = width <<< Applicative.pure

linethickness
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (linethickness :: String | r))
linethickness = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "linethickness", value: _ } <<< Deku.Attribute.prop')

linethickness_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (linethickness :: String | r))
linethickness_ = linethickness <<< Applicative.pure

maxsize
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (maxsize :: String | r))
maxsize = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "maxsize", value: _ } <<< Deku.Attribute.prop')

maxsize_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (maxsize :: String | r))
maxsize_ = maxsize <<< Applicative.pure

minsize
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (minsize :: String | r))
minsize = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "minsize", value: _ } <<< Deku.Attribute.prop')

minsize_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (minsize :: String | r))
minsize_ = minsize <<< Applicative.pure

rspace
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (rspace :: String | r))
rspace = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "rspace", value: _ } <<< Deku.Attribute.prop')

rspace_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (rspace :: String | r))
rspace_ = rspace <<< Applicative.pure

movablelimits
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (movablelimits :: String | r))
movablelimits = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "movablelimits", value: _ } <<< Deku.Attribute.prop')

movablelimits_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (movablelimits :: String | r))
movablelimits_ = movablelimits <<< Applicative.pure

largeop
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (largeop :: String | r))
largeop = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "largeop", value: _ } <<< Deku.Attribute.prop')

largeop_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (largeop :: String | r))
largeop_ = largeop <<< Applicative.pure

symmetric
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (symmetric :: String | r))
symmetric = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "symmetric", value: _ } <<< Deku.Attribute.prop')

symmetric_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (symmetric :: String | r))
symmetric_ = symmetric <<< Applicative.pure

stretchy
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (stretchy :: String | r))
stretchy = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "stretchy", value: _ } <<< Deku.Attribute.prop')

stretchy_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (stretchy :: String | r))
stretchy_ = stretchy <<< Applicative.pure

form
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (form :: String | r))
form = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop')

form_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (form :: String | r))
form_ = form <<< Applicative.pure

separator
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (separator :: String | r))
separator = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "separator", value: _ } <<< Deku.Attribute.prop')

separator_
  :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (separator :: String | r))
separator_ = separator <<< Applicative.pure

fence
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (fence :: String | r))
fence = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "fence", value: _ } <<< Deku.Attribute.prop')

fence_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (fence :: String | r))
fence_ = fence <<< Applicative.pure

alttext
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (alttext :: String | r))
alttext = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "alttext", value: _ } <<< Deku.Attribute.prop')

alttext_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (alttext :: String | r))
alttext_ = alttext <<< Applicative.pure

display
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (display :: String | r))
display = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "display", value: _ } <<< Deku.Attribute.prop')

display_ :: forall r. String -> FRP.Event.Event (Deku.Attribute.Attribute (display :: String | r))
display_ = display <<< Applicative.pure
