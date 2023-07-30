module Deku.DOM.Attr.OnPointerenter where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter Cb where
  attr OnPointerenter bothValues = unsafeAttribute $ Both
    { key: "pointerenter", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "pointerenter", value: cb' value })
  pureAttr OnPointerenter value = unsafeAttribute $ This
    { key: "pointerenter", value: cb' value }
  unpureAttr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (Effect Unit) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both
    { key: "pointerenter", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerenter value = unsafeAttribute $ This
    { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (Effect Boolean) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both
    { key: "pointerenter", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerenter value = unsafeAttribute $ This
    { key: "pointerenter", value: cb' (Cb (const value)) }
  unpureAttr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const value)) }

type OnPointerenterEffect =
  forall element
   . Attr element OnPointerenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerenter Unit where
  attr OnPointerenter bothValues = unsafeAttribute $ Both
    { key: "pointerenter", value: unset' }
    (snd bothValues <#> \_ -> { key: "pointerenter", value: unset' })
  pureAttr OnPointerenter _ = unsafeAttribute $ This
    { key: "pointerenter", value: unset' }
  unpureAttr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerenter", value: unset' }
