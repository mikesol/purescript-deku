module Deku.DOM.Attr.OnMouseenter where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseenter = OnMouseenter

instance Attr anything OnMouseenter (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both
    { key: "mouseenter", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseenter", value: cb' value })
instance Attr anything OnMouseenter  Cb  where
  attr OnMouseenter value = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseenter (Event.Event  Cb ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' value }

instance Attr anything OnMouseenter (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both
    { key: "mouseenter", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseenter  (Effect Unit)  where
  attr OnMouseenter value = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseenter (Event.Event  (Effect Unit) ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseenter (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both
    { key: "mouseenter", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseenter  (Effect Boolean)  where
  attr OnMouseenter value = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: cb' (Cb (const value)) }
instance Attr anything OnMouseenter (Event.Event  (Effect Boolean) ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const value)) }

type OnMouseenterEffect =
  forall element
   . Attr element OnMouseenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseenter (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseenter bothValues = unsafeAttribute $ Both
    { key: "mouseenter", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseenter", value: unset' })
instance Attr everything OnMouseenter  Unit  where
  attr OnMouseenter _ = unsafeAttribute $ This $ pure $
    { key: "mouseenter", value: unset' }
instance Attr everything OnMouseenter (Event.Event  Unit ) where
  attr OnMouseenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseenter", value: unset' }
