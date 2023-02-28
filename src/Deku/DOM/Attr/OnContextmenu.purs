module Deku.DOM.Attr.OnContextmenu where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnContextmenu = OnContextmenu

instance Attr anything OnContextmenu Cb where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' value }

instance Attr anything OnContextmenu (Effect Unit) where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnContextmenu (Effect Boolean) where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' (Cb (const value)) }

type OnContextmenuEffect =
  forall element
   . Attr element OnContextmenu (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnContextmenu Unit where
  attr OnContextmenu _ = unsafeAttribute
    { key: "contextmenu", value: unset' }
