module Deku.DOM.Attr.OnDragover where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragover = OnDragover

instance Attr anything OnDragover (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dragover", value: cb' value })
instance Attr anything OnDragover  Cb  where
  attr OnDragover value = unsafeAttribute $ This $ pure $
    { key: "dragover", value: cb' value }
instance Attr anything OnDragover (Event.Event  Cb ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' value }

instance Attr anything OnDragover (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragover  (Effect Unit)  where
  attr OnDragover value = unsafeAttribute $ This $ pure $
    { key: "dragover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragover (Event.Event  (Effect Unit) ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragover (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragover  (Effect Boolean)  where
  attr OnDragover value = unsafeAttribute $ This $ pure $
    { key: "dragover", value: cb' (Cb (const value)) }
instance Attr anything OnDragover (Event.Event  (Effect Boolean) ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const value)) }

type OnDragoverEffect =
  forall element
   . Attr element OnDragover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragover (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragover bothValues = unsafeAttribute $ Both
    { key: "dragover", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragover", value: unset' })
instance Attr everything OnDragover  Unit  where
  attr OnDragover _ = unsafeAttribute $ This $ pure $
    { key: "dragover", value: unset' }
instance Attr everything OnDragover (Event.Event  Unit ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragover", value: unset' }
