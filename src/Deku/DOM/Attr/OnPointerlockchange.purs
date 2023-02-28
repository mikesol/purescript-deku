module Deku.DOM.Attr.OnPointerlockchange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange Cb where
  attr OnPointerlockchange value = unsafeAttribute
    { key: "pointerlockchange ", value: cb' value }

instance Attr anything OnPointerlockchange (Effect Unit) where
  attr OnPointerlockchange value = unsafeAttribute
    { key: "pointerlockchange ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockchange (Effect Boolean) where
  attr OnPointerlockchange value = unsafeAttribute
    { key: "pointerlockchange ", value: cb' (Cb (const value)) }

type OnPointerlockchangeEffect =
  forall element
   . Attr element OnPointerlockchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockchange Unit where
  attr OnPointerlockchange _ = unsafeAttribute
    { key: "pointerlockchange ", value: unset' }
