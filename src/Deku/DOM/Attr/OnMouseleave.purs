module Deku.DOM.Attr.OnMouseleave where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseleave = OnMouseleave

instance Attr anything OnMouseleave Cb where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseleave", value: cb' value })
  pureAttr OnMouseleave value = unsafeAttribute $ This
    { key: "mouseleave", value: cb' value }
  unpureAttr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' value }

instance Attr anything OnMouseleave (Effect Unit) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnMouseleave value = unsafeAttribute $ This
    { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseleave (Effect Boolean) where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseleave", value: cb' (Cb (const value)) }
    )
  pureAttr OnMouseleave value = unsafeAttribute $ This
    { key: "mouseleave", value: cb' (Cb (const value)) }
  unpureAttr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const value)) }

type OnMouseleaveEffect =
  forall element
   . Attr element OnMouseleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseleave Unit where
  attr OnMouseleave bothValues = unsafeAttribute $ Both
    { key: "mouseleave", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseleave", value: unset' })
  pureAttr OnMouseleave _ = unsafeAttribute $ This
    { key: "mouseleave", value: unset' }
  unpureAttr OnMouseleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseleave", value: unset' }
