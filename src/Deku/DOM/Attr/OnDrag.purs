module Deku.DOM.Attr.OnDrag where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDrag = OnDrag

instance Attr anything OnDrag (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDrag bothValues = unsafeAttribute $ Both
    { key: "drag", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "drag", value: cb' value })
instance Attr anything OnDrag  Cb  where
  attr OnDrag value = unsafeAttribute $ This $ pure $
    { key: "drag", value: cb' value }
instance Attr anything OnDrag (Event.Event  Cb ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' value }

instance Attr anything OnDrag (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDrag bothValues = unsafeAttribute $ Both
    { key: "drag", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDrag  (Effect Unit)  where
  attr OnDrag value = unsafeAttribute $ This $ pure $
    { key: "drag", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrag (Event.Event  (Effect Unit) ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrag (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDrag bothValues = unsafeAttribute $ Both
    { key: "drag", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDrag  (Effect Boolean)  where
  attr OnDrag value = unsafeAttribute $ This $ pure $
    { key: "drag", value: cb' (Cb (const value)) }
instance Attr anything OnDrag (Event.Event  (Effect Boolean) ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const value)) }

type OnDragEffect =
  forall element. Attr element OnDrag (Effect Unit) => Event (Attribute element)

instance Attr everything OnDrag (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDrag bothValues = unsafeAttribute $ Both { key: "drag", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "drag", value: unset' })
instance Attr everything OnDrag  Unit  where
  attr OnDrag _ = unsafeAttribute $ This $ pure $ { key: "drag", value: unset' }
instance Attr everything OnDrag (Event.Event  Unit ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "drag", value: unset' }
