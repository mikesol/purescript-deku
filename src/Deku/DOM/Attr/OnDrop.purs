module Deku.DOM.Attr.OnDrop where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDrop = OnDrop

instance Attr anything OnDrop Cb where
  attr OnDrop bothValues = unsafeAttribute $ Both
    { key: "drop", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "drop", value: cb' value })
  pureAttr OnDrop value = unsafeAttribute $ This
    { key: "drop", value: cb' value }
  unpureAttr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drop", value: cb' value }

instance Attr anything OnDrop (Effect Unit) where
  attr OnDrop bothValues = unsafeAttribute $ Both
    { key: "drop", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drop", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDrop value = unsafeAttribute $ This
    { key: "drop", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drop", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrop (Effect Boolean) where
  attr OnDrop bothValues = unsafeAttribute $ Both
    { key: "drop", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drop", value: cb' (Cb (const value)) }
    )
  pureAttr OnDrop value = unsafeAttribute $ This
    { key: "drop", value: cb' (Cb (const value)) }
  unpureAttr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drop", value: cb' (Cb (const value)) }

type OnDropEffect =
  forall element. Attr element OnDrop (Effect Unit) => Event (Attribute element)

instance Attr everything OnDrop Unit where
  attr OnDrop bothValues = unsafeAttribute $ Both { key: "drop", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "drop", value: unset' })
  pureAttr OnDrop _ = unsafeAttribute $ This { key: "drop", value: unset' }
  unpureAttr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "drop", value: unset' }
