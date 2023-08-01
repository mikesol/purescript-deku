module Deku.DOM.Attr.OnSeeked where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSeeked = OnSeeked

instance Attr anything OnSeeked Cb where
  attr OnSeeked bothValues = unsafeAttribute $ Both
    { key: "seeked", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "seeked", value: cb' value })
  pureAttr OnSeeked value = unsafeAttribute $ This
    { key: "seeked", value: cb' value }
  unpureAttr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (Effect Unit) where
  attr OnSeeked bothValues = unsafeAttribute $ Both
    { key: "seeked", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnSeeked value = unsafeAttribute $ This
    { key: "seeked", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (Effect Boolean) where
  attr OnSeeked bothValues = unsafeAttribute $ Both
    { key: "seeked", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const value)) }
    )
  pureAttr OnSeeked value = unsafeAttribute $ This
    { key: "seeked", value: cb' (Cb (const value)) }
  unpureAttr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const value)) }

type OnSeekedEffect =
  forall element
   . Attr element OnSeeked (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeked Unit where
  attr OnSeeked bothValues = unsafeAttribute $ Both
    { key: "seeked", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "seeked", value: unset' })
  pureAttr OnSeeked _ = unsafeAttribute $ This { key: "seeked", value: unset' }
  unpureAttr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "seeked", value: unset' }
