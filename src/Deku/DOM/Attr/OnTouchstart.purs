module Deku.DOM.Attr.OnTouchstart where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchstart = OnTouchstart

instance Attr anything OnTouchstart Cb where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "touchstart", value: cb' value })
  pureAttr OnTouchstart value = unsafeAttribute $ This
    { key: "touchstart", value: cb' value }
  unpureAttr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' value }

instance Attr anything OnTouchstart (Effect Unit) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTouchstart value = unsafeAttribute $ This
    { key: "touchstart", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchstart (Effect Boolean) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const value)) }
    )
  pureAttr OnTouchstart value = unsafeAttribute $ This
    { key: "touchstart", value: cb' (Cb (const value)) }
  unpureAttr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const value)) }

type OnTouchstartEffect =
  forall element
   . Attr element OnTouchstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchstart Unit where
  attr OnTouchstart bothValues = unsafeAttribute $ Both
    { key: "touchstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchstart", value: unset' })
  pureAttr OnTouchstart _ = unsafeAttribute $ This
    { key: "touchstart", value: unset' }
  unpureAttr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchstart", value: unset' }
