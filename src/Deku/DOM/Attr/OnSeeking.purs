module Deku.DOM.Attr.OnSeeking where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSeeking = OnSeeking
instance Attr anything OnSeeking Cb where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' value }