module Deku.DOM.Attr.Amplitude where

import Prelude

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Amplitude = Amplitude

instance Attr FeFuncA_ Amplitude String where
  attr Amplitude value = unsafeAttribute
    { key: "amplitude", value: prop' value }

instance Attr FeFuncB_ Amplitude String where
  attr Amplitude value = unsafeAttribute
    { key: "amplitude", value: prop' value }

instance Attr FeFuncG_ Amplitude String where
  attr Amplitude value = unsafeAttribute
    { key: "amplitude", value: prop' value }

instance Attr FeFuncR_ Amplitude String where
  attr Amplitude value = unsafeAttribute
    { key: "amplitude", value: prop' value }

instance Attr everything Amplitude Unit where
  attr Amplitude _ = unsafeAttribute
    { key: "amplitude", value: unset' }
