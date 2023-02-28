module Deku.DOM.Attr.OnAuxclick where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick Cb where
  attr OnAuxclick value = unsafeAttribute { key: "auxclick ", value: cb' value }

instance Attr anything OnAuxclick (Effect Unit) where
  attr OnAuxclick value = unsafeAttribute
    { key: "auxclick ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (Effect Boolean) where
  attr OnAuxclick value = unsafeAttribute
    { key: "auxclick ", value: cb' (Cb (const value)) }

type OnAuxclickEffect =
  forall element
   . Attr element OnAuxclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAuxclick Unit where
  attr OnAuxclick _ = unsafeAttribute
    { key: "auxclick ", value: unset' }
