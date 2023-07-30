module Deku.DOM.Attr.OnTouchcancel where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel Cb where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "touchcancel", value: cb' value })
  pureAttr OnTouchcancel value = unsafeAttribute $ This
    { key: "touchcancel", value: cb' value }
  unpureAttr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' value }

instance Attr anything OnTouchcancel (Effect Unit) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTouchcancel value = unsafeAttribute $ This
    { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchcancel (Effect Boolean) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const value)) }
    )
  pureAttr OnTouchcancel value = unsafeAttribute $ This
    { key: "touchcancel", value: cb' (Cb (const value)) }
  unpureAttr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const value)) }

type OnTouchcancelEffect =
  forall element
   . Attr element OnTouchcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchcancel Unit where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both
    { key: "touchcancel", value: unset' }
    (snd bothValues <#> \_ -> { key: "touchcancel", value: unset' })
  pureAttr OnTouchcancel _ = unsafeAttribute $ This
    { key: "touchcancel", value: unset' }
  unpureAttr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchcancel", value: unset' }
