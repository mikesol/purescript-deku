module Deku.DOM.Attr.OnTouchmove where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove Cb where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "touchmove", value: cb' value })
  pureAttr OnTouchmove value = unsafeAttribute $ This
    { key: "touchmove", value: cb' value }
  unpureAttr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' value }

instance Attr anything OnTouchmove (Effect Unit) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTouchmove value = unsafeAttribute $ This
    { key: "touchmove", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (Effect Boolean) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const value)) }
    )
  pureAttr OnTouchmove value = unsafeAttribute $ This
    { key: "touchmove", value: cb' (Cb (const value)) }
  unpureAttr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const value)) }

type OnTouchmoveEffect =
  forall element
   . Attr element OnTouchmove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchmove Unit where
  attr OnTouchmove bothValues = unsafeAttribute $ Both
    { key: "touchmove", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchmove", value: unset' })
  pureAttr OnTouchmove _ = unsafeAttribute $ This
    { key: "touchmove", value: unset' }
  unpureAttr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchmove", value: unset' }
