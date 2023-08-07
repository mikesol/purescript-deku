module Deku.DOM.Attr.OnClick where

import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnClick = OnClick

instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute
    ( { key: "click", value: cb' value } <$ _
    )

instance Attr anything OnClick (Event.Event Cb) where
  attr OnClick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "click", value: cb' value }

instance Attr anything OnClick (Effect Unit) where
  attr OnClick value = unsafeAttribute
    ( { key: "click", value: cb' (Cb (const (value $> true))) } <$ _
    )

instance Attr anything OnClick (Event.Event (Effect Unit)) where
  attr OnClick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (Effect Boolean) where
  attr OnClick value = unsafeAttribute
    ( { key: "click", value: cb' (Cb (const value)) } <$ _
    )

instance Attr anything OnClick (Event.Event (Effect Boolean)) where
  attr OnClick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const value)) }

instance Attr everything OnClick Unit where
  attr OnClick _ = unsafeAttribute ({ key: "click", value: unset' } <$ _)

instance Attr everything OnClick (Event.Event Unit) where
  attr OnClick eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "click", value: unset' }
