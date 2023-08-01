module Deku.DOM.Attr.OnDragenter where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragenter = OnDragenter

instance Attr anything OnDragenter Cb where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dragenter", value: cb' value })
  pureAttr OnDragenter value = unsafeAttribute $ This
    { key: "dragenter", value: cb' value }
  unpureAttr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragenter", value: cb' value }

instance Attr anything OnDragenter (Effect Unit) where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragenter", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDragenter value = unsafeAttribute $ This
    { key: "dragenter", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragenter (Effect Boolean) where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragenter", value: cb' (Cb (const value)) }
    )
  pureAttr OnDragenter value = unsafeAttribute $ This
    { key: "dragenter", value: cb' (Cb (const value)) }
  unpureAttr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const value)) }

type OnDragenterEffect =
  forall element
   . Attr element OnDragenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragenter Unit where
  attr OnDragenter bothValues = unsafeAttribute $ Both
    { key: "dragenter", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragenter", value: unset' })
  pureAttr OnDragenter _ = unsafeAttribute $ This
    { key: "dragenter", value: unset' }
  unpureAttr OnDragenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragenter", value: unset' }
