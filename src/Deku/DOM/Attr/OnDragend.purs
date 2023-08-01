module Deku.DOM.Attr.OnDragend where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragend = OnDragend

instance Attr anything OnDragend Cb where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dragend", value: cb' value })
  pureAttr OnDragend value = unsafeAttribute $ This
    { key: "dragend", value: cb' value }
  unpureAttr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' value }

instance Attr anything OnDragend (Effect Unit) where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDragend value = unsafeAttribute $ This
    { key: "dragend", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragend (Effect Boolean) where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const value)) }
    )
  pureAttr OnDragend value = unsafeAttribute $ This
    { key: "dragend", value: cb' (Cb (const value)) }
  unpureAttr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const value)) }

type OnDragendEffect =
  forall element
   . Attr element OnDragend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragend Unit where
  attr OnDragend bothValues = unsafeAttribute $ Both
    { key: "dragend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragend", value: unset' })
  pureAttr OnDragend _ = unsafeAttribute $ This
    { key: "dragend", value: unset' }
  unpureAttr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragend", value: unset' }
