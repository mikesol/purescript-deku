module Deku.DOM.Attr.OnDblclick where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDblclick = OnDblclick

instance Attr anything OnDblclick Cb where
  attr OnDblclick value = unsafeAttribute { key: "dblclick", value: cb' value }

instance Attr anything OnDblclick (Effect Unit) where
  attr OnDblclick value = unsafeAttribute
    { key: "dblclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDblclick (Effect Boolean) where
  attr OnDblclick value = unsafeAttribute
    { key: "dblclick", value: cb' (Cb (const value)) }

type OnDblclickEffect =
  forall element
   . Attr element OnDblclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDblclick Unit where
  attr OnDblclick _ = unsafeAttribute
    { key: "dblclick", value: unset' }
