module Deku.DOM.Attr.OnPointercancel where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointercancel = OnPointercancel

instance Attr anything OnPointercancel Cb where
  attr OnPointercancel bothValues = unsafeAttribute $ Both
    { key: "pointercancel", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "pointercancel", value: cb' value })
  pureAttr OnPointercancel value = unsafeAttribute $ This
    { key: "pointercancel", value: cb' value }
  unpureAttr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' value }

instance Attr anything OnPointercancel (Effect Unit) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both
    { key: "pointercancel", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointercancel value = unsafeAttribute $ This
    { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointercancel (Effect Boolean) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both
    { key: "pointercancel", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointercancel value = unsafeAttribute $ This
    { key: "pointercancel", value: cb' (Cb (const value)) }
  unpureAttr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' (Cb (const value)) }

type OnPointercancelEffect =
  forall element
   . Attr element OnPointercancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointercancel Unit where
  attr OnPointercancel bothValues = unsafeAttribute $ Both
    { key: "pointercancel", value: unset' }
    (snd bothValues <#> \_ -> { key: "pointercancel", value: unset' })
  pureAttr OnPointercancel _ = unsafeAttribute $ This
    { key: "pointercancel", value: unset' }
  unpureAttr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "pointercancel", value: unset' }
