module Deku.DOM.Attr.OnSubmit where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSubmit = OnSubmit

instance Attr anything OnSubmit Cb where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' value }

instance Attr anything OnSubmit (Effect Unit) where
  attr OnSubmit value = unsafeAttribute
    { key: "submit", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSubmit (Effect Boolean) where
  attr OnSubmit value = unsafeAttribute
    { key: "submit", value: cb' (Cb (const value)) }

type OnSubmitEffect =
  forall element
   . Attr element OnSubmit (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSubmit Unit where
  attr OnSubmit _ = unsafeAttribute
    { key: "submit", value: unset' }
