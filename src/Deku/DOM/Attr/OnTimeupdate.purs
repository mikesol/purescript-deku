module Deku.DOM.Attr.OnTimeupdate where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both
    { key: "timeupdate", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "timeupdate", value: cb' value })
  pureAttr OnTimeupdate value = unsafeAttribute $ This
    { key: "timeupdate", value: cb' value }
  unpureAttr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' value }

instance Attr anything OnTimeupdate (Effect Unit) where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both
    { key: "timeupdate", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "timeupdate", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTimeupdate value = unsafeAttribute $ This
    { key: "timeupdate", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTimeupdate (Effect Boolean) where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both
    { key: "timeupdate", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "timeupdate", value: cb' (Cb (const value)) }
    )
  pureAttr OnTimeupdate value = unsafeAttribute $ This
    { key: "timeupdate", value: cb' (Cb (const value)) }
  unpureAttr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const value)) }

type OnTimeupdateEffect =
  forall element
   . Attr element OnTimeupdate (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTimeupdate Unit where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both
    { key: "timeupdate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "timeupdate", value: unset' })
  pureAttr OnTimeupdate _ = unsafeAttribute $ This
    { key: "timeupdate", value: unset' }
  unpureAttr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "timeupdate", value: unset' }
