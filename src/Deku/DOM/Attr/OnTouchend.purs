module Deku.DOM.Attr.OnTouchend where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchend = OnTouchend

instance Attr anything OnTouchend Cb where
  attr OnTouchend bothValues = unsafeAttribute $ Both
    { key: "touchend", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "touchend", value: cb' value })
  pureAttr OnTouchend value = unsafeAttribute $ This
    { key: "touchend", value: cb' value }
  unpureAttr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' value }

instance Attr anything OnTouchend (Effect Unit) where
  attr OnTouchend bothValues = unsafeAttribute $ Both
    { key: "touchend", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTouchend value = unsafeAttribute $ This
    { key: "touchend", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchend (Effect Boolean) where
  attr OnTouchend bothValues = unsafeAttribute $ Both
    { key: "touchend", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const value)) }
    )
  pureAttr OnTouchend value = unsafeAttribute $ This
    { key: "touchend", value: cb' (Cb (const value)) }
  unpureAttr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const value)) }

type OnTouchendEffect =
  forall element
   . Attr element OnTouchend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchend Unit where
  attr OnTouchend bothValues = unsafeAttribute $ Both
    { key: "touchend", value: unset' }
    (snd bothValues <#> \_ -> { key: "touchend", value: unset' })
  pureAttr OnTouchend _ = unsafeAttribute $ This
    { key: "touchend", value: unset' }
  unpureAttr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchend", value: unset' }
