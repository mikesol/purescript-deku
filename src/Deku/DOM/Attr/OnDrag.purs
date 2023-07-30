module Deku.DOM.Attr.OnDrag where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDrag = OnDrag

instance Attr anything OnDrag Cb where
  attr OnDrag bothValues = unsafeAttribute $ Both
    { key: "drag", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "drag", value: cb' value })
  pureAttr OnDrag value = unsafeAttribute $ This
    { key: "drag", value: cb' value }
  unpureAttr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' value }

instance Attr anything OnDrag (Effect Unit) where
  attr OnDrag bothValues = unsafeAttribute $ Both
    { key: "drag", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDrag value = unsafeAttribute $ This
    { key: "drag", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrag (Effect Boolean) where
  attr OnDrag bothValues = unsafeAttribute $ Both
    { key: "drag", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const value)) }
    )
  pureAttr OnDrag value = unsafeAttribute $ This
    { key: "drag", value: cb' (Cb (const value)) }
  unpureAttr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const value)) }

type OnDragEffect =
  forall element. Attr element OnDrag (Effect Unit) => Event (Attribute element)

instance Attr everything OnDrag Unit where
  attr OnDrag bothValues = unsafeAttribute $ Both { key: "drag", value: unset' }
    (snd bothValues <#> \_ -> { key: "drag", value: unset' })
  pureAttr OnDrag _ = unsafeAttribute $ This { key: "drag", value: unset' }
  unpureAttr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "drag", value: unset' }
