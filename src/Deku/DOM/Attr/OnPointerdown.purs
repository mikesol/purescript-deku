module Deku.DOM.Attr.OnPointerdown where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerdown = OnPointerdown

instance Attr anything OnPointerdown Cb where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "pointerdown", value: cb' value })
  pureAttr OnPointerdown value = unsafeAttribute $ This
    { key: "pointerdown", value: cb' value }
  unpureAttr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' value }

instance Attr anything OnPointerdown (Effect Unit) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerdown value = unsafeAttribute $ This
    { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerdown (Effect Boolean) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerdown value = unsafeAttribute $ This
    { key: "pointerdown", value: cb' (Cb (const value)) }
  unpureAttr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const value)) }

type OnPointerdownEffect =
  forall element
   . Attr element OnPointerdown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerdown Unit where
  attr OnPointerdown bothValues = unsafeAttribute $ Both
    { key: "pointerdown", value: unset' }
    (snd bothValues <#> \_ -> { key: "pointerdown", value: unset' })
  pureAttr OnPointerdown _ = unsafeAttribute $ This
    { key: "pointerdown", value: unset' }
  unpureAttr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerdown", value: unset' }
