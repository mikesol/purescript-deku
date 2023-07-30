module Deku.DOM.Attr.OnMousedown where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousedown = OnMousedown

instance Attr anything OnMousedown Cb where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "mousedown", value: cb' value })
  pureAttr OnMousedown value = unsafeAttribute $ This
    { key: "mousedown", value: cb' value }
  unpureAttr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' value }

instance Attr anything OnMousedown (Effect Unit) where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnMousedown value = unsafeAttribute $ This
    { key: "mousedown", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousedown (Effect Boolean) where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const value)) }
    )
  pureAttr OnMousedown value = unsafeAttribute $ This
    { key: "mousedown", value: cb' (Cb (const value)) }
  unpureAttr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const value)) }

type OnMousedownEffect =
  forall element
   . Attr element OnMousedown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousedown Unit where
  attr OnMousedown bothValues = unsafeAttribute $ Both
    { key: "mousedown", value: unset' }
    (snd bothValues <#> \_ -> { key: "mousedown", value: unset' })
  pureAttr OnMousedown _ = unsafeAttribute $ This
    { key: "mousedown", value: unset' }
  unpureAttr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousedown", value: unset' }
