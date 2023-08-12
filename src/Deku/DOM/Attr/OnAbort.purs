module Deku.DOM.Attr.OnAbort where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAbort = OnAbort

instance Attr anything OnAbort Cb where
  attr OnAbort value = unsafeAttribute { key: "abort", value: cb' value }

instance Attr anything OnAbort (Effect Unit) where
  attr OnAbort value = unsafeAttribute
    { key: "abort", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAbort (Effect Boolean) where
  attr OnAbort value = unsafeAttribute
    { key: "abort", value: cb' (Cb (const value)) }

type OnAbortEffect =
  forall element
   . Attr element OnAbort (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAbort Unit where
  attr OnAbort _ = unsafeAttribute
    { key: "abort", value: unset' }
