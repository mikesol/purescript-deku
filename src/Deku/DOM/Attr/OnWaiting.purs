module Deku.DOM.Attr.OnWaiting where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnWaiting = OnWaiting

instance Attr anything OnWaiting Cb where
  attr OnWaiting bothValues = unsafeAttribute $ Both
    { key: "waiting", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "waiting", value: cb' value })
  pureAttr OnWaiting value = unsafeAttribute $ This
    { key: "waiting", value: cb' value }
  unpureAttr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "waiting", value: cb' value }

instance Attr anything OnWaiting (Effect Unit) where
  attr OnWaiting bothValues = unsafeAttribute $ Both
    { key: "waiting", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "waiting", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnWaiting value = unsafeAttribute $ This
    { key: "waiting", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWaiting (Effect Boolean) where
  attr OnWaiting bothValues = unsafeAttribute $ Both
    { key: "waiting", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "waiting", value: cb' (Cb (const value)) }
    )
  pureAttr OnWaiting value = unsafeAttribute $ This
    { key: "waiting", value: cb' (Cb (const value)) }
  unpureAttr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const value)) }

type OnWaitingEffect =
  forall element
   . Attr element OnWaiting (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWaiting Unit where
  attr OnWaiting bothValues = unsafeAttribute $ Both
    { key: "waiting", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "waiting", value: unset' })
  pureAttr OnWaiting _ = unsafeAttribute $ This
    { key: "waiting", value: unset' }
  unpureAttr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "waiting", value: unset' }
